---
learning_level: "Advanced"
prerequisites: ["./07_Glossary-and-KEDA-Part1-B-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Understand QPS (Queries Per Second) and capacity planning"
  - "Learn 10k QPS architecture design"
  - "Calculate pod and node requirements"
related_topics:
  prerequisites: ["./07_Glossary-and-KEDA-Part1-B-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-A.md"]
  enables: ["./04_Interview-Questions-Part1-A-A.md"]
  cross_refs: []
---

# QPS & Capacity Planning - Part 1-B-B

**10k QPS capacity planning** and architecture design.

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

**Next**: Review **Interview Questions** (`./04_Interview-Questions-Part1-A-A.md`) to practice applying these concepts.
