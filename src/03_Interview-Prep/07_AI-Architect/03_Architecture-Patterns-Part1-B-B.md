---
learning_level: "Advanced"
prerequisites: ["./03_Architecture-Patterns-Part1-B-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Learn model rollout strategies (canary, blue/green)"
  - "Implement effective autoscaling and cost optimization"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-B-A.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./03_Architecture-Patterns-Part1-C.md"]
  cross_refs: []
---

# Concrete Configuration & Best Practices - Part 1-B

**Advanced configuration** covering rollout strategies, autoscaling, and cost optimization.

---

## Model Rollout Strategies

### Canary Deployment Pattern

**Implementation:**

1. Deploy new model version to subset of pods (10-20%)
2. Route weighted traffic (e.g., 10% to new version)
3. Monitor metrics: latency, error rate, business metrics
4. Gradually increase traffic if metrics are healthy
5. Automated rollback if thresholds are breached

**Tools:**

- Seldon Core: Built-in canary support
- KServe: Traffic splitting capabilities
- AKS AI Toolchain Operator: Managed canary rollouts

**Metrics to Monitor:**

- P95/P99 latency
- Error rate
- Model confidence scores
- Business metrics (conversion, satisfaction)

### Blue/Green Deployment

**Pattern:**

1. Deploy new version alongside existing (green)
2. Run shadow traffic to validate
3. Switch traffic at once (or gradually)
4. Keep old version (blue) for quick rollback

**Use Cases:**

- Major model version changes
- When canary is not suitable
- Regulatory compliance requirements

---

## Autoscaling Configuration

### Three-Layer Autoscaling

**1. Horizontal Pod Autoscaler (HPA)**

```yaml
# Example HPA for GPU inference
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  metrics:
  - type: Resource
    resource:
      name: nvidia.com/gpu
      target:
        type: Utilization
        averageUtilization: 70
  minReplicas: 2
  maxReplicas: 10
```

**2. KEDA (Event-Driven Autoscaling)**

- Trigger: Service Bus queue depth, Event Hub messages
- Scale from 0 to N based on queue metrics
- Cost-effective for variable workloads

**3. Cluster Autoscaler**

- Node-level scaling
- Integrates with HPA and KEDA
- Expands node pools when pods can't be scheduled

**Best Practices:**

- Set appropriate min/max replicas
- Use custom metrics for AI-specific scaling
- Combine all three for comprehensive scaling

---

## Cost Optimization Techniques

### GPU Right-Sizing

**SKU Selection:**

- Start with smaller GPU SKUs (NC6s_v3)
- Monitor utilization and scale up if needed
- Use spot instances for training workloads

### Autoscaling Benefits

**Scale to Zero:**

- Use KEDA to scale GPU pods to zero when idle
- Significant cost savings for variable workloads
- Fast scale-up when traffic arrives

**Off-Hours Scheduling:**

- Schedule training jobs during off-peak hours
- Use Azure Automation or Kubernetes CronJobs
- Reduce costs by 30-50% for batch workloads

### Resource Optimization

**Model Quantization:**

- Reduce model size and memory requirements
- Faster inference with lower GPU requirements
- Trade-off: Slight accuracy reduction

**Inference Batching:**

- Batch multiple requests together
- Maximize GPU utilization
- Reduce per-request latency variance

---

**Next**: Continue with **Security & Observability** (`./03_Architecture-Patterns-Part1-C.md`) for security configuration and monitoring setup.
