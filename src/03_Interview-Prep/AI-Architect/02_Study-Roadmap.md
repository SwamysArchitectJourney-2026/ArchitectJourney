---
learning_level: "Advanced"
prerequisites: ["Azure fundamentals", "Kubernetes basics", ".NET architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Prioritize study topics for AI + .NET Architect interviews"
  - "Understand when to use different Azure AI services"
  - "Master AKS configuration for AI workloads"
  - "Learn MLOps and model serving patterns"
related_topics:
  prerequisites: ["./01_Interview-Overview.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./03_Architecture-Patterns-Part1-A.md", "./04_Interview-Questions-Part1-A.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Study Roadmap - High Priority Topics

**Study in this order** for maximum interview readiness.

---

## 1. Azure AI Landscape & Service Selection

**Critical decision framework:**

### Azure OpenAI (Managed LLMs)

- **Use when**: You need language tasks without building/training models
- **Best for**: General-purpose LLM capabilities, quick time-to-market
- **Key features**: Managed service, high scale, low operational overhead

### Azure Machine Learning (Custom Models)

- **Use when**: You need custom model training, full MLOps, data residency control
- **Best for**: Proprietary models, fine-tuning, supervised learning
- **Key features**: Training pipelines, model registry, experiment tracking

### Cognitive Services / Foundry

- **Use when**: You need pre-built AI capabilities (vision, speech, language)
- **Best for**: Standard AI features without custom development

**Interview talking point:**
> "I use Azure OpenAI for scale and speed; Azure ML + AKS when I need control, isolation, or custom training."

---

## 2. AKS Fundamentals for AI Workloads

**Essential concepts:**

### GPU Node Pools

- Separate GPU pools for inference/training workloads
- Node taints and tolerations for workload isolation
- GPU driver compatibility and node image management

### Pod Scheduling

- Affinity/anti-affinity rules
- Resource requests and limits
- Priority classes for critical workloads

### Node Pool Separation

- CPU node pools for web/orchestration services
- GPU node pools for model inference
- Burstable pools for development/testing

**Interview talking point:**
> "I separate GPU node pools and keep their node images updated—AKS has explicit GPU best practices."

---

## 3. Model Serving & MLOps on Kubernetes

**Deployment options:**

### KServe / Seldon Core

- Model versioning and lifecycle management
- Canary and A/B testing patterns
- Traffic splitting and rollback capabilities

### AKS AI Toolchain Operator

- Managed model deployment on AKS
- Integration with Azure ML model registry
- Automated rollout patterns

**Interview talking point:**
> "I use the AI toolchain operator or managed MLOps for model lifecycle and safe rollout on AKS."

---

## 4. Scaling & Autoscaling Strategies

**Three-layer scaling approach:**

### Horizontal Pod Autoscaler (HPA)

- CPU/GPU utilization-based scaling
- Custom metrics support
- Target utilization thresholds

### KEDA (Kubernetes Event-Driven Autoscaling)

- Queue-based scaling (Service Bus, Event Hub)
- Scale from zero to thousands of pods
- Cost-effective for variable workloads

### Cluster Autoscaler

- Node-level scaling
- Automatic node pool expansion
- Integration with HPA and KEDA

**Interview talking point:**
> "I combine HPA for CPU/GPU metrics, KEDA for queue-driven scaling, and Cluster Autoscaler for node-level scale."

---

## 5. Security & Governance

**Enterprise security model:**

### Managed Identity

- Service-to-service authentication
- No secrets in code or configuration
- Azure AD integration

### Key Vault

- Secret management
- Certificate rotation
- Access policies

### Private Link

- Secure connectivity to Azure services
- VNet integration for AKS
- Data residency compliance

### Access Controls

- Role-based access control (RBAC)
- Data access policies
- Prompt/response redaction for PII

**Interview talking point:**
> "I enforce security via Private Link, Managed Identity, Key Vault, and role-based access with prompt redaction for PII governance."

---

## 6. Observability & SLOs

**Monitoring stack:**

### Application Insights

- End-to-end tracing
- Performance monitoring
- Custom telemetry

### Prometheus + Grafana

- Infrastructure metrics
- Custom dashboards
- Alerting rules

### Model Telemetry

- Prediction latency tracking
- Model drift detection
- Confidence score monitoring

### Logging Strategy

- Prompt/response logging with PII handling
- Audit trails for compliance
- Log aggregation and analysis

---

## 7. Cost & Operational Trade-offs

**Cost optimization strategies:**

### GPU vs CPU Inference

- Right-size GPU SKUs for workload
- Use CPU for lightweight models
- Batch processing for cost efficiency

### Serverless vs AKS

- Container Apps/Azure Functions for low scale
- AKS for heavy models requiring GPU
- Spot instances for training workloads

### Autoscaling Benefits

- Scale to zero when idle (KEDA)
- Off-hours job scheduling
- Resource right-sizing

**Interview talking point:**
> "I optimize costs by right-sizing GPU SKUs, using spot instances for noncritical training, and scheduling training during off-hours."

---

## Study Priority Summary

**Week 1 (High Priority):**

1. Azure AI service selection framework
2. AKS GPU node pool configuration
3. Model serving patterns (KServe/Seldon)

**Week 2 (Medium Priority):**

4. Autoscaling strategies (HPA, KEDA, Cluster Autoscaler)
5. Security patterns (Managed Identity, Key Vault, Private Link)
6. Observability setup (App Insights, Prometheus, Grafana)

**Week 3 (Review):**

7. Cost optimization techniques
8. Architecture pattern practice
9. Whiteboard scenario preparation

---

**Next**: Study **Architecture Patterns** (`./03_Architecture-Patterns-Part1-A.md`) to learn recommended scalable architectures.
