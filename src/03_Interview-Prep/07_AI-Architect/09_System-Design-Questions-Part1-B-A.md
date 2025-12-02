---
learning_level: "Advanced"
prerequisites: ["./09_System-Design-Questions-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Design canary and blue-green rollouts for LLMs"
  - "Optimize GPU provisioning and utilization on AKS"
  - "Design comprehensive observability for AI platforms"
related_topics:
  prerequisites: ["./09_System-Design-Questions-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./09_System-Design-Questions-Part1-B-B.md"]
  cross_refs: []
---

# System Design Questions - Part 2-A

**Advanced system design questions** covering rollouts, GPU optimization, and observability.

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

**Next**: Continue with **RAG Latency & .NET Integration** (`./09_System-Design-Questions-Part1-B-B.md`).
