---
learning_level: "Advanced"
prerequisites: ["./07_Glossary-and-KEDA-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master Azure AI and infrastructure terminology"
  - "Understand the purpose of key Azure services"
related_topics:
  prerequisites: ["./07_Glossary-and-KEDA-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-A.md"]
  enables: ["./07_Glossary-and-KEDA-Part1-B-B.md"]
  cross_refs: []
---

# Azure Services Glossary - Part 1-B-A

**Complete terminology** for Azure AI and infrastructure services.

---

## Azure Services Terminology

### Private Link

Securely connects services over Microsoft backbone — no public internet exposure.

### Managed Identity

Azure identity mechanism enabling secure service-to-service authentication without secrets.

### Azure OpenAI

Managed LLM service providing GPT models with enterprise-grade governance and security.

### Azure Machine Learning (Azure ML)

Platform for training, registering, deploying custom ML/LLM models.

### APIM – Azure API Management

Centralized API gateway for authentication, throttling, caching, and observability.

### Ingress Controller

Kubernetes component that routes external traffic into cluster services.

### Seldon / KServe

Model serving frameworks for hosting ML/LLM models on Kubernetes with autoscaling and canarying.

### Cosmos DB / Cognitive Search (Vector Index)

Databases used for storing embeddings and enabling fast retrieval for RAG systems.

### Redis Cache

In-memory cache used to reduce latency and load.

### Key Vault

Secure secrets, certificates, and keys store.

### App Insights

Telemetry provider for distributed tracing, logging, and metrics.

### Prometheus + Grafana

Monitoring stack for AKS metrics and dashboards.

---

## Why Each Azure Service Is Used

**Private Link** → To prevent exposing LLM endpoints to the public internet.

**Managed Identity** → To eliminate secrets and increase security.

**Azure OpenAI** → To consume LLMs without managing infrastructure.

**Azure ML** → For custom model training, MLOps, and controlled model lifecycle.

**APIM** → To enforce throttling, caching, auth, rate limits, and expose APIs securely.

**Ingress Controller** → To route requests inside the AKS cluster.

**Seldon/KServe** → For production-grade LLM hosting on GPU nodes.

**Vector DB (Cosmos/CogSearch)** → For fast semantic search (RAG).

**Redis** → To reduce LLM latency through caching.

**Key Vault** → For secrets management and compliance.

**Prometheus/Grafana** → For advanced monitoring/alerts.

**App Insights** → For distributed tracing in .NET/AKS.

---

**Next**: Continue with **QPS & Capacity Planning** (`./07_Glossary-and-KEDA-Part1-B-B.md`).
