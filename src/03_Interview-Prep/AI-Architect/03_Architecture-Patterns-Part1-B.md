---
learning_level: "Advanced"
prerequisites: ["AKS fundamentals", "Azure AI services"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master concrete AKS configuration settings for AI workloads"
  - "Understand GPU node pool management and best practices"
  - "Learn model rollout strategies (canary, blue/green)"
  - "Implement effective autoscaling and cost optimization"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./04_Interview-Questions-Part1-A.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: []
---

# Concrete Configuration & Best Practices

**Specific settings and patterns** to mention in interviews for AKS and Azure AI.

---

## Node Pool Configuration

### Workload Separation Strategy

**Separate node pools by workload type:**

1. **CPU Node Pool** (Web + Orchestration)
   - Purpose: .NET microservices, API services
   - SKU: Standard_D4s_v3 or similar
   - Taints: None (default pool)

2. **GPU Inference Pool**
   - Purpose: Model serving, real-time inference
   - SKU: Standard_NC6s_v3 (NVIDIA Tesla V100) or NC_A100_v4
   - Taints: `gpu-workload=true:NoSchedule`
   - Tolerations: Required on GPU workload pods

3. **GPU Training Pool**
   - Purpose: Model training, batch processing
   - SKU: Standard_NC24s_v3 or similar
   - Taints: `gpu-training=true:NoSchedule`
   - Spot instances: Consider for non-critical training

**Best Practices:**

- Upgrade node pools together or carefully orchestrate rolling upgrades
- Keep GPU node pool images current with recommended NVIDIA drivers
- Use node pool autoscaling for cost optimization

---

## GPU Management

### Driver and Image Configuration

**NVIDIA Driver Setup:**

- Use AKS-provided GPU-enabled node images
- Ensure driver compatibility with Kubernetes device plugins
- Keep drivers updated for security and performance

**Pod Scheduling:**

- Use taints/tolerations to ensure only GPU workloads run on GPU pools
- Resource requests: `nvidia.com/gpu: 1` (or required count)
- Limits: Match requests to prevent over-allocation

**Example Pod Spec:**

```yaml
tolerations:
- key: "gpu-workload"
  operator: "Equal"
  value: "true"
  effect: "NoSchedule"
resources:
  requests:
    nvidia.com/gpu: 1
  limits:
    nvidia.com/gpu: 1
```

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
