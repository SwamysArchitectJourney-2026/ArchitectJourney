---
learning_level: "Advanced"
prerequisites: ["Azure fundamentals", "Kubernetes basics", ".NET architecture"]
estimated_time: "15 minutes"
learning_objectives:
  - "Prioritize study topics for AI + .NET Architect interviews"
  - "Understand when to use different Azure AI services"
  - "Master AKS configuration for AI workloads"
related_topics:
  prerequisites: ["./01_Interview-Overview.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./02_Study-Roadmap-Part1-B.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Study Roadmap - High Priority Topics - Part 1

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

**Next**: [Scaling, Security, and Observability](./02_Study-Roadmap-Part1-B.md)
