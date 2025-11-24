---
learning_level: "Intermediate"
prerequisites: ["C# async/await basics", "Understanding of asynchronous programming", "Task-based programming"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand CA2007 code analysis rule and synchronization context"
  - "Apply ConfigureAwait(false) correctly in library code"
  - "Identify when to suppress CA2007 (Blazor, SignalR)"
  - "Understand disposal patterns for async resources"
related_topics:
  prerequisites: []
  builds_upon: ["../01_Code-Analysis-CA1001-Disposable.md", "../02_Code-Analysis-CA1308-ToUpperInvariant.md"]
  enables: []
  cross_refs: []
---

# CA2007 ConfigureAwait Fixes

## Overview

This document explains CA2007 warnings ("Consider calling ConfigureAwait on the awaited task") and provides guidance on when and how to fix them.

## What is CA2007?

CA2007 is a .NET code analysis rule that recommends calling `ConfigureAwait(false)` on awaited tasks in library code. This prevents unnecessary synchronization context capture, which can lead to:

- **Deadlocks** in certain scenarios (especially in library code)
- **Performance overhead** from capturing and restoring the synchronization context
- **Unnecessary thread affinity** that can reduce scalability

## Understanding Synchronization Context

The synchronization context is a mechanism that allows code to resume on a specific thread (e.g., the UI thread in WinForms/WPF or the Blazor render thread). By default, `await` captures this context and resumes on it.

- **In UI applications**: The sync context ensures UI updates happen on the UI thread
- **In library code**: Capturing the sync context is unnecessary and can cause deadlocks
- **In ASP.NET Core**: There's no synchronization context by default, but using `ConfigureAwait(false)` is still recommended

## When to Use ConfigureAwait(false)

✅ **Use in:**
- Library/Service code
- API Controllers (traditional and minimal API)
- Infrastructure/Middleware
- Data Access Layers

❌ **Suppress for:**
- Blazor Components (`.razor`, `.razor.cs`)
- SignalR Hubs
- Blazor Services (where sync context may be needed)

## Implementation Pattern

### Library/Service Code
```csharp
public async Task ProcessAsync()
{
    await repository.SaveAsync(data).ConfigureAwait(false);
    await service.ProcessAsync().ConfigureAwait(false);
}
```

### API Controllers
```csharp
[HttpGet]
public async Task<IActionResult> GetData()
{
    var data = await service.GetDataAsync().ConfigureAwait(false);
    return Ok(data);
}
```

### Minimal API
```csharp
app.MapGet("/data", async () =>
{
    var data = await service.GetDataAsync().ConfigureAwait(false);
    return Results.Ok(data);
});
```

## Disposal Patterns

### IAsyncDisposable (use await using)
```csharp
await using var connection = new NpgsqlConnection(connectionString);
await connection.OpenAsync().ConfigureAwait(false);
```

### IDisposable (use regular using)
```csharp
using var stream = file.OpenReadStream();
// Stream implements IDisposable, not IAsyncDisposable
```

## Common Pitfalls

### Pitfall 1: Using await using on IDisposable-only types
```csharp
// ❌ Wrong: Stream doesn't implement IAsyncDisposable
await using var stream = file.OpenReadStream();

// ✅ Correct: Use regular using for IDisposable
using var stream = file.OpenReadStream();
```

### Pitfall 2: Forgetting ConfigureAwait(false) in library code
```csharp
// ❌ Wrong: Missing ConfigureAwait(false)
public async Task ProcessAsync()
{
    await repository.SaveAsync(data);
}

// ✅ Correct: Always use ConfigureAwait(false) in library code
public async Task ProcessAsync()
{
    await repository.SaveAsync(data).ConfigureAwait(false);
}
```

### Pitfall 3: Using ConfigureAwait(false) in Blazor components
```csharp
// ❌ Wrong: Blazor components need sync context
@code {
    private async Task LoadData()
    {
        await service.LoadAsync().ConfigureAwait(false); // Breaks UI updates!
        StateHasChanged(); // May not work correctly
    }
}

// ✅ Correct: Let Blazor handle sync context
@code {
    private async Task LoadData()
    {
        await service.LoadAsync(); // Sync context preserved
        StateHasChanged(); // Works correctly
    }
}
```

## Best Practices

1. **Library/Service Code**: Always use `ConfigureAwait(false)` on awaited tasks
2. **API Controllers**: Always use `ConfigureAwait(false)` on awaited tasks
3. **Minimal API Endpoints**: Always use `ConfigureAwait(false)` on awaited tasks
4. **Infrastructure/Middleware**: Always use `ConfigureAwait(false)` on awaited tasks
5. **Data Access Layers**: Always use `ConfigureAwait(false)` on awaited tasks
6. **Blazor Components**: Suppress CA2007 (they need sync context)
7. **SignalR Hubs**: Suppress CA2007 (they need sync context)
8. **Disposal Patterns**: 
   - Use `await using` for types implementing `IAsyncDisposable`
   - Use regular `using` for types implementing only `IDisposable`

## References

- [Microsoft Docs: CA2007](https://learn.microsoft.com/dotnet/fundamentals/code-analysis/quality-rules/ca2007)
- [ConfigureAwait FAQ by Stephen Toub](https://devblogs.microsoft.com/dotnet/configureawait-faq/)
- [ASP.NET Core Synchronization Context](https://learn.microsoft.com/aspnet/core/fundamentals/servers/kestrel)
- [IAsyncDisposable Interface](https://learn.microsoft.com/dotnet/api/system.iasyncdisposable)

