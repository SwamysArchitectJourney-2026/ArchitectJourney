---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["MLOps patterns", "GPU management", "Event-driven architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Practice additional whiteboard scenarios for .NET Architect interviews"
  - "Learn MLOps pipeline and event-driven architecture patterns"
  - "Master advanced system design scenarios"
related_topics:
  prerequisites: ["./05_Whiteboard-Scenarios-Part1-A.md"]
  builds_upon: []
  enables: ["./06_Cheat-Sheet.md"]
  cross_refs: ["../07_AI-Architect/05_Whiteboard-Scenarios-Part1-B.md"]
---

# Whiteboard Scenarios for .NET Architect (Part 1-B)

**Additional practice scenarios** for whiteboard sessions covering MLOps and event-driven architectures.

---

## 🎯 Scenario 4: End-to-End MLOps Pipeline

**Shows MLOps expertise and CI/CD integration.**

### Architecture Diagram

```
GitHub / Azure DevOps
        |
Azure ML (training pipelines)
        |
Model Registry
        |
Continuous Deployment (GitOps/DevOps)
        |
          AKS Cluster
  +-----------------------------+
  | CPU Nodes  | GPU Node Pool   |
  | API layer  | Model Serving   |
  +------------+-----------------+
                   |
            KServe / Seldon
                   |
            APIM → Consumers
```

### What to Say

"This is an enterprise MLOps setup. Models are trained via Azure ML pipelines, stored in the registry, and deployed to AKS using GitOps or DevOps CI/CD. Inference endpoints are exposed through APIM. The pipeline includes validation, testing, and automated rollback capabilities."

### Key Components

- **Model Training**: Azure ML pipelines with experiment tracking
- **Model Registry**: Versioned model storage with metadata
- **Deployment**: Automated CI/CD to AKS GPU pools
- **Serving**: KServe/Seldon for model runtime
- **Monitoring**: Model performance and drift detection

### Things They Expect

- Versioning strategy
- Canary rollout process
- Rollback mechanisms
- Monitoring for model drift
- Trigger retraining pipelines

---

## 🎯 Scenario 5: High-Throughput Event-Driven AI Processing

**Real enterprise requirement: document processing, forms, emails.**

### Architecture Diagram

```
Event Source (Service Bus / Event Hub / Storage Queue)
       |
KEDA (triggers)
       |
AKS Worker Pods (CPU)
       |
AI Processing Pod → Azure OpenAI / AKS GPU
       |
Storage / Cosmos / SQL
```

### What to Say

"For event-driven processing like document extraction, summarization, translation, I use KEDA to scale AKS workers based on queue depth. Workers call embeddings or OpenAI endpoints. This scales from 0 to thousands of pods automatically based on event load."

### Must Mention

- **KEDA Event Triggers**: Queue depth, message rate, Kafka lag
- **Autoscaling**: Scale to zero when no work, rapid scale-out
- **Separation**: Worker pods vs inference pods
- **Cost Efficiency**: Pay only when processing events

### Use Cases

- Document ingestion and processing
- Email analysis and routing
- Form data extraction
- Batch summarization tasks
- Translation services

---

## 🎯 Scenario 6: Multi-Region High-Availability AI Platform

**Enterprise requirement: global scale with disaster recovery.**

### Architecture Diagram

```
Users (Region A)    Users (Region B)
   |                     |
Edge CDN (Front Door / CDN)
   |                     |
Region A Infra        Region B Infra
(API Gateway, AKS, Databases (replicated))
   \_________Geo DB Replication / Traffic Manager_________/
Centralized services: Auth (Azure AD), Logging, CI/CD
```

### What to Say

"This is a global multi-region architecture. Front Door routes traffic to nearest region. Each region has independent AKS clusters with GPU pools. Data is geo-replicated for disaster recovery. Centralized services like auth and CI/CD are shared across regions."

### Key Design Decisions

- **Active-Active vs Active-Passive**: Choose based on RPO/RTO requirements
- **Data Replication**: Geo-replication with conflict resolution
- **Traffic Management**: Health-based routing and failover
- **Consistency Model**: Eventual consistency with conflict handling

### NFRs to Mention

- RPO/RTO targets
- Data residency constraints
- Consistency model (strong vs eventual)
- Network partition handling
- Cost vs latency trade-offs

---

## 🎯 Common Patterns Across Scenarios

### Scalability Patterns

- **Horizontal Scaling**: Pod and node autoscaling
- **Event-Driven Scaling**: KEDA for queue-based workloads
- **Geographic Distribution**: Multi-region for global scale

### Reliability Patterns

- **Redundancy**: Multiple regions and availability zones
- **Failover**: Automated traffic routing and health checks
- **Rollback**: Automated rollback on SLO violations

### Security Patterns

- **Network Isolation**: VNet integration and private endpoints
- **Identity**: Managed identities and Azure AD
- **Data Protection**: Encryption and PII redaction

### Cost Optimization

- **Right-Sizing**: Match resources to workload requirements
- **Autoscaling**: Scale to zero for idle workloads
- **Scheduling**: Off-hours processing for batch jobs

---

## 🎤 Scenario Selection Strategy

When asked to design a system, clarify:
- **Scale requirements**: Expected QPS, data volume
- **Latency requirements**: P95/P99 targets
- **Availability requirements**: RPO/RTO, uptime SLA
- **Compliance requirements**: Data residency, security standards

This shows architect-level thinking and ensures you design the right solution.

---

**Next**: [Cheat Sheet](./06_Cheat-Sheet.md) - Quick reference guide

