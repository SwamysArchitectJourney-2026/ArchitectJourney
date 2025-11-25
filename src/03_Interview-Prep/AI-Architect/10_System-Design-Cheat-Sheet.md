---
learning_level: "Advanced"
prerequisites: ["All previous AI-Architect content"]
estimated_time: "15 minutes"
learning_objectives:
  - "Quick reference for system design interviews"
  - "Memorize 5 essential architecture diagrams"
  - "Review universal talking points"
  - "Prepare for confident whiteboard delivery"
related_topics:
  prerequisites: ["./08_System-Design-Diagrams-Part1-B.md", "./09_System-Design-Questions-Part1-B.md"]
  builds_upon: ["./06_Cheat-Sheet.md"]
  enables: []
  cross_refs: []
---

# System Design Cheat Sheet - One Page

**Printable quick reference** for .NET Architect system design interviews.

---

## 1. Cloud-Native .NET Microservices on AKS

```
Clients → APIM → AKS Ingress
                 |
        +------------------------+
        |  .NET Microservices    |
        |  (Deployments/Pods)    |
        |  CPU Node Pools        |
        +------------------------+
           |     |      |      |
         Redis  SQL   Cosmos   Blob
          
Auth: Azure AD  
Secrets: Key Vault  
Observability: App Insights + Prometheus/Grafana  
Scaling: HPA, KEDA, Cluster Autoscaler
```

**Key Points:**
- Stateless .NET services on AKS CPU node pools
- Service discovery via Ingress / Dapr
- Independent deployability, health probes, circuit breakers
- GitOps or DevOps pipeline → ACR → AKS

---

## 2. Monolith → Microservices (Strangler Pattern)

```
Clients
  |
API Gateway
  |
+--------------------------+
|  Legacy Monolith         |
+--------------------------+
        ↘ Strangler ↙
+--------------------------+
|  New Microservices (AKS) |
|  New Databases per svc   |
+--------------------------+
Shared: Auth, Logging, CI/CD
```

**Key Points:**
- Strangler facade gradually routes traffic
- Domain decomposition → microservices
- Data migration = CDC, dual writes, ACL
- Strong backward compatibility

---

## 3. Event-Driven Architecture (CQRS + Event Sourcing)

```
Clients → BFF/API Layer
        |
Command API (.NET) → Write DB
        |
       Events → Event Bus (Kafka / Service Bus / Event Grid)
                      |
          +-----------+-----------+
          |                       |
     Read Model Builders     Notifications / Workers
          |
       Read DBs
```

**Key Points:**
- Command/Query separation
- High scalability for read loads
- Event logs = full audit trail
- Idempotent consumers & snapshots

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

