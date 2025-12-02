---
learning_level: "Advanced"
prerequisites: ["./04_Interview-Questions-Part1-A-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Answer advanced technical questions on GPU optimization"
  - "Master observability design for AI platforms"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A-B.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./04_Interview-Questions-Part1-B-B.md"]
  cross_refs: []
---

# Interview Questions (Continued) - Part 1-A

**Advanced technical questions** covering GPU optimization and observability.

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

**Next**: Continue with **RAG Optimization & .NET Integration** (`./04_Interview-Questions-Part1-B-B.md`).
