---
learning_level: "Advanced"
prerequisites: ["./04_Interview-Questions-Part1-A-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master model drift detection and monitoring"
  - "Understand trade-offs between AKS and Serverless for AI"
  - "Design rollout strategies (Canary, Blue/Green)"
related_topics:
  prerequisites: ["./04_Interview-Questions-Part1-A-A.md"]
  builds_upon: ["./02_Study-Roadmap.md"]
  enables: ["./04_Interview-Questions-Part1-B.md"]
  cross_refs: []
---

# Top 10 Technical Interview Questions - Part 1-B

**Advanced questions** covering monitoring, hosting trade-offs, and deployment strategies.

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
