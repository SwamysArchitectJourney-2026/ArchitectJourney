---
learning_level: "Advanced"
prerequisites: ["AKS GPU configuration", "RAG architecture", ".NET microservices"]
estimated_time: "25 minutes"
learning_objectives:
  - "Answer advanced technical questions on GPU optimization"
  - "Understand RAG latency reduction techniques"
  - "Learn .NET microservices integration patterns"
  - "Master observability design for AI platforms"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./04_Interview-Questions-Part1-C.md", "./05_Whiteboard-Scenarios-Part1-A.md"]
  cross_refs: []
---

# Interview Questions (Continued)

**Advanced technical questions** with detailed answer frameworks.

---

## Q7: How to provision GPUs on AKS and optimize utilization?

**GPU Provisioning:**

**Node Pool Creation:**

- Create dedicated GPU node pools
- Use appropriate GPU SKUs (NC6s_v3, NC_A100_v4)
- Configure taints for workload isolation

**Pod Scheduling:**

- Use taints/tolerations to ensure only GPU workloads run on GPU pools
- Resource requests: `nvidia.com/gpu: 1` (or required count)
- Device plugins for GPU access

**Optimization Techniques:**

**Inference Batching:**

- Batch multiple requests together
- Maximize GPU utilization
- Reduce per-request overhead

**Model Quantization:**

- Reduce model size and memory requirements
- Faster inference with lower GPU requirements
- Trade-off: Slight accuracy reduction

**Node Image Management:**

- Keep GPU node pool images current
- Use AKS-recommended NVIDIA driver versions
- Regular updates for security and performance

**Monitoring:**

- Track GPU utilization metrics
- Identify underutilized resources
- Right-size based on actual usage

---

## Q8: How do you design observability for an AI platform?

**Multi-Layer Observability:**

**Application Traces:**

- Application Insights for end-to-end tracing
- Distributed tracing across services
- Request flow visualization

**Infrastructure Metrics:**

- Prometheus for infrastructure metrics
- GPU utilization, CPU, memory
- Network and storage metrics

**Model Metrics:**

- Prediction latency (P95, P99)
- Confidence score distributions
- Error rates by model version
- Throughput and QPS

**Logging Strategy:**

- Structured logging with correlation IDs
- Privacy controls for PII
- Log aggregation and analysis
- Audit trails for compliance

**Dashboards:**

- Grafana dashboards for visualization
- Real-time monitoring
- Custom alerts and notifications

**Best Practices:**

- Correlate traces, metrics, and logs
- Set up proactive alerting
- Regular review of observability data

---

## Q9: How to reduce latency for retrieval-augmented generation (RAG)?

**Optimization Strategies:**

**Precomputation:**

- Precompute embeddings for common documents
- Cache frequent retrievals
- Batch embedding generation

**Vector Index Optimization:**

- Use efficient vector index (Cosmos/managed vector DB)
- Optimize index structure (HNSW, IVF)
- Tune k in KNN search (retrieval count)

**Caching Strategy:**

- Cache frequent queries and responses
- Redis for prompt/response caching
- Embedding cache for common documents

**Parallel Processing:**

- Parallel retrieval and LLM calls
- Async processing where possible
- Optimize retrieval pipeline

**Model Optimization:**

- Use smaller, faster models for retrieval
- Quantize models for faster inference
- Optimize prompt length

**Network Optimization:**

- Co-locate services in same region
- Use Private Link for low latency
- Optimize data transfer

**Trade-offs:**

- Cache size vs memory cost
- Retrieval accuracy vs speed
- Model size vs latency

---

## Q10: How to integrate .NET microservices with AKS model services?

**Integration Patterns:**

**Communication Protocols:**

- gRPC for high-performance service-to-service calls
- REST APIs for external clients
- Async messaging for batch jobs

**Service Contracts:**

- Versioned APIs for backward compatibility
- Contract-first design
- OpenAPI/Swagger specifications

**Resilience Patterns:**

- Circuit breakers for fault tolerance
- Retry policies with exponential backoff
- Timeout configuration

**Client SDKs:**

- Provide client SDKs for .NET services
- Abstract service discovery
- Handle authentication automatically

**Authentication:**

- Azure AD for service-to-service auth
- Managed Identity (no secrets)
- OAuth 2.0 / OpenID Connect

**Async Patterns:**

- Async/await for non-blocking calls
- Message queues for batch processing
- Event-driven architecture

**Best Practices:**

- Health checks and readiness probes
- Graceful degradation
- Monitoring and observability
- Error handling and logging

---

**Next**: Review **STAR Method Examples** (`./04_Interview-Questions-Part1-C.md`) for behavioral interview preparation.
