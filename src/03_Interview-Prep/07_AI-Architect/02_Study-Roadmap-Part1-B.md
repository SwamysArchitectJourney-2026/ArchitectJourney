---
learning_level: "Advanced"
prerequisites: ["./02_Study-Roadmap-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master scaling strategies for AI workloads"
  - "Understand security and governance patterns"
  - "Learn observability and cost optimization"
related_topics:
  prerequisites: ["./02_Study-Roadmap-Part1-A.md"]
  builds_upon: ["../Common/02_SystemDesign/"]
  enables: ["./03_Architecture-Patterns-Part1-A.md"]
  cross_refs: ["../Solution-Architect/"]
---

# Study Roadmap - High Priority Topics - Part 2

**Advanced topics** covering scaling, security, and operations.

---

## 4. Scaling & Autoscaling Strategies

**Three-layer scaling approach:**

### Horizontal Pod Autoscaler (HPA)

- CPU/GPU utilization-based scaling
- Custom metrics support
- Target utilization thresholds

### KEDA (Kubernetes Event-Driven Autoscaling)

- Queue-based scaling (Service Bus, Event Hub)
- Scale from zero to thousands of pods
- Cost-effective for variable workloads

### Cluster Autoscaler

- Node-level scaling
- Automatic node pool expansion
- Integration with HPA and KEDA

**Interview talking point:**
> "I combine HPA for CPU/GPU metrics, KEDA for queue-driven scaling, and Cluster Autoscaler for node-level scale."

---

## 5. Security & Governance

**Enterprise security model:**

### Managed Identity

- Service-to-service authentication
- No secrets in code or configuration
- Azure AD integration

### Key Vault

- Secret management
- Certificate rotation
- Access policies

### Private Link

- Secure connectivity to Azure services
- VNet integration for AKS
- Data residency compliance

### Access Controls

- Role-based access control (RBAC)
- Data access policies
- Prompt/response redaction for PII

**Interview talking point:**
> "I enforce security via Private Link, Managed Identity, Key Vault, and role-based access with prompt redaction for PII governance."

---

## 6. Observability & SLOs

**Monitoring stack:**

### Application Insights

- End-to-end tracing
- Performance monitoring
- Custom telemetry

### Prometheus + Grafana

- Infrastructure metrics
- Custom dashboards
- Alerting rules

### Model Telemetry

- Prediction latency tracking
- Model drift detection
- Confidence score monitoring

### Logging Strategy

- Prompt/response logging with PII handling
- Audit trails for compliance
- Log aggregation and analysis

---

## 7. Cost & Operational Trade-offs

**Cost optimization strategies:**

### GPU vs CPU Inference

- Right-size GPU SKUs for workload
- Use CPU for lightweight models
- Batch processing for cost efficiency

### Serverless vs AKS

- Container Apps/Azure Functions for low scale
- AKS for heavy models requiring GPU
- Spot instances for training workloads

### Autoscaling Benefits

- Scale to zero when idle (KEDA)
- Off-hours job scheduling
- Resource right-sizing

**Interview talking point:**
> "I optimize costs by right-sizing GPU SKUs, using spot instances for noncritical training, and scheduling training during off-hours."

---

## Study Priority Summary

**Week 1 (High Priority):**

1. Azure AI service selection framework
2. AKS GPU node pool configuration
3. Model serving patterns (KServe/Seldon)

**Week 2 (Medium Priority):**

4. Autoscaling strategies (HPA, KEDA, Cluster Autoscaler)
5. Security patterns (Managed Identity, Key Vault, Private Link)
6. Observability setup (App Insights, Prometheus, Grafana)

**Week 3 (Review):**

7. Cost optimization techniques
8. Architecture pattern practice
9. Whiteboard scenario preparation

---

**Next**: Study **Architecture Patterns** (`./03_Architecture-Patterns-Part1-A.md`) to learn recommended scalable architectures.
