---
learning_level: "Advanced"
prerequisites: ["Azure AI services", "AKS configuration", ".NET architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Answer common technical interview questions confidently"
  - "Understand scaling strategies for high-throughput AI systems"
  - "Learn security patterns for LLM pipelines"
  - "Master model drift detection and monitoring"
related_topics:
  prerequisites: ["./03_Architecture-Patterns-Part1-B.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./04_Interview-Questions-Part1-B.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: []
---

# Top 10 Technical Interview Questions

**Practice these questions** with the provided answer frameworks.

---

## Q1: How would you design low-latency LLM inference for 10k QPS?

**Answer Framework:**

**Architecture Approach:**

- Use a hybrid strategy: managed Azure OpenAI for scale + AKS GPU inference layer for private models
- Front with fast cache (Redis) for frequent queries
- Vector store for retrieval-augmented generation (RAG)

**Scaling Strategy:**

- Autoscale GPU pools based on queue depth and latency
- Use model quantization and batching to maximize throughput
- Horizontal Pod Autoscaler (HPA) with custom metrics

**Optimization Techniques:**

- Pre-compute embeddings for common queries
- Cache prompt templates and responses
- Use connection pooling for model endpoints

**Trade-offs:**

- Cost vs latency: More GPU nodes = lower latency but higher cost
- Batch size: Larger batches = better throughput but higher latency
- Model size: Smaller models = faster but potentially less accurate

---

## Q2: When to use Azure OpenAI vs Azure Machine Learning?

**Decision Framework:**

**Azure OpenAI - Use When:**

- You need off-the-shelf LLMs for quick generation tasks
- Fast time-to-market is critical
- General-purpose language tasks
- You want managed service with low operational overhead

**Azure Machine Learning - Use When:**

- You need custom model training
- Supervised learning requirements
- Full MLOps pipeline needed
- Control over data residency and isolation required
- Proprietary or fine-tuned models needed

**Hybrid Approach:**

- Use Azure OpenAI for general workloads
- Use Azure ML + AKS for custom/regulated workloads
- Route based on data sensitivity and requirements

---

## Q3: How do you secure an LLM pipeline with sensitive documents?

**Security Layers:**

**Network Security:**

- Private Link for all Azure service connections
- VNet integration for AKS
- No public internet exposure

**Data Protection:**

- Key Vault for secrets management
- Data tokenization before processing
- No raw PII logging

**Access Control:**

- Role-based access control (RBAC)
- Managed Identity for service-to-service auth
- Principle of least privilege

**Compliance:**

- Data Loss Prevention (DLP) policies
- Prompt/response redaction for PII
- Anonymize logs for telemetry
- Audit trails for compliance

**Best Practices:**

- Encrypt data at rest and in transit
- Implement data classification
- Regular security audits

---

## Q4: How to manage model drift and monitoring?

**Monitoring Strategy:**

**Inference Telemetry:**

- Track latency (P95, P99)
- Monitor error rates
- Capture confidence scores
- Log prediction distributions

**Data Distribution Monitoring:**

- Compare training vs inference data distributions
- Detect feature drift
- Monitor input data quality

**Retraining Pipeline:**

- Periodic retraining via Azure ML pipelines
- Trigger retraining when drift exceeds thresholds
- Automated model versioning

**Alerting:**

- Set thresholds for drift metrics
- Alert on significant distribution shifts
- Automated rollback if model performance degrades

**Tools:**

- Azure ML model monitoring
- Prometheus for custom metrics
- Application Insights for telemetry

---

## Q5: What are the trade-offs of hosting models in AKS vs serverless (Container Apps)?

**AKS Advantages:**

- Fine-grained control over infrastructure
- GPU support for heavy models
- Richer tooling (KServe, Seldon)
- Persistent state and connections
- Custom networking and security

**Serverless (Container Apps) Advantages:**

- Lower operational overhead
- Automatic scaling
- Pay-per-use pricing
- Faster deployment

**AKS Disadvantages:**

- Higher operational complexity
- Infrastructure management required
- Higher baseline costs

**Serverless Disadvantages:**

- Limited GPU support
- Less control over infrastructure
- Cold start latency
- Limited persistent state

**Decision:**

- Use AKS for heavy models requiring GPU
- Use serverless for lightweight, stateless workloads
- Hybrid: AKS for production, serverless for development/testing

---

## Q6: How would you architect blue/green or canary rollouts for LLMs?

**Canary Deployment:**

**Implementation:**

1. Deploy new model version to subset of pods (10-20%)
2. Route weighted traffic (e.g., 10% to new version)
3. Monitor latency, error rate, business metrics
4. Gradually increase traffic if healthy
5. Automated rollback on threshold breach

**Tools:**

- Seldon Core: Built-in canary support
- KServe: Traffic splitting
- Code-level router with weighted distribution

**Blue/Green Deployment:**

**Pattern:**

1. Deploy new version alongside existing (green)
2. Run shadow traffic for validation
3. Switch traffic at once or gradually
4. Keep old version (blue) for quick rollback

**Use Cases:**

- Major model version changes
- Regulatory compliance requirements
- When canary is not suitable

---

**Next**: Continue with **More Interview Questions** (`./04_Interview-Questions-Part1-B.md`) including RAG optimization and .NET integration.
