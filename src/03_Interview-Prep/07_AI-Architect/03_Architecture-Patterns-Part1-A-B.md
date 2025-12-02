---
learning_level: "Advanced"
prerequisites: ["./03_Architecture-Patterns-Part1-A-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master node pool separation for CPU and GPU workloads"
  - "Understand data and pipeline layers"
  - "Learn key design principles for AI architecture"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A-A.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./03_Architecture-Patterns-Part1-B.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Recommended Scalable Architecture Pattern - Part 1-B

**Advanced components** covering pipelines, data, and design principles.

---

## 5. Pipelines / Training Layer

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

## 6. Data & Index Layer

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
