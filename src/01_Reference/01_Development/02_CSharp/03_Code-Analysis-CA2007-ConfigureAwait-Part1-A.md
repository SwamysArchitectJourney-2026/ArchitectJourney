---
learning_level: "Intermediate"
prerequisites: ["C# async/await basics", "Understanding of asynchronous programming", "Task-based programming"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand CA2007 code analysis rule and synchronization context"
  - "Apply ConfigureAwait(false) correctly in library code"
  - "Identify when to use ConfigureAwait(false) vs when to suppress"
related_topics:
  prerequisites: []
  builds_upon: ["../01_Code-Analysis-CA1001-Disposable.md", "../02_Code-Analysis-CA1308-ToUpperInvariant.md"]
  enables: ["./03_Code-Analysis-CA2007-ConfigureAwait-Part1-B.md"]
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

## 🔗 Related Documents

- [Part 1-B: Disposal Patterns and Pitfalls](./03_Code-Analysis-CA2007-ConfigureAwait-Part1-B.md) - Disposal patterns, common pitfalls, and best practices
- [CA1001 Disposable](./01_Code-Analysis-CA1001-Disposable.md) - IDisposable implementation
- [CA1308 ToUpperInvariant](./02_Code-Analysis-CA1308-ToUpperInvariant.md) - String normalization

