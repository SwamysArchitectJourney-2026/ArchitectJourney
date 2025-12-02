---
learning_level: "Advanced"
prerequisites: ["./09_System-Design-Questions-Part1-B-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Reduce latency for RAG systems"
  - "Integrate .NET microservices with AKS model services"
  - "Master quick interview delivery tips"
related_topics:
  prerequisites: ["./09_System-Design-Questions-Part1-B-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./10_System-Design-Cheat-Sheet.md"]
  cross_refs: []
---

# System Design Questions - Part 2-B

**Advanced system design questions** covering RAG latency and .NET integration.

---

## Q9: Reducing Latency for RAG

**Ask:** Make RAG fast at inference time.

**Goal:** Minimize end-to-end retrieval + generation latency.

### ASCII Architecture Diagram

```
Client → API → RAG Orchestrator
         |
     +---+---+
     |       |
  Vector DB  Embedding Service (precomputed)
     |       |
  Fast Cache (Redis) for top-k
     |
  LLM (OpenAI / AKS) → Response
```

### What to Say

> "Precompute embeddings and keep them in a high-performance vector store, cache top-k retrievals in Redis, reduce k, and use lighter contextual windows. Use approximate nearest neighbor indexes (tuned) and local replicas close to compute. Warm LLM instances and use async streaming if acceptable."

### NFRs / Knobs

- k-size (retrieval count)
- Index tuning
- Cache TTL
- Embedding refresh cadence
- SLOs for RAG steps

### Trade-offs

- Smaller k reduces latency but may hurt relevance
- Stronger caching reduces freshness

---

## Q10: Integrating .NET Microservices with AKS Model Services

**Ask:** How to design interaction patterns between .NET services and model endpoints.

**Goal:** Reliable, versioned, and scalable integration.

### ASCII Architecture Diagram

```
.NET Service (AKS CPU)
   |
Circuit Breaker / Retry
   |
Auth (Managed Identity) → APIM
   |
Model Endpoint (AKS GPU or OpenAI)
   |
Response Validation → Business Logic
```

### What to Say

> "Use a thin AI-orchestration layer in .NET that handles prompt templating, retries, timeouts, and fallbacks. Authenticate with managed identity. Use gRPC or REST with versioned endpoints and contract schemas. Add circuit breakers and bulkheads around model calls and fallback to cached or simpler models if the main model fails."

### NFRs / Knobs

- Timeout & retry strategies
- Contract/versioning
- Circuit breaker thresholds
- Schema validation
- Observability

### Trade-offs

- Tight coupling to model contracts vs flexibility
- Adding orchestration increases code but improves resilience

---

## Quick Interview Delivery Tips

**Start each answer with:**
- Primary goal & key constraint (latency / compliance / cost)

**Drawing process:**
- Draw the ASCII diagram first
- Narrate the "data-flow"
- Mention the three most important knobs (scaling, security, observability)

**Use these one-liners:**
- "Two-path LLM strategy"
- "Separate CPU/GPU node pools"
- "HPA + KEDA + cluster autoscaler"
- "Private Link + Managed Identity + Key Vault"

**If asked for numbers:**
- Give ranges (e.g., "for 10k QPS I'd batch on GPU, target 80–90% GPU utilization, and use managed OpenAI for stateless high-throughput flows")

---

**Next**: Review the **System Design Cheat Sheet** (`./10_System-Design-Cheat-Sheet.md`) for quick reference.
