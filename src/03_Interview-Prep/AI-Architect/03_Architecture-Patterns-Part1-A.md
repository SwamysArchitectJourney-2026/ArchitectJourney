---
learning_level: "Advanced"
prerequisites: ["Azure AI fundamentals", "AKS basics", ".NET microservices"]
estimated_time: "25 minutes"
learning_objectives:
  - "Design scalable enterprise AI architectures on AKS"
  - "Understand component separation and responsibilities"
  - "Learn the two-path LLM strategy (managed vs hosted)"
  - "Master node pool separation for CPU and GPU workloads"
related_topics:
  prerequisites: ["./02_Study-Roadmap.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./03_Architecture-Patterns-Part1-B.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Recommended Scalable Architecture Pattern

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

### 5. Pipelines / Training Layer

**Components:**

- Azure Machine Learning for experiments and pipelines
- Model registry for versioning
- CI/CD integration (GitOps) to AKS deployment

**Workflow:**

1. Training pipelines in Azure ML
2. Model versioning in registry
3. Automated deployment to AKS via GitOps
4. Canary rollout with monitoring

---

### 6. Data & Index Layer

**Vector Store Options:**

- Azure Cosmos DB with vector search
- Azure Cognitive Search with vector support
- Embeddings storage and retrieval

**Responsibilities:**

- Store embedding vectors for RAG
- Fast similarity search
- Versioned embeddings
- Metadata management

---

## Key Design Principles

### 1. Separation of Concerns

- **API Layer**: Request handling, routing, caching
- **Orchestration Layer**: Business logic, prompt management, RAG orchestration
- **LLM Layer**: Model inference and generation
- **Data Layer**: Storage, retrieval, embeddings

### 2. Two-Path LLM Strategy

- Managed services for general workloads (speed, scale)
- AKS-hosted for custom/regulated workloads (control, isolation)

### 3. Node Pool Separation

- CPU pools for stateless services
- GPU pools for compute-intensive AI workloads
- Clear workload isolation via taints/tolerations

### 4. Security-First Design

- Private Link for all Azure service connections
- Managed Identity for authentication
- Key Vault for secrets
- VNet integration for network isolation

---

## Architecture Benefits

**Scalability:**

- Horizontal scaling via HPA, KEDA, Cluster Autoscaler
- Independent scaling of CPU and GPU workloads
- Event-driven scaling for variable traffic

**Security:**

- End-to-end encryption
- Private connectivity (Private Link)
- No secrets in code (Managed Identity)
- Data residency compliance

**Reliability:**

- Canary deployments
- Automated rollback
- Health probes and circuit breakers
- Multi-region support (optional)

**Cost Optimization:**

- Right-size GPU SKUs
- Autoscale to zero when idle
- Spot instances for training
- Efficient resource utilization

---

**Next**: Learn **Concrete Configuration** (`./03_Architecture-Patterns-Part1-B.md`) for specific AKS and Azure settings.
