---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["AKS GPU configuration", "RAG architecture", ".NET microservices"]
estimated_time: "25 minutes"
learning_objectives:
  - "Prepare for advanced .NET Architect interview questions"
  - "Learn detailed answer frameworks for complex scenarios"
  - "Understand capacity planning and optimization techniques"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A.md"]
  builds_upon: []
  enables: ["./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: ["../07_AI-Architect/04_Interview-Questions-Part1-B.md"]
---

# .NET Architect Interview Questions (Part 1-B)

**Advanced technical questions** for .NET Architect interviews covering complex scenarios and optimization.

---

## Question 6: Blue/Green and Canary Rollouts for LLMs

**Question**: How would you architect blue/green or canary rollouts for LLM models?

### Answer Framework

**Canary Deployment Strategy:**
- Use traffic routing (API Gateway or service mesh) to split traffic
- Run canary with small percentage of users (e.g., 5-10%)
- Compare key metrics: latency, error rate, business KPIs
- Use automated SLO checks and rollback on violation
- Implement shadow testing (send copy of traffic to canary) for additional validation

**Implementation Approach:**
- Use Seldon/KServe for model versioning and traffic splitting
- Configure weighted routing in API Gateway
- Monitor model-specific metrics (token usage, confidence scores)
- Set up automated rollback triggers based on thresholds

**Key Metrics to Monitor:**
- Inference latency (P95, P99)
- Error rates and failure patterns
- Business metrics (user satisfaction, conversion rates)
- Resource utilization (GPU, memory)

---

## Question 7: GPU Provisioning and Utilization Optimization

**Question**: How do you provision GPUs on AKS and optimize utilization?

### Answer Framework

**GPU Node Pool Configuration:**
- Create dedicated GPU node pools with appropriate VM sizes (NC-series, ND-series)
- Use taints and tolerations to isolate GPU workloads
- Ensure NVIDIA drivers are compatible with node images
- Use device plugins for GPU resource management

**Optimization Techniques:**
- **Batching**: Group multiple inference requests to maximize GPU throughput
- **Model Quantization**: Reduce model precision to increase throughput
- **Multi-Model Serving**: Host multiple models on same GPU
- **Inference Multiplexing**: Share GPU resources across different model types

**Cost Optimization:**
- Use spot instances for non-critical training workloads
- Schedule heavy training jobs during off-hours
- Right-size GPU SKUs based on workload requirements
- Implement autoscaling to scale down during low demand

**Interview Talking Point:**

"GPU provisioning requires dedicated node pools with proper taints. Optimization involves batching, quantization, and multi-model serving. Cost control comes from spot instances, scheduling, and right-sizing."

---

## Question 8: Observability for AI Platform

**Question**: How do you design observability for a combined .NET + AI + AKS platform?

### Answer Framework

**Multi-Dimensional Monitoring:**

**Application Monitoring (Application Insights):**
- Distributed tracing for .NET services
- Dependency tracking across services
- Custom metrics and events
- Performance and availability monitoring

**Infrastructure Monitoring (Prometheus + Grafana):**
- Node and pod metrics
- GPU utilization tracking
- Resource consumption patterns
- Cluster health indicators

**AI-Specific Telemetry:**
- Model inference latency and throughput
- Token usage and cost tracking
- Model drift detection
- Prediction quality metrics
- Input/output distribution tracking

**Logging Strategy:**
- Structured logging with correlation IDs
- PII redaction before logging
- Centralized log aggregation (Log Analytics)
- Retention policies based on compliance requirements

**Alerting:**
- SLO-based alerts (latency, error rate)
- Anomaly detection for model performance
- Resource exhaustion alerts
- Cost threshold alerts

---

## Question 9: Reducing RAG Latency

**Question**: How do you reduce latency for retrieval-augmented generation (RAG)?

### Answer Framework

**Optimization Strategies:**

**Precomputation:**
- Precompute embeddings for all documents
- Store embeddings in high-performance vector store
- Update embeddings incrementally as documents change

**Caching:**
- Cache frequent retrievals in Redis
- Cache top-k search results
- Implement TTL-based cache invalidation

**Index Optimization:**
- Use efficient vector index (approximate nearest neighbor)
- Tune k parameter (number of retrieved documents)
- Optimize index structure for query patterns

**Query Optimization:**
- Reduce contextual window size when possible
- Use lighter embedding models for faster retrieval
- Parallelize embedding and retrieval operations

**Infrastructure:**
- Use local replicas of vector store close to compute
- Warm LLM instances to avoid cold starts
- Use async streaming when acceptable

**Interview Talking Point:**

"RAG latency reduction requires precomputed embeddings, efficient caching, optimized vector indexes, and infrastructure placement. The goal is to minimize retrieval time while maintaining relevance."

---

## Question 10: .NET Microservices Integration with AKS Model Services

**Question**: How do you integrate .NET microservices with AKS model services?

### Answer Framework

**Integration Patterns:**

**API Design:**
- Use gRPC or REST endpoints for model services
- Implement versioned APIs for backward compatibility
- Use contract-first development with OpenAPI/Schema definitions

**Resilience Patterns:**
- Circuit breakers to isolate model failures
- Retry policies with exponential backoff
- Timeout configuration appropriate for model inference
- Fallback to cached responses or simpler models

**Authentication:**
- Use Azure AD managed identities for service-to-service auth
- Implement token-based authentication
- Use Key Vault for API keys and secrets

**Orchestration Layer:**
- Create thin AI orchestration service in .NET
- Handle prompt templating and validation
- Manage retries and fallbacks
- Implement response validation and transformation

**Async Patterns:**
- Use async/await for non-blocking calls
- Implement async batch processing for bulk operations
- Use message queues for long-running inference tasks

**Monitoring:**
- Track model call latency and success rates
- Monitor token usage and costs
- Alert on model service failures
- Correlate .NET service traces with model inference

---

## 🎯 Advanced Answering Strategy

1. **Show Architecture Thinking**: Draw components and data flow
2. **Discuss Trade-offs**: Cost vs. performance, complexity vs. control
3. **Provide Specifics**: Concrete numbers, configurations, examples
4. **Demonstrate Experience**: Reference real-world patterns and best practices

---

**Next**: [Whiteboard Scenarios - Part 1-B](./05_Whiteboard-Scenarios-Part1-B.md) - Additional system design scenarios

