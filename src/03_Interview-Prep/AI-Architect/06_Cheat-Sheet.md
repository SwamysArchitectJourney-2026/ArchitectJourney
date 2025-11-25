---
learning_level: "Advanced"
prerequisites: ["All previous AI-Architect content"]
estimated_time: "15 minutes"
learning_objectives:
  - "Quick reference for interview preparation"
  - "Memorize key talking points"
  - "Review architecture patterns"
  - "Prepare for confident delivery"
related_topics:
  prerequisites: ["./05_Whiteboard-Scenarios-Part1-C.md"]
  builds_upon: ["./01_Interview-Overview.md", "./02_Study-Roadmap.md", "./03_Architecture-Patterns-Part1-A.md", "./04_Interview-Questions-Part1-A.md"]
  enables: []
  cross_refs: ["../Common/01_STAR-Method/"]
---

# AI + .NET Architect Interview Cheat Sheet

**One-page quick reference** for interview day.

---

## 🎯 Your 30-Second Architecture Summary

> "Across all enterprise AI workloads, I separate API services, AI orchestration, and LLM inference.
> I run .NET microservices on AKS CPU pools, custom models on GPU pools, and use Azure OpenAI for scalable managed LLMs.
> Retrieval uses Cosmos/Cognitive Search with vector indexing.
> Security is enforced via Private Link, Managed Identity, and Key Vault.
> Scaling is handled through HPA, KEDA, and Cluster Autoscaler.
> MLOps is driven by Azure ML pipelines with deployments into AKS using GitOps.
> This gives performance, security, and enterprise-grade reliability."

---

## 🔥 Five Must-Know Talking Points

### 1️⃣ Two-Layer LLM Strategy
>
> "Use Azure OpenAI for general LLM needs; use AKS GPU inference for custom or regulated workloads."

### 2️⃣ Node Pool Separation
>
> "AKS → separate CPU pools for .NET apps and GPU pools for AI inference."

### 3️⃣ Autoscaling Strategy
>
> "HPA for CPU/GPU, KEDA for queue-based scaling, Cluster Autoscaler for node-level scale."

### 4️⃣ Data Security
>
> "Private Link, Key Vault, role-based access; prompt redaction and PII governance."

### 5️⃣ MLOps
>
> "Azure ML manages training + versioning → deploy to AKS with canary or blue/green releases."

---

## 🛡 Common Enterprise Answers

### Scaling Strategy

- HPA (CPU/GPU metrics)
- KEDA (queue-driven scaling)
- Cluster Autoscaler
- Multi-node pools (CPU vs GPU)

### Security Model

- Private Link for OpenAI + Storage + SQL
- Managed Identity (never use secrets)
- Key Vault + TLS everywhere
- VNet-integrated AKS

### Cost Optimization

- GPU autoscaling
- Spot GPUs for training
- Off-hours job scheduling
- Cache embeddings & responses

### Observability

- Prometheus + Grafana
- Azure Monitor
- App Insights (traces + logs)
- Model drift alerts via Azure ML

---

## 📋 Quick Decision Framework

**Azure OpenAI vs Azure ML:**

- OpenAI: Fast delivery, low ops, general tasks
- Azure ML: Custom training, MLOps, data control

**AKS vs Serverless:**

- AKS: GPU support, fine control, heavy models
- Serverless: Lower ops, limited GPU, lightweight

**CPU vs GPU Pools:**

- CPU: Web services, APIs, orchestration
- GPU: Model inference, training, compute-intensive

---

## 🎤 Interview Delivery Strategy

**Start with:**
> "Which use case would you like me to draw? RAG, custom models, or microservices + AI?"

**If they say "scalable enterprise solutions":**

- ALWAYS begin with **Scenario 1 (RAG)**
- Draw clean boxes, 1-inch spacing
- Explain autoscaling + security twice

**Whiteboard Tips:**

- Draw 7 boxes max
- Clean, large, center-aligned
- Explain as you draw
- Mention trade-offs

---

## ⚡ Key Azure Services (Memorize)

- **Azure OpenAI** - Managed LLMs
- **Azure Machine Learning** - Training + MLOps
- **AKS** - Kubernetes orchestration
- **APIM** - API gateway
- **Cosmos DB** - Vector store
- **Cognitive Search** - Vector search
- **Key Vault** - Secrets
- **Private Link** - Secure connectivity
- **App Insights** - Observability
- **Prometheus/Grafana** - Metrics

---

## 🎯 Before Starting Whiteboard

**Ask this question:**
> "Would you like me to focus more on the Azure AI layer, the AKS scalability, or the .NET microservices integration?"

**This shows:**

- Clarity
- Communication skills
- Architect-level thinking

---

**Good luck with your interview!** 🚀
