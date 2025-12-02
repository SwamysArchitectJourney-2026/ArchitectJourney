---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["AKS GPU configuration", "RAG architecture"]
estimated_time: "15 minutes"
learning_objectives:
  - "Prepare for advanced .NET Architect interview questions"
  - "Learn detailed answer frameworks for complex scenarios"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A.md"]
  builds_upon: []
  enables: ["./04_Interview-Questions-Part1-B-B.md"]
  cross_refs: ["../07_AI-Architect/04_Interview-Questions-Part1-B.md"]
---

# .NET Architect Interview Questions (Part 1-B-A)

**Advanced technical questions** covering rollouts, GPU optimization, and observability.

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

**Next**: Continue with **RAG Latency & .NET Integration** (`./04_Interview-Questions-Part1-B-B.md`).
