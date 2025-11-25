---
learning_level: "Intermediate"
prerequisites: ["Understanding of CA2007 and ConfigureAwait basics", "C# async/await patterns"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand disposal patterns for async resources"
  - "Identify and avoid common ConfigureAwait pitfalls"
  - "Apply best practices for ConfigureAwait in different scenarios"
related_topics:
  prerequisites: ["./03_Code-Analysis-CA2007-ConfigureAwait-Part1-A.md"]
  builds_upon: []
  enables: []
  cross_refs: []
---

# CA2007 ConfigureAwait: Disposal Patterns and Pitfalls

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

## 🔗 Related Documents

- [Part 1-A: Overview and Implementation](./03_Code-Analysis-CA2007-ConfigureAwait-Part1-A.md) - CA2007 overview and implementation patterns
- [CA1001 Disposable](./01_Code-Analysis-CA1001-Disposable.md) - IDisposable implementation
- [CA1308 ToUpperInvariant](./02_Code-Analysis-CA1308-ToUpperInvariant.md) - String normalization

