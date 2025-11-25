---
learning_level: "Advanced"
prerequisites: ["Kubernetes deployment", "GPU management", "Observability"]
estimated_time: "25 minutes"
learning_objectives:
  - "Design canary and blue-green rollouts for LLMs"
  - "Optimize GPU provisioning and utilization on AKS"
  - "Design comprehensive observability for AI platforms"
  - "Reduce latency for RAG systems"
related_topics:
  prerequisites: ["./09_System-Design-Questions-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./09_System-Design-Questions-Part1-C.md"]
  cross_refs: []
---

# System Design Questions - Part 2

**Advanced system design questions** with detailed answers and diagrams.

---

## Q6: Canary / Blue-Green Rollouts for LLMs

**Ask:** Design safe rollout for new models with automatic rollback.

**Goal:** Safely validate and shift traffic to new model versions.

### ASCII Architecture Diagram

```
Client → Traffic Router
        |
   +----+-----+
   |          |
Stable (v1)  Canary (v2 10%)
   |          |
Monitors (latency, error, business metric)
   |
Auto-promote / rollback
```

### What to Say

> "Use traffic routing (API Gateway or service mesh) to split traffic. Run canary with small % of users, compare key metrics (latency, error rate, degradation in business KPIs). Use automated SLO checks and rollback on violation. Do shadow testing (send copy of traffic to canary) for additional validation."

### NFRs / Knobs

- Metric selection
- Canary size & duration
- Automatic rollback thresholds
- Auditability

### Trade-offs

- Canary reduces risk but increases complexity in monitoring & metrics alignment

---

## Q7: Provisioning GPUs on AKS & Optimizing Utilization

**Ask:** How to design GPU node pools and improve GPU utilization.

**Goal:** Efficient GPU usage with minimized cost.

### ASCII Architecture Diagram

```
AKS Cluster
  |
+------------------------+
| CPU Node Pools         |
+------------------------+
| GPU Node Pools (tainted)|
+------------------------+
| Spot/Preemptible Pools |
+------------------------+
Pods with tolerations schedule on GPUs
```

### What to Say

> "Create dedicated GPU node pools with taints/tolerations. Use device plugin images matching NVIDIA drivers. Use batching, model quantization, and multiplexing (multi-model serving) to increase utilization. Use spot instances for non-critical training and schedule heavy jobs off-hours."

### NFRs / Knobs

- GPU SKUs
- Driver/image compatibility
- Batching window
- Pre-warm pools
- Spot vs on-demand mix

### Trade-offs

- Higher utilization needs batching (increases latency) vs per-request low latency

---

## Q8: Observability for an AI Platform

**Ask:** Define observability stack for combined .NET + AI + AKS platform.

**Goal:** Full-stack telemetry for infra, apps, and models.

### ASCII Architecture Diagram

```
Apps / Inference → Traces (AppInsights/OpenTelemetry)
                 → Metrics (Prometheus)
                 → Logs (Log Analytics)
                 → Model Telemetry (token usage, confidence, drift)
                 → Alerting (PagerDuty)
                 → Dashboards (Grafana / Power BI)
```

### What to Say

> "Collect traces, metrics, and logs end-to-end. Instrument model-specific metrics (input distribution, confidence, token counts, prompt latency). Correlate with AppInsights traces and Prometheus metrics. Create dashboards for SLOs and set alerts for anomalies and drift. Ensure privacy by masking sensitive content before logging."

### NFRs / Knobs

- Retention policies
- Sample rates
- Cost of telemetry
- PII masking

### Trade-offs

- More telemetry = better insight but higher storage/cost and privacy risk

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

