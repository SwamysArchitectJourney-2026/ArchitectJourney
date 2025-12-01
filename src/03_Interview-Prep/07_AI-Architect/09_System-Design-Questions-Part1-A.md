---
learning_level: "Advanced"
prerequisites: ["System design fundamentals", "Azure AI architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Answer high-throughput LLM inference design questions"
  - "Understand Azure OpenAI vs Azure ML decision criteria"
  - "Design secure LLM pipelines for sensitive documents"
  - "Master model drift detection and retraining"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A.md"]
  builds_upon: ["./08_System-Design-Diagrams-Part1-B.md"]
  enables: ["./09_System-Design-Questions-Part1-B.md"]
  cross_refs: []
---

# System Design Questions - Part 1

**10 interview-style architecture questions** with diagrams and talking points.

---

## Q1: High-Throughput, Low-Latency LLM Inference (10k QPS)

**Ask:** Design LLM inference layer that handles 10k QPS with <200ms P95.

**Goal:** Maximize throughput & utilization while bounding latency.

### ASCII Architecture Diagram

```
Clients
  |
API Gateway (APIM + WAF + Cache)
  |
Ingress → Load Balancer
  |
+------------------------------+
| Front API (.NET) - AKS CPU   |
+------------------------------+
   |             |
   v             v
Cache (Redis)  Inference Tier
               +-------------------------+
               | Azure OpenAI (managed)  |
               | AKS GPU Pool (KServe)   |
               | Batchers / GPU Batching |
               +-------------------------+
```

### What to Say

> "Use a two-path inference strategy: Azure OpenAI for horizontally scalable, latency-optimized calls; AKS GPU-serving for private or custom models. Use a fast Redis cache for repeated prompts, batching on GPU nodes to improve throughput, and autoscale GPU pools. Use connection pooling and warm model instances to avoid cold-starts."

### NFRs / Knobs

- P95/P99 latency targets
- Throughput requirements
- Token cost considerations
- GPU batch size
- Model quantization
- Warm pools
- HPA + cluster autoscaler + GPU node pools
- Redis for caching

### Trade-offs

- Managed OpenAI eases scale but has data residency/cost concerns
- AKS gives control but needs ops and GPU cost management

---

## Q2: Choosing Azure OpenAI vs Azure ML

**Ask:** Recommend when to use managed LLMs vs custom training/hosting.

**Goal:** Present decision criteria & hybrid option.

### ASCII Architecture Diagram

```
Client → API Gateway
         |
    +----+----+
    |         |
Azure OpenAI  Azure ML → Model Registry → AKS (GPU)
(managed)     (training/custom)
```

### What to Say

> "Use Azure OpenAI for off-the-shelf LLM features and quick delivery. Use Azure ML when you need custom training, custom datasets, model governance or on-prem-like control. Hybrid: route generic traffic to OpenAI and sensitive or fine-tuned calls to Azure ML→AKS."

### NFRs / Knobs

- Data residency requirements
- Training cost considerations
- Inference latency needs
- Model governance requirements
- Ability to fine-tune

### Trade-offs

- Time-to-market vs control
- Cost vs compliance

---

## Q3: Secure LLM Pipeline for Sensitive Documents

**Ask:** Design a pipeline that guarantees sensitive document protection and compliance.

**Goal:** Ensure no sensitive data leaks and auditable access.

### ASCII Architecture Diagram

```
User (internal) 
  |
APIM (Auth: Azure AD)
  |
AKS (.NET Services) -> DLP/Redaction Layer
  |
Private Link → Azure OpenAI (private endpoint)
  |
Key Vault, Audit Logs, SIEM
Data stores (encrypted)
```

### What to Say

> "Enforce VNet + Private Link for all AI endpoints, use Managed Identities for service-to-service auth, do prompt redaction & tokenization before any external call, log only pseudonymized telemetry, keep full audit trails in Log Analytics and push alerts to SIEM. Use Key Vault for keys and secrets."

### NFRs / Knobs

- Data residency requirements
- PII redaction policies
- Encryption at rest/in transit
- Auditability requirements
- Retention policies

### Trade-offs

- Strict security increases latency/ops complexity
- May need private hosting for strictest regulations

---

## Q4: Model Drift Detection & Automated Retraining

**Ask:** How to detect model drift, monitor, and trigger retrain pipelines.

**Goal:** Automated monitoring → retrain → redeploy loop.

### ASCII Architecture Diagram

```
Inference → Telemetry (AppInsights + custom metrics)
               |
        Drift Detection Service
        |             |
  Alert / Trigger   Dashboard
        |             |
   Azure ML Retrain Pipeline <-- Data Snapshot / Label Queue
        |
Model Registry → CD → AKS / OpenAI (if applicable)
```

### What to Say

> "Capture input distributions, prediction confidence, and business KPIs. Use a drift detection job that compares recent distributions with baseline and triggers Azure ML retraining pipelines. Store labeled samples in a labeling queue and automate model validation before pushing to registry and rolling update with canary."

### NFRs / Knobs

- Drift thresholds
- Data labeling throughput
- Retrain frequency
- Validation gates
- Rollback automation

### Trade-offs

- Frequent retraining reduces drift but increases cost and risk of overfitting

---

---

**Next**: Continue with **More System Design Questions** (`./09_System-Design-Questions-Part1-B.md`) including AKS vs Serverless, canary rollouts, GPU optimization, and observability.

