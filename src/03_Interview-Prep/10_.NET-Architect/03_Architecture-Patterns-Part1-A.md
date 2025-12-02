---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure AI fundamentals", "AKS basics", ".NET microservices"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand hybrid LLM architecture patterns"
  - "Learn node pool separation strategies"
  - "Master autoscaling configuration patterns"
related_topics:
  prerequisites: ["./02_Study-Roadmap.md"]
  builds_upon: []
  enables: ["./03_Architecture-Patterns-Part1-B.md", "./04_Interview-Questions-Part1-A.md"]
  cross_refs: ["../07_AI-Architect/03_Architecture-Patterns-Part1-A.md"]
---

# Architecture Patterns for .NET + Azure AI (Part 1-A)

**Hybrid LLM architecture and compute separation patterns** for enterprise .NET applications.

---

## 🏗️ Pattern 1: Hybrid LLM Architecture

### Overview

A two-path strategy combining managed and self-hosted LLM services to balance speed, control, and compliance.

### Architecture Components

**Path 1: Managed LLM (Azure OpenAI)**
- General-purpose language tasks
- High-throughput scenarios
- Rapid feature development
- Lower operational overhead

**Path 2: Self-Hosted Models (AKS GPU)**
- Custom or fine-tuned models
- Regulatory compliance requirements
- Data residency constraints
- Full model lifecycle control

### Implementation Strategy

```
API Gateway (APIM)
    ↓
.NET Orchestration Service (AKS CPU)
    ↓
    ├─→ Azure OpenAI (Private Link)
    └─→ AKS GPU Pool (KServe/Seldon)
```

### Key Design Decisions

1. **Routing Logic**: Route based on model type, data sensitivity, or performance requirements
2. **Fallback Strategy**: Automatic fallback from custom models to managed services
3. **Cost Optimization**: Use managed services for high-volume, standard tasks

### Interview Talking Point

"Hybrid architecture provides flexibility: Azure OpenAI for scale and speed, AKS-hosted models for control and compliance. This pattern is essential for enterprises balancing innovation with governance."

---

## 🏗️ Pattern 2: Node Pool Separation

### Overview

Isolating workloads by compute requirements to optimize performance, cost, and operational complexity.

### Node Pool Strategy

**CPU Node Pool**
- .NET microservices and API services
- Stateless, horizontally scalable workloads
- Standard VM sizes (D-series, F-series)

**GPU Node Pool**
- Model inference and training
- GPU-accelerated workloads
- Specialized VM sizes (NC-series, ND-series)

**Spot Node Pool**
- Batch processing and training jobs
- Cost-optimized workloads
- Interruptible compute

### Configuration Example

```yaml
# CPU Pool for .NET Services
nodePool:
  name: cpu-pool
  vmSize: Standard_D4s_v3
  minCount: 3
  maxCount: 20

# GPU Pool for AI Inference
nodePool:
  name: gpu-pool
  vmSize: Standard_NC6s_v3
  taints:
    - key: nvidia.com/gpu
      effect: NoSchedule
  minCount: 1
  maxCount: 10
```

### Pod Scheduling

Use tolerations to schedule GPU workloads:

```yaml
tolerations:
  - key: nvidia.com/gpu
    operator: Exists
    effect: NoSchedule
```

### Interview Talking Point

"Node pool separation enables workload isolation and cost optimization. CPU pools handle standard .NET services, while GPU pools with taints ensure only AI workloads consume expensive GPU resources."

---

## 🏗️ Pattern 3: Multi-Layer Autoscaling

### Overview

Combining multiple autoscaling mechanisms to handle diverse workload patterns efficiently.

### Autoscaling Layers

**Layer 1: Pod-Level (HPA)**
- Scales based on CPU, memory, or custom metrics
- Fast response to load changes
- Works with existing Kubernetes resources

**Layer 2: Event-Driven (KEDA)**
- Scales based on external event sources
- Queue depth, message rate, HTTP requests
- Enables scale-to-zero for cost efficiency

**Layer 3: Infrastructure (Cluster Autoscaler)**
- Adds/removes nodes based on pending pods
- Works with node pool configurations
- Manages infrastructure capacity

### Configuration Strategy

```yaml
# HPA for .NET Services
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 3
  maxReplicas: 50
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70

# KEDA ScaledObject for Event-Driven
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
spec:
  scaleTargetRef:
    name: document-processor
  triggers:
    - type: azure-servicebus
      metadata:
        queueName: document-queue
        queueLength: '10'
```

### Interview Talking Point

"Multi-layer autoscaling addresses different workload patterns: HPA for resource-based scaling, KEDA for event-driven elasticity, and Cluster Autoscaler for infrastructure capacity management."

---

## 🎯 Key Takeaways

1. **Hybrid LLM architecture** balances managed services with self-hosted models
2. **Node pool separation** optimizes cost and performance through workload isolation
3. **Multi-layer autoscaling** provides comprehensive scaling for diverse workloads

---

**Next**: [Architecture Patterns - Part 1-B](./03_Architecture-Patterns-Part1-B.md) - Security and observability patterns

