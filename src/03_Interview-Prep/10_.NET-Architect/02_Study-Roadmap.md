---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: [".NET fundamentals", "Azure basics", "Kubernetes basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand the prioritized study order for .NET Architect interviews"
  - "Learn key decision points for Azure AI service selection"
  - "Master AKS configuration for AI workloads"
related_topics:
  prerequisites: ["./01_Interview-Overview.md"]
  builds_upon: []
  enables: ["./03_Architecture-Patterns-Part1-A.md", "./04_Interview-Questions-Part1-A.md"]
  cross_refs: ["../07_AI-Architect/02_Study-Roadmap.md"]
---

# .NET Architect Study Roadmap

**Prioritized learning path** for .NET Architect interviews with Azure AI and Kubernetes focus.

Study these topics in order for maximum interview effectiveness.

---

## 1️⃣ Azure AI Service Selection Strategy

**Priority**: Critical - First topic to master

### Key Decision Framework

Understanding when to use each Azure AI service is fundamental:

**Azure OpenAI (Managed LLMs)**
- **Use when**: You need off-the-shelf language capabilities without model training
- **Best for**: Text generation, summarization, chat applications, quick prototyping
- **Advantages**: Fast deployment, managed scaling, enterprise security
- **Limitations**: Less control over model behavior, data residency considerations

**Azure Machine Learning (Custom Training)**
- **Use when**: You need custom model training, fine-tuning, or full MLOps lifecycle
- **Best for**: Domain-specific models, regulatory compliance, data residency requirements
- **Advantages**: Full control, custom datasets, model governance
- **Limitations**: Higher operational overhead, longer time-to-production

**Azure Cognitive Services**
- **Use when**: You need pre-built AI capabilities (vision, speech, language)
- **Best for**: Rapid feature development, standard AI tasks
- **Advantages**: Quick integration, no ML expertise required
- **Limitations**: Less customization, vendor lock-in

### Interview Talking Point

"Azure OpenAI excels for rapid deployment of language features, while Azure ML provides the control and customization needed for regulated environments or domain-specific requirements."

---

## 2️⃣ AKS Fundamentals for AI Workloads

**Priority**: Critical - Core infrastructure knowledge

### Essential Concepts

**Node Pool Design**
- Separate CPU pools for .NET microservices
- Dedicated GPU pools for model inference and training
- Spot pools for cost-optimized batch workloads

**Pod Scheduling**
- Taints and tolerations for workload isolation
- Node affinity rules for GPU placement
- Resource requests and limits for predictable performance

**GPU Management**
- NVIDIA driver compatibility with node images
- Device plugin configuration
- Multi-model serving strategies

### Interview Talking Point

"AKS node pool separation enables cost optimization and performance isolation. CPU pools handle stateless .NET services, while GPU pools are dedicated to AI inference with proper taint/toleration patterns."

---

## 3️⃣ Model Serving and MLOps on Kubernetes

**Priority**: High - Production deployment patterns

### Serving Framework Options

**KServe / Seldon Core**
- Model versioning and traffic splitting
- Canary and blue-green deployment patterns
- Autoscaling based on inference load
- A/B testing capabilities

**AKS AI Toolchain Operator**
- Native Azure integration
- Simplified model lifecycle management
- Automated rollout strategies

### MLOps Pipeline Integration

- Azure ML pipelines for training
- Model registry for versioning
- CI/CD integration via GitOps
- Automated deployment to AKS

---

## 4️⃣ Scaling and Autoscaling Strategies

**Priority**: High - Scalability is always tested

### Three-Layer Autoscaling

**Horizontal Pod Autoscaler (HPA)**
- Scales pods based on CPU, memory, or custom metrics
- Essential for .NET service scaling
- Can target GPU utilization for model serving

**KEDA (Event-Driven Autoscaling)**
- Scales based on external event sources
- Queue depth, Kafka lag, HTTP request rate
- Enables scale-to-zero for cost efficiency

**Cluster Autoscaler**
- Adds/removes nodes based on pending pods
- Works with node pool configurations
- Critical for GPU pool management

### Interview Talking Point

"Combining HPA, KEDA, and Cluster Autoscaler provides comprehensive scaling. HPA handles resource-based scaling, KEDA enables event-driven elasticity, and Cluster Autoscaler manages infrastructure capacity."

---

## 5️⃣ Security and Governance

**Priority**: High - Enterprise requirements

### Key Security Patterns

**Identity and Access**
- Managed identities for service-to-service authentication
- Azure AD integration for user authentication
- Role-based access control (RBAC) across services

**Network Security**
- Private Link for Azure OpenAI endpoints
- VNet integration for AKS clusters
- Network policies for pod-to-pod communication

**Data Protection**
- Key Vault for secrets management
- Encryption at rest and in transit
- PII redaction in logs and telemetry

---

## 6️⃣ Observability and SLOs

**Priority**: Medium - Operational excellence

### Monitoring Stack

**Application Insights**
- Distributed tracing for .NET services
- Dependency tracking
- Custom metrics and events

**Prometheus + Grafana**
- Infrastructure metrics from AKS
- GPU utilization monitoring
- Custom dashboards for SLO tracking

**Model Telemetry**
- Inference latency and throughput
- Model drift detection
- Token usage and cost tracking

---

## 7️⃣ Cost Optimization Strategies

**Priority**: Medium - Business acumen

### Cost Control Techniques

**Right-Sizing**
- Match GPU SKUs to workload requirements
- Use spot instances for non-critical training
- Schedule heavy workloads during off-hours

**Autoscaling Benefits**
- Scale-to-zero for idle workloads
- Efficient resource utilization
- Automated cost management

---

## 📅 Recommended Study Timeline

**Week 1**: Azure AI services and AKS fundamentals  
**Week 2**: Model serving, MLOps, and autoscaling  
**Week 3**: Security, observability, and cost optimization  
**Week 4**: Practice whiteboard scenarios and mock interviews

---

**Next**: [Architecture Patterns - Part 1-A](./03_Architecture-Patterns-Part1-A.md) - Common architectural patterns

