---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure AI services", "AKS configuration", ".NET architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Prepare for common .NET Architect interview questions"
  - "Learn structured answer frameworks"
  - "Understand key decision points and trade-offs"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-A.md"]
  builds_upon: []
  enables: ["./04_Interview-Questions-Part1-B.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: ["../07_AI-Architect/04_Interview-Questions-Part1-A.md"]
---

# .NET Architect Interview Questions (Part 1-A)

**Common technical questions** for .NET Architect interviews with Azure AI and Kubernetes focus.

---

## Question 1: Designing High-Throughput LLM Inference

**Question**: How would you design a system to handle 10,000 queries per second for LLM inference?

### Answer Framework

**Architecture Approach**
- Combine managed Azure OpenAI with AKS GPU inference
- Implement caching layer (Redis) for repeated queries
- Use vector store for retrieval-augmented generation (RAG)
- Autoscale GPU pools based on load

**Key Components**
1. **API Gateway**: Azure API Management with rate limiting and caching
2. **Caching Layer**: Redis for prompt/response caching
3. **Inference Tier**: Hybrid approach with Azure OpenAI and AKS GPU
4. **Autoscaling**: HPA, KEDA, and Cluster Autoscaler

**Performance Optimizations**
- Model quantization for faster inference
- Request batching on GPU nodes
- Connection pooling and warm instances
- Pre-computed embeddings for RAG

**Capacity Planning**
- Measure single-pod throughput (e.g., 50 QPS per pod)
- Calculate required pods: 10,000 ÷ 50 = 200 pods
- Account for cache hit rate (e.g., 40% cache → 6,000 origin QPS)
- Plan node capacity: 200 pods ÷ 20 pods per node = 10 nodes

---

## Question 2: Azure OpenAI vs Azure Machine Learning

**Question**: When should you use Azure OpenAI versus Azure Machine Learning?

### Decision Framework

**Use Azure OpenAI When:**
- You need off-the-shelf language capabilities
- Rapid feature development is priority
- Standard language tasks (text generation, summarization)
- Lower operational overhead is desired
- Managed scaling and availability

**Use Azure Machine Learning When:**
- Custom model training is required
- Fine-tuning on domain-specific data
- Full MLOps lifecycle management needed
- Regulatory compliance requires data control
- Model governance and versioning critical

**Hybrid Approach**
- Route standard tasks to Azure OpenAI
- Use Azure ML for custom/fine-tuned models
- Implement fallback strategies between paths

---

## Question 3: Securing LLM Pipelines

**Question**: How do you secure an LLM pipeline processing sensitive documents?

### Security Strategy

**Network Security**
- Private Link for all Azure OpenAI endpoints
- VNet integration for AKS clusters
- Network policies for pod isolation
- No public internet exposure

**Data Protection**
- PII redaction before external API calls
- Data tokenization for sensitive fields
- Encryption at rest and in transit
- Key Vault for secrets management

**Access Control**
- Managed identities for service authentication
- Role-based access control (RBAC)
- Audit logging for all access
- Regular access reviews

**Compliance Measures**
- Data residency controls
- Audit trails for regulatory requirements
- Prompt/response masking in logs
- DLP (Data Loss Prevention) integration

---

## Question 4: Model Drift Detection and Monitoring

**Question**: How do you detect and manage model drift in production?

### Monitoring Strategy

**Telemetry Collection**
- Inference latency and error rates
- Prediction confidence scores
- Input data distribution tracking
- Business metric correlation

**Drift Detection**
- Statistical tests for distribution changes
- Automated alerts when thresholds exceeded
- Baseline comparison for model performance
- Periodic retraining triggers

**Response Process**
- Automated retraining pipelines via Azure ML
- Model validation before deployment
- Canary rollouts for new model versions
- Automated rollback on performance degradation

---

## Question 5: AKS vs Serverless for Model Hosting

**Question**: What are the trade-offs between hosting models in AKS versus serverless (Container Apps)?

### Comparison Framework

**AKS Advantages**
- Fine-grained control over infrastructure
- GPU support for large models
- Rich tooling ecosystem (KServe, Seldon)
- Persistent state and caching
- Custom runtime configurations

**Serverless Advantages**
- Lower operational overhead
- Automatic scaling and management
- Pay-per-use pricing model
- Faster deployment cycles

**Decision Criteria**
- **Choose AKS**: GPU requirements, custom runtimes, persistent state, complex orchestration
- **Choose Serverless**: Lightweight models, stateless workloads, low operational overhead

---

## 🎯 Answering Strategy

1. **Clarify Requirements**: Ask about scale, latency, compliance needs
2. **Present Architecture**: Draw high-level components and data flow
3. **Explain Trade-offs**: Discuss cost, complexity, performance implications
4. **Provide Examples**: Reference real-world scenarios and patterns
5. **Discuss Alternatives**: Show awareness of other approaches

---

**Next**: [Interview Questions - Part 1-B-A](./04_Interview-Questions-Part1-B-A.md) - Advanced questions and scenarios

