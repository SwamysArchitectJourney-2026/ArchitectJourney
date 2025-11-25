---
learning_level: "Advanced"
prerequisites: ["RAG architecture", "Multi-region systems"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master RAG platform system design"
  - "Learn Global Multi-Region SaaS architecture"
  - "Understand universal talking points for any diagram"
  - "Practice 30-second architect summary"
related_topics:
  prerequisites: ["./08_System-Design-Diagrams-Part1-A.md"]
  builds_upon: ["./05_Whiteboard-Scenarios-Part1-A.md"]
  enables: ["./09_System-Design-Questions-Part1-A.md", "./06_Cheat-Sheet.md"]
  cross_refs: []
---

# System Design Diagrams (Continued)

**RAG platform and Multi-Region architectures** for enterprise scenarios.

---

## 4. Scalable RAG / AI-Integrated .NET Platform

**Why:** Modern enterprise AI features (summaries, assistants, RAG).

### ASCII Architecture Diagram

```
Clients
  |
API Gateway (APIM)
  |
. NET Orchestration Service (AKS CPU)
  |
+------------------------------+
| Retrieval (Vector DB: Cosmos/ CogSearch)
| Embedding Service (AKS GPU or Managed)
+------------------------------+
  |
LLM Layer:
 - Azure OpenAI (managed) OR
 - Custom LLM on AKS GPU (KServe / Seldon)
  |
Storage: SQL / Blob / Cache (Redis)
Observability: AppInsights + Prometheus
Security: Private Link + Key Vault + Managed Identity
```

### Key Callouts to Mention

- Two-path LLM strategy (managed vs hosted)
- Vector store, embedding pipeline, RAG orchestration
- Prompt governance, PII redaction, audit trail

### NFRs / Knobs

- GPU node pools
- Batching and quantization
- HPA + KEDA for event-driven spikes
- SLOs for P95/P99 latency
- Model versioning and canary rollouts

### Trade-offs

- Cost of GPUs and privacy concerns when using managed LLMs — explain Private Link and hybrid hosting

---

## 5. Global Multi-Region SaaS (High Availability + Disaster Recovery)

**Why:** For SaaS platforms requiring low latency across regions and high availability.

### ASCII Architecture Diagram

```
Users (Region A)    Users (Region B)
   |                     |
Edge CDN (Front Door / CDN)
   |                     |
Region A Infra        Region B Infra
(API Gateway, AKS, Databases (replicated))
   \_________Geo DB Replication / Traffic Manager_________/
Centralized services: Auth (Azure AD B2C), Logging, CI/CD
```

### Key Callouts to Mention

- Active-active vs active-passive topology
- Data replication (geo-replication, read replicas)
- Global traffic management (Front Door, Traffic Manager)
- Cross-region failover runbooks

### NFRs / Knobs

- RPO/RTO targets
- Data residency constraints
- Consistency model (strong vs eventual)
- Network partition handling

### Trade-offs

- Cost vs latency and resilience — active-active increases cost but reduces failover time

---

## Universal Talking Points (Use for ANY Diagram)

### Scalability

- HPA (CPU/GPU), KEDA, Cluster Autoscaler
- Separate CPU, GPU, and spot node pools

### Security

- Private Link, Managed Identity
- Key Vault + TLS + RBAC
- Zero-trust network design

### Reliability

- Rolling upgrades, blue/green, canary
- Health checks, retries, circuit breakers

### Observability

- App Insights (logs/traces)
- Prometheus/Grafana (metrics)
- Distributed tracing (OpenTelemetry)

### Cost Optimization

- Right-sizing nodes
- Spot nodes for training/jobs
- Caching, autoscale-to-zero, async workloads

---

## 30-Second Architect Summary (Memorize This)

> "Across architectures, I prioritize separation of concerns, strong security boundaries, independent deployability, and observability.
> For .NET workloads, I prefer AKS for scalable microservices, event-driven designs for throughput, and Azure AI/Azure ML for intelligent features.
> Every solution includes clear scaling strategies, failover design, Private Link + MSI, and CI/CD maturity with canary rollouts."

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

**Next**: Practice **System Design Questions** (`./09_System-Design-Questions-Part1-A.md`) with detailed prompts and answers.

