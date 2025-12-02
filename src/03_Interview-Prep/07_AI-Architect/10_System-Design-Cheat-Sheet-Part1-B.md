---
learning_level: "Advanced"
prerequisites: ["./10_System-Design-Cheat-Sheet-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Review universal talking points"
  - "Prepare for confident whiteboard delivery"
related_topics:
  prerequisites: ["./10_System-Design-Cheat-Sheet-Part1-A.md"]
  builds_upon: ["./06_Cheat-Sheet.md"]
  enables: []
  cross_refs: []
---

# System Design Cheat Sheet - Part 1-B

**Printable quick reference** (Continued).

---

## 4. RAG / AI Platform (.NET + Azure AI + AKS)

```
Clients → APIM → AKS CPU (.NET API)
                    |
             RAG Orchestrator
                    |
        +-----------+------------+
        |                        |
 Vector Store              Embedding Service
(Cosmos/CogSearch)      (OpenAI / AKS GPU)
        |                        |
        +-----------+------------+
                    |
               LLM Layer
      Azure OpenAI  |  Custom LLM on AKS GPU
```

**Key Points:**
- Full RAG flow: embeddings → vector search → prompt build
- Two-path LLM strategy: managed + custom
- GPU autoscaling, batching, quantization
- Security: Private Link, Key Vault, Managed Identity
- Observability: latency, token usage, drift monitoring

---

## 5. Global Multi-Region SaaS Architecture

```
           Users (Region A/B)
                 |
           Azure Front Door
                 |
   +-------------------------------+
   | Region A (AKS, APIM, SQL/Cosmos) |
   +-------------------------------+
                 | (Geo Replication)
   +-------------------------------+
   | Region B (AKS, APIM, SQL/Cosmos) |
   +-------------------------------+

Central: CI/CD, Logging, Key Vault, Azure AD B2C
```

**Key Points:**
- Active-active or active-passive
- Front Door for global routing/health probes
- Geo-replication, read-replicas, RPO/RTO targets
- Data residency compliance

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

**Good luck with your interview!** 🚀
