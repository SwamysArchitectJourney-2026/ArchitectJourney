---
learning_level: "Advanced"
prerequisites: ["Azure AI fundamentals", "AKS basics", ".NET microservices"]
estimated_time: "15 minutes"
learning_objectives:
  - "Design scalable enterprise AI architectures on AKS"
  - "Understand component separation and responsibilities"
  - "Learn the two-path LLM strategy (managed vs hosted)"
related_topics:
  prerequisites: ["./02_Study-Roadmap-Part1-B.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./03_Architecture-Patterns-Part1-A-B.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Recommended Scalable Architecture Pattern - Part 1-A

**Scenario**: Enterprise needs low-latency LLM features (summaries, search) + proprietary model fine-tuning and batch ML pipelines.

---

## High-Level Architecture Components

### 1. API Gateway / Ingress Layer

**Components:**

- Azure API Management (APIM) or Kong
- Web Application Firewall (WAF)
- Rate limiting and throttling
- Request routing and load balancing

**Responsibilities:**

- Entry point for all client requests
- Authentication and authorization
- API versioning and routing
- Caching frequently accessed responses

---

### 2. Authentication / Identity Layer

**Components:**

- Azure AD (Entra ID) with managed identities
- OAuth 2.0 / OpenID Connect
- Service-to-service authentication

**Responsibilities:**

- User authentication
- Service-to-service auth (no secrets)
- Role-based access control (RBAC)

---

### 3. LLM Layer (Two-Path Strategy)

**Path 1: Managed LLMs**

- **Azure OpenAI / Foundry** for general-purpose LLM calls
- Sensitive routing to private endpoint via Private Link
- High scale, low operational overhead

**Path 2: Custom Models**

- **AKS-hosted model serving** for fine-tuned or proprietary models
- AI Toolchain Operator / Seldon or KServe for model lifecycle
- Canary/A-B rollout patterns
- Full control and data isolation

**Decision criteria:**

- Use Azure OpenAI for fast delivery, low ops, general tasks
- Use AKS GPU serving when you need fine-tuned models, data isolation, or on-prem-like control

---

### 4. Compute Layer (AKS)

**Node Pool Strategy:**

**CPU Node Pool:**

- Web services and orchestration
- .NET microservices
- API services
- Stateless workloads

**GPU Node Pool(s):**

- Model inference workloads
- Fine-tuned model serving
- Training workloads (separate pool)
- Taints/tolerations for workload isolation

**Best Practices:**

- Keep GPU node pools current with recommended images
- Separate pools by workload type (web, batch, GPU inference, GPU training)
- Upgrade node pools together or carefully orchestrate rolling upgrades

---

**Next**: [Pipelines, Data Layer, and Design Principles](./03_Architecture-Patterns-Part1-A-B.md)
