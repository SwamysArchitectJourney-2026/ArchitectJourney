---
learning_level: "Advanced"
prerequisites: ["./03_Implementation-Plan.md"]
estimated_time: "20 minutes"
learning_objectives:
  - "Implement a scalable Signaling Server using ASP.NET Core and SignalR"
  - "Manage ephemeral room state with Redis"
  - "Secure signaling with JWT and short-lived tokens"
related_topics:
  builds_upon: ["./03_Implementation-Plan.md"]
  enables: ["./04_Code-Walkthrough-Part1-B.md"]
---

# Code Walkthrough: Signaling Service (.NET 8)

This section details the core implementation of the **Control Plane**. We use **ASP.NET Core SignalR** for real-time WebSocket communication and **Redis** for distributed state.

## 1. Project Structure

```text
src/VideoSignaling.Api/
├── Hubs/
│   └── SignalingHub.cs       # The WebSocket endpoint
├── Services/
│   ├── TokenService.cs       # JWT & TURN credential generation
│   └── RedisRoomStore.cs     # Ephemeral state management
├── Models/
│   ├── SdpOffer.cs
│   └── Participant.cs
└── Program.cs                # App configuration
```

## 2. The Signaling Hub

The `SignalingHub` handles client connections, room joins, and routes WebRTC signaling messages (SDP Offers/Answers, ICE Candidates).

```csharp
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;

[Authorize] // Requires valid JWT Join Token
public class SignalingHub : Hub
{
    private readonly IRoomStore _roomStore;

    public SignalingHub(IRoomStore roomStore)
    {
        _roomStore = roomStore;
    }

    public async Task JoinRoom(string roomId, string displayName)
    {
        var userId = Context.UserIdentifier;
        var connectionId = Context.ConnectionId;

        // 1. Persist participant in Redis
        var participant = new Participant 
        { 
            UserId = userId, 
            DisplayName = displayName, 
            ConnectionId = connectionId 
        };
        await _roomStore.AddParticipantAsync(roomId, participant);

        // 2. Add to SignalR Group for broadcasting
        await Groups.AddToGroupAsync(connectionId, roomId);

        // 3. Notify others in the room
        await Clients.GroupExcept(roomId, connectionId)
            .SendAsync("ParticipantJoined", participant);

        // 4. Send assigned SFU endpoint to the caller
        var sfuUrl = await _roomStore.GetAssignedSfuAsync(roomId);
        await Clients.Caller.SendAsync("SfuAssigned", sfuUrl);
    }

    // Route WebRTC Signaling messages directly to target peer (or SFU)
    public async Task SendOffer(string targetConnectionId, object offer)
    {
        await Clients.Client(targetConnectionId)
            .SendAsync("ReceiveOffer", Context.ConnectionId, offer);
    }

    public async Task SendIceCandidate(string targetConnectionId, object candidate)
    {
        await Clients.Client(targetConnectionId)
            .SendAsync("ReceiveIceCandidate", Context.ConnectionId, candidate);
    }

    public override async Task OnDisconnectedAsync(Exception? exception)
    {
        // Handle graceful disconnect
        // Note: In production, use a background job to clean up stale Redis keys
        await base.OnDisconnectedAsync(exception);
    }
}
```

## 3. Distributed State (Redis)

Since we scale the Signaling Service horizontally (multiple pods), we cannot store room state in memory. We use Redis.

```csharp
public class RedisRoomStore : IRoomStore
{
    private readonly IDatabase _db;

    public RedisRoomStore(IConnectionMultiplexer redis)
    {
        _db = redis.GetDatabase();
    }

    public async Task AddParticipantAsync(string roomId, Participant p)
    {
        // Store as a Hash: room:{id}:participants
        var key = $"room:{roomId}:participants";
        await _db.HashSetAsync(key, p.UserId, JsonSerializer.Serialize(p));
        
        // Set TTL to prevent orphaned keys (e.g., 24 hours)
        await _db.KeyExpireAsync(key, TimeSpan.FromHours(24));
    }

    public async Task<string> GetAssignedSfuAsync(string roomId)
    {
        // Sticky assignment: Once a room is assigned an SFU, it stays there
        var key = $"room:{roomId}:sfu";
        var sfu = await _db.StringGetAsync(key);
        
        if (sfu.IsNullOrEmpty)
        {
            // Simple load balancing: Pick random or least-loaded SFU
            sfu = "sfu-01.region-eu.internal"; 
            await _db.StringSetAsync(key, sfu);
        }
        return sfu;
    }
}
```

## 4. Security: Token Service

We issue short-lived JWTs for joining rooms and ephemeral credentials for TURN servers (COTURN).

```csharp
public class TokenService : ITokenService
{
    public string GenerateTurnCredentials(string username, int ttlSeconds)
    {
        // Standard TURN REST API format
        // username = timestamp:userid
        // password = HMAC_SHA1(secret, username)
        
        long expiry = DateTimeOffset.UtcNow.ToUnixTimeSeconds() + ttlSeconds;
        string turnUser = $"{expiry}:{username}";
        
        using var hmac = new HMACSHA1(Encoding.UTF8.GetBytes(_turnSecret));
        string password = Convert.ToBase64String(
            hmac.ComputeHash(Encoding.UTF8.GetBytes(turnUser))
        );

        return new TurnCredentials { Username = turnUser, Password = password };
    }
}
```
