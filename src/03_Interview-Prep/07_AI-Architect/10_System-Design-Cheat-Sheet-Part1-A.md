---
learning_level: "Advanced"
prerequisites: ["./09_System-Design-Questions-Part1-B-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Quick reference for system design interviews"
  - "Memorize essential architecture diagrams"
related_topics:
  prerequisites: ["./09_System-Design-Questions-Part1-B-B.md"]
  builds_upon: ["./06_Cheat-Sheet.md"]
  enables: ["./10_System-Design-Cheat-Sheet-Part1-B.md"]
  cross_refs: []
---

# System Design Cheat Sheet - Part 1-A

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

**Next**: Continue with **RAG Platform & Multi-Region** (`./10_System-Design-Cheat-Sheet-Part1-B.md`).
