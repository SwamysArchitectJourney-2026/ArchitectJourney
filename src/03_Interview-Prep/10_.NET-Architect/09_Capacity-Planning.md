---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["System design fundamentals", "Capacity planning", "Performance optimization"]
estimated_time: "25 minutes"
learning_objectives:
  - "Learn capacity planning for high-throughput AI systems"
  - "Understand QPS calculations and pod/node requirements"
  - "Master cost optimization strategies"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A.md"]
  builds_upon: []
  enables: ["./06_Cheat-Sheet.md"]
  cross_refs: []
---

# Capacity Planning for .NET Architect

**Practical capacity planning** for high-throughput AI systems with step-by-step calculations.

---

## 📊 Understanding QPS (Queries Per Second)

**QPS = Queries Per Second**

A performance metric measuring how many requests a system must handle each second.

### Why QPS Matters

Architects use QPS to determine:
- Number of pods, nodes, or GPU instances required
- Autoscaling strategy (HPA, KEDA) configuration
- Throughput requirements for API or model endpoints
- Cache requirements and load balancing needs

### QPS vs TPS

- **QPS**: Raw request count (stateless or simple API calls)
- **TPS**: Usually more complex operations (DB transactions, business workflows)

---

## 🧮 Capacity Planning Methodology

### Step 1: Measure Single-Pod Throughput

**Critical First Step**: Measure actual throughput per pod under realistic load.

**Example Measurements:**
- Conservative: 25 QPS per pod
- Typical: 50 QPS per pod
- Optimized: 100 QPS per pod

**Factors Affecting Throughput:**
- Request complexity
- Model size and inference time
- Network latency
- Resource allocation (CPU, memory)

### Step 2: Calculate Required Pods

**Formula**: `Pods = ceil(Target QPS ÷ QPS per Pod)`

**Example Calculations:**

**Case A: 25 QPS per Pod (Conservative)**
- Target: 10,000 QPS
- Calculation: 10,000 ÷ 25 = 400 pods

**Case B: 50 QPS per Pod (Typical)**
- Target: 10,000 QPS
- Calculation: 10,000 ÷ 50 = 200 pods

**Case C: 100 QPS per Pod (Optimized)**
- Target: 10,000 QPS
- Calculation: 10,000 ÷ 100 = 100 pods

### Step 3: Account for Caching

**Cache Impact Example:**
- Total QPS: 10,000
- Cache hit rate: 40%
- Origin QPS: 10,000 × 0.60 = 6,000 QPS

**Recalculated Pods (50 QPS per pod):**
- 6,000 ÷ 50 = 120 pods (vs 200 without cache)

**Cache Benefits:**
- Reduces origin load significantly
- Lowers infrastructure costs
- Improves response latency

### Step 4: Calculate Node Requirements

**Formula**: `Nodes = ceil(Pods ÷ Pods per Node)`

**Assumptions:**
- Reserve 20 pods per node (after system pods, kube-reserved)
- Add 10-20% buffer for rolling upgrades and failures

**Example:**
- Required pods: 200
- Pods per node: 20
- Base nodes: 200 ÷ 20 = 10 nodes
- With buffer (10%): 10 × 1.1 = 11 nodes

---

## 🎯 Architecture for 10k QPS

### High-Level Architecture

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

### Key Components

**API Gateway / APIM:**
- Terminate TLS, authenticate, rate limit
- Cache identical prompts/responses
- Absorb traffic spikes

**Edge Cache (Redis):**
- Cache frequent prompts and RAG top-k results
- Reduces origin load substantially
- Improves response latency

**Azure OpenAI (Managed):**
- Route high-volume stateless requests
- Managed service scales horizontally
- Removes GPU ops burden

**AKS Front API:**
- Lightweight .NET pods for orchestration
- Keep efficient (async I/O, gRPC where possible)
- Minimal resource footprint

**Batching for GPU Serving:**
- Batch requests in inference layer
- Increase per-GPU throughput
- Balance latency vs throughput

---

## 💡 Practical Recommendations

### Interview-Ready Soundbites

1. **Start with Measurement**: "Measure single-pod throughput under realistic load (p95 latency SLO). Use that number to compute `pods = ceil(QPS ÷ qps_per_pod)`."

2. **Leverage Caching**: "Introduce an edge cache (Redis/APIM)—a 30–50% cache hit can cut required pods dramatically."

3. **Hybrid Strategy**: "Use Azure OpenAI for stateless, high-throughput inference and AKS GPU for private/fine-tuned models—the two-path strategy reduces ops burden."

4. **Warm Pools**: "Always include warm pools and pre-warmed GPU instances to avoid cold starts affecting P95."

5. **Plan with Headroom**: "Plan node counts with headroom; use cluster autoscaler + HPA + KEDA for event-driven bursts."

6. **Validate**: "Validate with load tests (gradual ramp to target QPS), and monitor SLI/SLO (P95/P99 latency, error rate)."

---

## 🎤 60-Second Interview Summary

"To handle 10k QPS, I'd use APIM + Redis caching at the edge to cut origin calls, route stateless requests to Azure OpenAI for massive horizontal scale, and send sensitive/fine-tuned requests to AKS GPU cluster with batching. Capacity planning is straightforward: measure `qps_per_pod` and compute `pods = ceil(10000 ÷ qps_per_pod)`; e.g., at 50 QPS/pod we need 200 pods (50×200=10,000) and about 10 VM nodes if you place 20 pods/node. Combine HPA, Cluster Autoscaler, and KEDA, plus circuit breakers and warm pools to meet P95 SLOs."

---

**Next**: [Cheat Sheet](./06_Cheat-Sheet.md) - Quick reference guide

