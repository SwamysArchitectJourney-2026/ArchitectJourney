---
learning_level: "Advanced"
prerequisites: ["Azure AI architecture", "AKS configuration", "RAG patterns"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master the Enterprise RAG Platform whiteboard scenario"
  - "Learn ASCII diagram drawing for interviews"
  - "Understand talking points for RAG architecture"
  - "Practice confident whiteboard delivery"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-C.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./05_Whiteboard-Scenarios-Part1-B.md"]
  cross_refs: []
---

# Whiteboard Scenario 1: Enterprise RAG Platform

**Most commonly asked scenario** for Azure AI + AKS interviews.

---

## What the Interviewer Wants to See

- You know how to design AI workloads
- You can separate LLM, vector index, and microservices
- You understand scalability and security

---

## ASCII Architecture Diagram (Draw This)

```
                  +----------------------+
                  |        Clients       |
                  +-----------+----------+
                              |
                              v
                   +----------+-----------+
                   |   API Gateway (APIM) |
                   +----------+-----------+
                              |
                              v
                    +---------+----------+
                    |  .NET API Services |
                    | (AKS CPU Node Pool)|
                    +---------+----------+
                              |
                              v
       +----------------------+----------------------+
       |         RAG Orchestration Service          |
       |  (Prompts, Retrieval, LLM workflow logic)  |
       +----------------------+----------------------+
                              |
                +-------------+--------------+
                |                            |
                v                            v
   +------------+------------+     +----------+-----------+
   | Vector Store (Search)    |     | Embedding Generator  |
   | Cosmos DB / Cog. Search  |     | (Azure OpenAI / AKS) |
   +------------+------------+     +----------+-----------+
                |                            |
                +-------------+--------------+
                              |
                              v
           +------------------+---------------------+
           | LLM Layer:                             |
           |  - Azure OpenAI (Managed LLM)          |
           |  - Custom Models on AKS GPU Pool      |
           +--------------------------------------+
```

---

## What to Say While Drawing

**Opening:**
> "This is a scalable enterprise RAG architecture for retrieval-augmented generation."

**Component by Component:**

1. **API Layer:**
   > ".NET microservices run on AKS CPU pools, handling API requests and orchestration."

2. **RAG Orchestration:**
   > "The RAG Orchestration Service manages prompts, retrieval logic, and LLM workflow."

3. **Vector Store:**
   > "Embedding vectors live in Cosmos DB or Azure Cognitive Search with vector search enabled."

4. **Embedding Service:**
   > "Documents are embedded using Azure OpenAI or an embedding service running on AKS GPU nodes."

5. **LLM Layer:**
   > "RAG Orchestration fetches relevant context, builds prompts, and calls either Azure OpenAI or fine-tuned models hosted on AKS GPU."

**Closing:**
> "Autoscaling is handled by HPA, KEDA, and cluster autoscaler. Security via Private Link, Managed Identity, and Key Vault."

---

## Key Azure Services to Mention

- **Azure OpenAI** - Managed LLM service
- **Azure Cognitive Search** - Vector index with search
- **AKS** - CPU + GPU node pools
- **APIM** - API gateway and management
- **Azure ML** - Optional for embeddings and model registry
- **Cosmos DB** - Vector store alternative

---

## Keywords to Use

- Vector index
- Private Link for OpenAI
- Multi-node AKS (CPU + GPU)
- Prompt orchestration
- Autoscaling (HPA + KEDA)
- Observability (Prometheus/Grafana)
- Retrieval-augmented generation (RAG)

---

## Scalability Points

**Horizontal Scaling:**

- HPA for pod-level scaling
- KEDA for event-driven scaling
- Cluster Autoscaler for node scaling

**Performance Optimization:**

- Cache frequent retrievals
- Precompute embeddings
- Optimize vector search (k in KNN)

---

## Security Points

**Network Security:**

- Private Link for all Azure services
- VNet integration for AKS
- No public internet exposure

**Data Protection:**

- Key Vault for secrets
- Managed Identity for auth
- Prompt/response redaction for PII

---

## Common Follow-up Questions

**Q: How do you handle high query volume?**

- Autoscale GPU pools
- Cache frequent queries
- Use managed Azure OpenAI for scale

**Q: How do you ensure data privacy?**

- Private Link for all connections
- On-premise-like control with AKS
- Prompt redaction and audit logs

**Q: How do you optimize latency?**

- Precompute embeddings
- Cache retrievals
- Optimize vector search parameters

---

**Next**: Practice **Scenario 2** (`./05_Whiteboard-Scenarios-Part1-B.md`) - Custom Model Serving on AKS.
