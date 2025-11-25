---
learning_level: "Advanced"
prerequisites: [".NET microservices", "AI orchestration", "Service integration"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master AI-integrated microservices whiteboard scenario"
  - "Learn .NET microservices architecture on AKS"
  - "Understand AI orchestration patterns"
  - "Practice fallback and routing strategies"
related_topics:
  prerequisites: ["./05_Whiteboard-Scenarios-Part1-B.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-A.md"]
  enables: ["./06_Cheat-Sheet.md"]
  cross_refs: []
---

# Whiteboard Scenario 3: AI-Integrated Microservices Platform

**Big hit in solution architect interviews** - shows .NET + AI integration expertise.

---

## ASCII Architecture Diagram (Draw This)

```
            +-----------------------------+
            |          Clients            |
            +-----------------------------+
                        |
                        v
               +--------+--------+
               |   API Gateway   |
               |     (APIM)      |
               +--------+--------+
                        |
                        v
        +---------------+-----------------+
        |      AKS CPU Node Pool          |
        |  (.NET Microservices Layer)     |
        +---------------+-----------------+
                        |
                        v
         +--------------+--------------+
         |     AI Orchestration        |
         | (Prompt mgmt, RAG calls,    |
         |  routing to model endpoints)|
         +--------------+--------------+
                        |
                        v
   +---------------------+------------------------+
   |                  LLM Layer                  |
   |   - Azure OpenAI (Managed)                  |
   |   - Custom Models on AKS GPU Pool           |
   +---------------------+------------------------+
                        |
                        v
     +-------------------------------------------+
     |   Enterprise Storage: Azure SQL / Cosmos  |
     |   Cache: Redis                             |
     |   Keys: Key Vault                          |
     +-------------------------------------------+
```

---

## What to Say While Drawing

**Opening:**
> "This is a typical enterprise AI microservices platform combining .NET services with AI capabilities."

**Component by Component:**

1. **API Gateway:**
   > "API Management acts as the entry point with policies, throttling, and caching."

2. **Microservices Layer:**
   > "All .NET microservices run on AKS CPU pools—clean separation of compute."

3. **AI Orchestration:**
   > "The AI Orchestration Service handles prompt templates, retrieval logic, fallback between Azure OpenAI and custom models, and response validation."

4. **LLM Layer:**
   > "LLMs run in two places: Azure OpenAI for general-purpose workloads, and AKS GPU pool for private, high-control workloads."

5. **Data Tier:**
   > "Data tier uses SQL, Cosmos, Blob, and Redis for caching."

**Closing:**
> "Observability with App Insights + Prometheus. Secured using Managed Identity + Private Link + Key Vault."

---

## Key Services to Mention

- **AKS** - Cluster autoscaler, HPA
- **Azure OpenAI** - Managed LLM service
- **Azure SQL / Cosmos DB** - Data storage
- **Azure Cache for Redis** - Caching prompt/response
- **Prometheus/Grafana** - Observability
- **Key Vault** - Secrets management

---

## Keywords to Use

- Separation of concerns
- Polyglot persistence
- AI orchestration
- Fallback model strategy
- Multi-LLM routing
- Circuit breakers + retries
- Service mesh (optional mention)

---

## Design Patterns

**Orchestration Pattern:**
- Centralized AI orchestration service
- Manages complex workflows
- Handles routing and fallback

**Fallback Strategy:**
- Primary: Azure OpenAI
- Fallback: AKS custom models
- Graceful degradation

**Caching Strategy:**
- Redis for prompt/response caching
- Reduce LLM API calls
- Improve latency

---

## Common Follow-up Questions

**Q: How do you handle service failures?**
- Circuit breakers
- Retry policies
- Fallback to alternative models

**Q: How do you scale this architecture?**
- HPA for microservices
- KEDA for event-driven scaling
- Cluster Autoscaler for nodes

**Q: How do you ensure consistency?**
- Event-driven architecture
- Saga pattern for distributed transactions
- Eventual consistency model

---

**Next**: Review the **Cheat Sheet** (`./06_Cheat-Sheet.md`) for quick reference before your interview.

