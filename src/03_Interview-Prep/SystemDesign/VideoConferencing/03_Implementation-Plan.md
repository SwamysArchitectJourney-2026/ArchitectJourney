---
learning_level: "Advanced"
prerequisites: ["./02_Detailed-Design-Part1-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Define the implementation strategy and technology stack"
  - "Link to the external code repository"
related_topics:
  builds_upon: ["./02_Detailed-Design-Part1-B.md"]
---

# Implementation Plan & Code Repository

## 1. Technology Stack Selection

Based on the architecture, the following stack is selected for implementation:

* **Backend**: .NET 8 / C# (High performance, strong Azure integration).
* **Frontend**: React + TypeScript (Rich UI ecosystem).
* **Real-time**: SignalR (Signaling) + LiveKit or Azure Communication Services (Media/WebRTC).
* **Database**: PostgreSQL (via Azure Database for PostgreSQL).
* **AI Integration**: Azure OpenAI SDK + Azure Speech SDK.
* **Infrastructure**: Terraform / Bicep for Azure AKS deployment.

## 2. Repository Structure Strategy

We will use a **Polyrepo** approach where the implementation lives in a dedicated repository, separate from this educational content.

### Planned Folder Structure (Implementation Repo)

```text
src/
├── Client/                 # React Web App
├── Services/
│   ├── Identity/           # Auth Service
│   ├── Meeting/            # Meeting Management API
│   ├── Signaling/          # SignalR Hubs
│   └── AI/                 # AI Processing Worker
├── Infrastructure/         # IaC (Bicep/Terraform)
└── Tests/                  # Unit and Integration Tests
```

## 3. Code Repository Link

The full implementation of this system design is maintained in the following repository:

> **🔗 [Link to Implementation Repository]**
> *(Placeholder: User to update this link after creating the new repo)*

## 4. Next Steps

1. **Initialize Repo**: Create the new GitHub repository.
2. **Scaffold Solution**: Set up the .NET solution and React project.
3. **Core API**: Implement the Meeting Management APIs defined in `02_Detailed-Design-Part1-A.md`.
4. **Link Back**: Update the link above to point to the live code.

## 5. Future Phases

* **Phase 2: Advanced Connectivity**: Implement STUN/TURN server configuration (coturn) or integrate Azure Communication Services for reliable NAT traversal.
* **Phase 3: Group Scaling**: Implement SFU logic for supporting >5 participants.
* **Phase 4: Live Streaming**: Add RTMP ingest and HLS delivery for one-to-many broadcasting.
