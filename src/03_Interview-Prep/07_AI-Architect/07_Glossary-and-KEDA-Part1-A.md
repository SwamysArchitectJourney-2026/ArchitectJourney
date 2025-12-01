---
learning_level: "Advanced"
prerequisites: ["Kubernetes basics", "Autoscaling concepts"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand KEDA (Kubernetes Event-Driven Autoscaling)"
  - "Master key terminology for AI + .NET Architect interviews"
  - "Learn when and how to use KEDA"
  - "Prepare 30-second KEDA explanation for interviews"
related_topics:
  prerequisites: ["./02_Study-Roadmap.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./07_Glossary-and-KEDA-Part1-B.md", "./04_Interview-Questions-Part1-A.md"]
  cross_refs: []
---

# Glossary of Key Terms & KEDA Deep Dive

**Essential terminology and KEDA explanation** for AI + .NET Architect interviews.

---

## KEDA - Kubernetes Event-Driven Autoscaling

**Full Form:** KEDA = Kubernetes Event-Driven Autoscaling

**What It Is:**
- CNCF project that allows Kubernetes workloads to scale based on external event sources
- Integrates with Kubernetes' Horizontal Pod Autoscaler (HPA)
- Enables scale-to-zero and rapid scale-out when events spike

**Event Sources Supported:**
- Azure Service Bus
- Azure Event Hubs
- Kafka
- RabbitMQ
- Redis
- HTTP queue depth
- Cron schedules
- Custom metrics

---

## 30-Second Interview Explanation of KEDA

**Memorize this answer:**

> "KEDA stands for Kubernetes Event-Driven Autoscaling.
> It extends Kubernetes by letting applications scale based on external event sources — like queue depth, messages, Kafka lag, or schedules — instead of only CPU or memory.
> KEDA works alongside HPA, enabling fast scale-out, scale-to-zero, and cost-efficient event-driven workloads.
> It's essential in modern cloud systems where workloads spike when events arrive, such as document processing, IoT ingestion, or asynchronous AI pipelines."

---

## Key Terminology

### AKS – Azure Kubernetes Service
Managed Kubernetes service for deploying, scaling, and managing containerized .NET/AI workloads.

### KEDA – Kubernetes Event-Driven Autoscaling
Autoscaling engine that scales pods based on external event sources (queues, messages, streams). Supports scale-to-zero.

### HPA – Horizontal Pod Autoscaler
Kubernetes controller that scales pods based on CPU/GPU/memory/custom metrics.

### Cluster Autoscaler
Automatically adjusts the number of nodes in the cluster (VMs) based on pending pods.

### Node Pools (CPU/GPU/Spot)
Logical grouping of nodes. Used for workload separation (e.g., .NET apps on CPU, models on GPU).

### SLO – Service Level Objective
Measurable reliability/performance target (e.g., P95 latency < 200ms, uptime 99.9%).

### SLA – Service Level Agreement
Contractual guarantee of availability/uptime offered to customers.

### SLI – Service Level Indicator
Metric used to measure SLOs (latency, error rate, throughput).

---

## Why Each Component Is Used

**AKS** → To run scalable microservices, AI models, and distributed systems with full control.

**KEDA** → To autoscale pods based on real workloads (queue length, events), not just CPU.

**HPA** → To scale pods automatically when resource usage increases.

**Cluster Autoscaler** → To add/remove Kubernetes nodes automatically, reducing cost.

**Node Pools** → To isolate workloads (CPU apps vs GPU models).

**SLOs** → To quantify expected reliability/latency of the system.

**SLIs** → To measure whether you're meeting SLOs.

**SLAs** → To define contractual uptime for customers.

---

## KEDA Architecture Diagram (Whiteboard-Friendly)

```
                 +----------------------------+
                 |      Event Source          |
                 | (Service Bus, Kafka, SQS,  |
                 |  Event Hub, Redis, Cron)   |
                 +-------------+--------------+
                               |
                        polls metrics
                               |
                               v
                        +------+------+
                        |    KEDA     |
                        | (Scaler)    |
                        +------+------+
                               |
                        updates HPA
                               |
                               v
    +----------------------------------------------------------+
    |                       AKS Cluster                        |
    |  +------------------------------+   replicas scale up/down|
    |  |  Worker Deployment (Pods)    |<-----------------------+|
    |  +------------------------------+                        |
    +----------------------------------------------------------+
```

**How to explain while drawing:**
- "Event source exposes queue depth or lag → KEDA fetches metric → updates HPA → pods scale up/down."
- "If the queue is empty, KEDA allows scale-to-zero for cost efficiency."
- "Useful for AI workloads like asynchronous document analysis, RAG batch pipelines, ELT pipelines, or background .NET workers."

---

**Next**: Continue with **More Glossary Terms** (`./07_Glossary-and-KEDA-Part1-B.md`) including Azure services and QPS calculations.

