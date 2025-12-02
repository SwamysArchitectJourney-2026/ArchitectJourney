---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["./07_STAR-Stories.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Learn essential glossary terms for .NET Architect interviews"
  - "Understand key Azure AI and AKS terminology"
related_topics:
  prerequisites: ["./07_STAR-Stories.md"]
  builds_upon: ["./07_STAR-Stories.md"]
  enables: ["./08_Glossary-and-KEDA-Part1-B.md"]
  cross_refs: ["../07_AI-Architect/07_Glossary-and-KEDA-Part1-A.md"]
---

# Glossary and KEDA Guide for .NET Architect - Part 1-A

**Essential terminology** for .NET Architect interviews.

---

## 📚 Essential Glossary

### AKS – Azure Kubernetes Service

Managed Kubernetes platform for deploying, scaling, and managing containerized .NET and AI workloads. Provides automated updates, scaling, and monitoring.

**Why it matters**: Core infrastructure for running .NET microservices and AI models at scale.

---

### KEDA – Kubernetes Event-Driven Autoscaling

CNCF project that enables Kubernetes workloads to scale based on external event sources (queues, messages, streams) rather than just CPU or memory metrics.

**Why it matters**: Essential for cost-efficient, event-driven workloads that need to scale from zero to thousands of pods based on real workload demand.

---

### HPA – Horizontal Pod Autoscaler

Kubernetes controller that automatically scales pod replicas based on CPU, memory, or custom metrics. Works with KEDA for comprehensive autoscaling.

**Why it matters**: Provides resource-based autoscaling for standard workloads.

---

### Cluster Autoscaler

Automatically adjusts the number of nodes in an AKS cluster based on pending pods. Adds nodes when pods can't be scheduled, removes nodes when underutilized.

**Why it matters**: Manages infrastructure capacity automatically, optimizing cost and performance.

---

### Node Pools (CPU/GPU/Spot)

Logical grouping of nodes with similar characteristics. Used for workload isolation and cost optimization.

**Why it matters**: Enables separation of .NET services (CPU) from AI workloads (GPU) with appropriate cost models.

---

### SLO – Service Level Objective

Measurable reliability or performance target (e.g., P95 latency < 200ms, uptime 99.9%). Defines what "good" looks like for a service.

**Why it matters**: Provides clear targets for system design and monitoring.

---

### SLA – Service Level Agreement

Contractual guarantee of availability or uptime offered to customers. Business commitment based on SLOs.

**Why it matters**: Defines business commitments and accountability.

---

### SLI – Service Level Indicator

Metric used to measure whether SLOs are being met (latency, error rate, throughput). The actual measurement.

**Why it matters**: Provides data to evaluate service performance against objectives.

---

### Private Link

Azure service that securely connects services over Microsoft's backbone network, eliminating public internet exposure.

**Why it matters**: Critical for securing AI endpoints and sensitive data in enterprise environments.

---

### Managed Identity

Azure identity mechanism that enables secure service-to-service authentication without storing secrets or credentials.

**Why it matters**: Eliminates secret management overhead and improves security posture.

---

### Azure OpenAI

Managed LLM service providing GPT models with enterprise-grade governance, security, and scaling capabilities.

**Why it matters**: Provides scalable, managed LLM capabilities without infrastructure management.

---

### Azure Machine Learning (Azure ML)

Platform for training, registering, and deploying custom ML/LLM models with full MLOps lifecycle management.

**Why it matters**: Enables custom model development and deployment with governance and versioning.

---

### APIM – Azure API Management

Centralized API gateway providing authentication, throttling, caching, versioning, and observability for APIs.

**Why it matters**: Provides enterprise-grade API management and security at the edge.

---

### Seldon / KServe

Model serving frameworks for hosting ML/LLM models on Kubernetes with autoscaling, versioning, and canary deployment capabilities.

**Why it matters**: Production-grade model serving with advanced deployment patterns.

---

### Cosmos DB / Cognitive Search (Vector Index)

Databases used for storing embeddings and enabling fast semantic search for RAG (Retrieval-Augmented Generation) systems.

**Why it matters**: Enables efficient vector search for AI applications requiring context retrieval.

---

**Next**: [KEDA Deep Dive](./08_Glossary-and-KEDA-Part1-B.md)
