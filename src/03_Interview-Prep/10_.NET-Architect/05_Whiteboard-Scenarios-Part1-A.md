---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["System design fundamentals", "Azure AI architecture", ".NET microservices"]
estimated_time: "25 minutes"
learning_objectives:
  - "Practice whiteboard scenarios for .NET Architect interviews"
  - "Learn to draw and explain Azure AI + AKS architectures"
  - "Master key talking points for common scenarios"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A.md", "./04_Interview-Questions-Part1-A.md"]
  builds_upon: []
  enables: ["./06_Cheat-Sheet.md"]
  cross_refs: ["../07_AI-Architect/05_Whiteboard-Scenarios-Part1-A.md"]
---

# Whiteboard Scenarios for .NET Architect (Part 1-A)

**Practice scenarios** for whiteboard sessions in .NET Architect interviews with Azure AI focus.

---

## 🎯 Scenario 1: Enterprise RAG Platform

**Most commonly asked scenario** for Azure AI + .NET Architect roles.

### What Interviewers Want to See

- Understanding of AI workload architecture
- Separation of LLM, vector index, and microservices
- Scalability and security considerations

### Architecture Diagram

```
Clients
   |
API Gateway (APIM)
   |
.NET Microservices (AKS CPU Pool)
   |
RAG Orchestration Service
   |
   +---------------------+
   |                     |
Vector Store       Embedding Service
(Cosmos/CogSearch)   (OpenAI/AKS GPU)
   |                     |
   +----------+----------+
              |
        LLM Layer
   - Azure OpenAI (managed)
   - Custom LLM on AKS GPU
```

### What to Say While Drawing

"This is a scalable enterprise RAG architecture. .NET APIs and RAG orchestration run on AKS CPU nodes. Embeddings are stored in Cosmos or Cognitive Search. For LLM inference, I use Azure OpenAI for general workloads and AKS GPU for private fine-tuned models. Autoscaling is handled by HPA, KEDA, and cluster autoscaler."

### Key Azure Services to Mention

- Azure OpenAI
- Azure Cognitive Search (vector index)
- AKS (CPU + GPU node pools)
- APIM
- Azure ML (optional for embeddings + model registry)

---

## 🎯 Scenario 2: Custom Model Serving on AKS

**Shows Kubernetes + GPU design skills.**

### Architecture Diagram

```
Developers
   |
CI/CD → Azure ML (training + registry)
              |
        Model Registry
              |
Continuous Deployment (GitOps/DevOps)
              |
          AKS Cluster
  +-----------------------------+
  | CPU Nodes  | GPU Node Pool   |
  | API layer  | Model Serving   |
  +------------+-----------------+
                   |
            KServe / Seldon
```

### What to Say

"For custom or regulated models, I deploy them on AKS GPU pools. I use KServe or Seldon for model versioning, canary rollouts, and auto-scaling. Azure ML manages training and pushes new versions into the model registry."

### Key Points

- Separate GPU node pools
- Canary deployments
- Autoscaling for inference traffic
- Node taints and tolerations
- Private Link for securing AKS ↔ data access

---

## 🎯 Scenario 3: AI-Integrated Microservices Platform

**Specifically relevant for .NET + Architect background.**

### Architecture Diagram

```
APIM
   |
.NET microservices on AKS (CPU)
   |
AI Orchestration Service
   |
Azure OpenAI / Custom LLM on AKS (GPU)
   |
Enterprise Storage: Azure SQL / Cosmos
Cache: Redis
Keys: Key Vault
```

### What to Say

"This is a typical enterprise AI microservices platform. API Management acts as the entry point with policies, throttling, and caching. All .NET microservices run on AKS CPU pools. An AI Orchestration Service handles prompt templates, retrieval logic, and fallback between Azure OpenAI and custom models."

### Key Services

- AKS (cluster autoscaler, HPA)
- Azure OpenAI
- Azure SQL / Cosmos DB
- Azure Cache for Redis
- Prometheus/Grafana

---

## 🎯 Common Elements Across All Scenarios

### Scalability

- HPA (CPU/GPU metrics)
- KEDA for queue-based auto-scaling
- Cluster Autoscaler

### Security

- VNet integration
- Private Link
- Key Vault
- Managed Identity

### Reliability

- Canary deployments
- Health probes
- Rolling upgrades

### Observability

- Prometheus + Grafana
- App Insights
- Logging + tracing

### Cost Optimization

- Separate node pools
- Right-size GPU SKUs
- Autoscale to zero (KEDA)
- Spot instances for training workloads

---

## 🎤 How to Choose Which Scenario to Draw

When asked: "Show me an Azure AI + Kubernetes architecture for scalable enterprise solutions."

**Reply**: "Do you want me to demonstrate a RAG platform, custom model serving, microservices + AI, or event-driven AI processing? I can draw any."

This shows architect-level clarity and breadth.

---

**Next**: [Cheat Sheet](./06_Cheat-Sheet.md) - Quick reference guide

