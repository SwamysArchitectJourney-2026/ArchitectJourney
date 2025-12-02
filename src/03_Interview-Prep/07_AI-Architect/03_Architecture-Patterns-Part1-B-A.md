---
learning_level: "Advanced"
prerequisites: ["./03_Architecture-Patterns-Part1-A-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master concrete AKS configuration settings for AI workloads"
  - "Understand GPU node pool management and best practices"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A-B.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./03_Architecture-Patterns-Part1-B-B.md"]
  cross_refs: []
---

# Concrete Configuration & Best Practices - Part 1-A

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

**Next**: [Rollout Strategies, Autoscaling, and Cost Optimization](./03_Architecture-Patterns-Part1-B-B.md)
