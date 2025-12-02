---
learning_level: "Advanced"
prerequisites: ["Azure services", "System design basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master Azure AI and infrastructure terminology"
  - "Understand QPS (Queries Per Second) and capacity planning"
  - "Learn 10k QPS architecture design"
  - "Calculate pod and node requirements"
related_topics:
  prerequisites: ["./07_Glossary-and-KEDA-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-A.md"]
  enables: ["./04_Interview-Questions-Part1-A.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: []
---

# Azure Services Glossary & QPS Architecture

**Complete terminology** and **10k QPS capacity planning** for interviews.

---

## Azure Services Terminology

### Private Link

Securely connects services over Microsoft backbone — no public internet exposure.

### Managed Identity

Azure identity mechanism enabling secure service-to-service authentication without secrets.

### Azure OpenAI

Managed LLM service providing GPT models with enterprise-grade governance and security.

### Azure Machine Learning (Azure ML)

Platform for training, registering, deploying custom ML/LLM models.

### APIM – Azure API Management

Centralized API gateway for authentication, throttling, caching, and observability.

### Ingress Controller

Kubernetes component that routes external traffic into cluster services.

### Seldon / KServe

Model serving frameworks for hosting ML/LLM models on Kubernetes with autoscaling and canarying.

### Cosmos DB / Cognitive Search (Vector Index)

Databases used for storing embeddings and enabling fast retrieval for RAG systems.

### Redis Cache

In-memory cache used to reduce latency and load.

### Key Vault

Secure secrets, certificates, and keys store.

### App Insights

Telemetry provider for distributed tracing, logging, and metrics.

### Prometheus + Grafana

Monitoring stack for AKS metrics and dashboards.

---

## Why Each Azure Service Is Used

**Private Link** → To prevent exposing LLM endpoints to the public internet.

**Managed Identity** → To eliminate secrets and increase security.

**Azure OpenAI** → To consume LLMs without managing infrastructure.

**Azure ML** → For custom model training, MLOps, and controlled model lifecycle.

**APIM** → To enforce throttling, caching, auth, rate limits, and expose APIs securely.

**Ingress Controller** → To route requests inside the AKS cluster.

**Seldon/KServe** → For production-grade LLM hosting on GPU nodes.

**Vector DB (Cosmos/CogSearch)** → For fast semantic search (RAG).

**Redis** → To reduce LLM latency through caching.

**Key Vault** → For secrets management and compliance.

**Prometheus/Grafana** → For advanced monitoring/alerts.

**App Insights** → For distributed tracing in .NET/AKS.

---

## QPS - Queries Per Second

**Definition:**
QPS = Queries Per Second - A performance and scalability metric that measures how many requests (queries) a system can handle every second.

**In Interview Terms:**
When someone says "We need to support 10k QPS", they mean:

- The system must reliably handle 10,000 requests per second
- Without dropping requests
- While staying within the expected latency SLO (e.g., P95 < 200ms)

**Why QPS Matters:**
Architects use QPS to determine:

- How many pods, nodes, or GPU instances are required
- What kind of autoscaling strategy (HPA, KEDA) is needed
- How much throughput the API or model endpoint must support
- Whether to use Azure OpenAI or AKS GPU hosting
- Cache requirements (Redis)
- Load balancing and rate limiting

**QPS vs TPS:**

- **QPS** → raw request count (stateless or simple API calls)
- **TPS** → usually more complex operations (DB transactions, business workflows)

---

## Interview-Perfect QPS Explanation

> "QPS stands for Queries Per Second.
> It tells how many requests our system or API must serve each second.
> If we target 10k QPS, we must architect the system with proper autoscaling, caching, load balancing, and efficient model serving to sustain that throughput within the latency SLO."

---

## 10k QPS Architecture (Whiteboard-Ready)

```
Clients
  |
API Gateway / APIM (auth, throttling, WAF, caching)
  |
Edge Cache (Redis)  <-- hit-first for repeated responses
  |
AKS Front API (.NET)  [CPU node pool]
  |            |
  |            +--> Azure OpenAI (managed)  [stateless high-throughput]
  |
  +--> AKS GPU pool (KServe/Seldon) [for private/fine-tuned models]
  |
Observability: App Insights + Prometheus/Grafana
Autoscale: HPA (pods) + Cluster Autoscaler (nodes) + KEDA (if event-driven)
Secrets: Key Vault, Auth: Managed Identity / Azure AD
```

**Explanation:**
Use caching + APIM to absorb traffic; route stateless requests to Azure OpenAI for scale and private or heavy requests to AKS GPU. Scale pods and nodes automatically.

---

## Capacity Planning Calculations

### Pod Requirements for 10k QPS

**Case A - Pod capacity = 25 QPS (conservative):**

- Calculation: Pods = ceil(10,000 ÷ 25) = 400 pods

**Case B - Pod capacity = 50 QPS (typical moderate):**

- Calculation: Pods = ceil(10,000 ÷ 50) = 200 pods

**Case C - Pod capacity = 100 QPS (optimized):**

- Calculation: Pods = ceil(10,000 ÷ 100) = 100 pods

### Effect of Caching (40% cache hit)

If Redis/APIM caches 40% of requests, only 60% go to origin:

- Origin QPS = 10,000 × 0.60 = 6,000
- At 50 QPS/pod: Pods = ceil(6,000 ÷ 50) = 120 pods

**Result with 40% cache hit and 50 QPS/pod: 120 pods** (vs 200 without cache)

---

## Node Calculation

**Assumption:** Reserve 20 pods per node (after system pods, kube-reserved)

**For 200 pods (50 QPS/pod):**

- Nodes = ceil(200 ÷ 20) = 10 nodes

**For 400 pods (25 QPS/pod):**

- Nodes = ceil(400 ÷ 20) = 20 nodes

**For 120 pods (with caching):**

- Nodes = ceil(120 ÷ 20) = 6 nodes

**Best Practice:** Add 10-20% buffer for rolling upgrades/failure (multiply by 1.1 or 1.2)

---

## 60-Second Interview Summary

> "To handle 10k QPS I'd use APIM + Redis caching at the edge to cut origin calls, route stateless requests to Azure OpenAI for massive horizontal scale, and send sensitive/fine-tuned requests to AKS GPU cluster with batching. Capacity planning is straightforward: measure qps_per_pod and compute pods = ceil(10000 ÷ qps_per_pod); e.g., at 50 QPS/pod we need 200 pods (50×200=10,000) and about 10 VM nodes if you place 20 pods/node. Combine HPA, Cluster Autoscaler, and KEDA, plus circuit breakers and warm pools to meet P95 SLOs."

---

**Next**: Review **Interview Questions** (`./04_Interview-Questions-Part1-A.md`) to practice applying these concepts.
