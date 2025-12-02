---
learning_level: "Advanced"
prerequisites: [".NET architecture", "System design fundamentals"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master 5 essential .NET architecture diagrams for interviews"
  - "Learn Cloud-native microservices on AKS"
  - "Understand Monolith to Microservices migration patterns"
  - "Practice Event-Driven Architecture and CQRS"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./08_System-Design-Diagrams-Part1-B.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: []
---

# Top 5 System Design Diagrams for .NET Architect

**Five high-value architectures** you should be able to draw, explain, and defend in interviews.

---

## 1. Cloud-Native .NET Microservices on AKS

**Why:** Standard enterprise approach for modularity, independent deploys, scalability.

### ASCII Architecture Diagram

```
Clients
  |
API Gateway (APIM / Kong / Nginx)
  |
+-----------------------------+
|  AKS Cluster                |
|  +-----------------------+  |
|  | Ingress Controller    |  |
|  +-----------------------+  |
|  | .NET Microservices    |  |
|  | (multiple Deployments)|  |
|  +-----------------------+  |
|  | Sidecars (Dapr/Envoy) |  |
+-----------------------------+
  |    |         |        |
  v    v         v        v
Redis  SQL      Cosmos   Blob Storage
|           Monitoring: Prometheus/Grafana
Auth: Azure AD   Secrets: Key Vault
```

### Key Callouts to Mention

- Service contracts (gRPC/REST), versioning strategy
- Sidecars for service-to-service concerns (observability, resiliency)
- CI/CD pipeline (GitOps/DevOps) → image repo → AKS
- Health probes, circuit breakers, retries

### NFRs / Knobs

- HPA, cluster autoscaler, node pools (CPU, burstable)
- Canary/blue-green deployments
- Caching (Redis)
- Distributed tracing (App Insights + OpenTelemetry)

### Trade-offs

- Operational overhead vs control
- Complexity of distributed transactions — prefer eventual consistency and sagas

---

## 2. Monolith → Microservices Migration (Strangler Pattern)

**Why:** For interviewing on migration strategy and risk mitigation.

### ASCII Architecture Diagram

```
Clients
  |
API Gateway
  |
+-----------------------------+
|  Monolith App (legacy)      |
|  (DB-Legacy)                |
+-----------------------------+
      ↘ Strangler Facade ↙
+-----------------------------+
|  New Microservices (AKS)    |
|  New DBs (per-service)      |
+-----------------------------+
Shared infra: Auth, Logging, CI/CD
```

### Key Callouts to Mention

- Strangler facade gradually routes traffic to microservices
- Data migration patterns: dual-write, change data capture, anti-corruption layer
- Phased ownership and contracts

### NFRs / Knobs

- Backwards compatibility
- Feature toggles
- Database migration strategy
- Observability to detect regressions

### Trade-offs

- Technical debt vs speed of delivery
- Temporary increased complexity during migration

---

## 3. Event-Driven Architecture / CQRS + Event Sourcing

**Why:** Strong for high-concurrency, complex business rules, auditability and scalability of reads.

### ASCII Architecture Diagram

```
Clients
  |
API Gateway / BFF
  |
Command Side (.NET APIs) --> Command DB (write)
          |
        Events -> Event Bus (Event Grid / Kafka)
          |
Read Side Consumers  -> Read DBs (projections)
          |
Background Processors / Materializers / Notifications
```

### Key Callouts to Mention

- Separate read/write models (CQRS)
- Event bus choices (Event Grid, Service Bus, Kafka)
- Event schema, versioning, idempotency
- Snapshots to bound replay costs

### NFRs / Knobs

- Latency tolerance for eventual consistency
- Retention/purging of events
- Exactly-once vs at-least-once semantics

### Trade-offs

- Increased cognitive complexity and operational cost vs simplified scaling and auditability

---

**Next**: Continue with **More System Design Diagrams** (`./08_System-Design-Diagrams-Part1-B.md`) including RAG platform and Multi-Region SaaS.

