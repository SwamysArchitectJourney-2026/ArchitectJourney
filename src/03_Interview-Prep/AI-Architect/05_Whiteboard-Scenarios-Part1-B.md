---
learning_level: "Advanced"
prerequisites: ["Kubernetes model serving", "MLOps patterns", "GPU management"]
estimated_time: "25 minutes"
learning_objectives:
  - "Master custom model serving whiteboard scenario"
  - "Learn MLOps pipeline design"
  - "Understand canary deployment patterns"
  - "Practice GPU node pool architecture"
related_topics:
  prerequisites: ["./05_Whiteboard-Scenarios-Part1-A.md"]
  builds_upon: ["./03_Architecture-Patterns-Part1-B.md"]
  enables: ["./05_Whiteboard-Scenarios-Part1-C.md"]
  cross_refs: []
---

# Whiteboard Scenario 2: Custom Model Serving on AKS

**Shows Kubernetes mastery** and MLOps expertise.

---

## What the Interviewer Wants to See

- You understand model lifecycle management
- You can design canary deployment patterns
- You know GPU node pool configuration
- You understand MLOps pipelines

---

## ASCII Architecture Diagram (Draw This)

```
   Developers
       |
       v
+-------------------------+
|   GitHub / Azure DevOps |
+-----------+-------------+
            |
            v
+-----------+--------------+
|   Azure Machine Learning |
| (Training Pipelines)     |
+-----------+--------------+
            |
            v
     +------+------+
     | Model Registry |
     +------+------+
            |
            v
+-----------+-------------------------------+
| Continuous Deployment (GitOps/DevOps)     |
+-----------+-------------------------------+
            |
            v
   +--------+-------------------------------------+
   |           AKS Cluster                         |
   |  +--------------------+  +------------------+  |
   |  | CPU Node Pool      |  | GPU Node Pool    |  |
   |  | (API Services)     |  | (Model Serving)  |  |
   |  +--------------------+  +------------------+  |
   |               |                    |
   |               |                    v
   |               |           +--------+---------+
   |               |           | KServe / Seldon  |
   |               |           | (Model Runtime)  |
   |               |           +--------+---------+
   +-----------------------------------------------+
            |
            v
   +--------+---------+
   | Ingress / APIM    |
   +--------+---------+
            |
            v
        Consumers
```

---

## What to Say While Drawing

**Opening:**
> "For custom, private, or fine-tuned models, I deploy them on AKS GPU node pools."

**Component by Component:**

1. **Training Pipeline:**
   > "Training happens in Azure ML pipelines; the trained model is pushed to the Azure ML model registry."

2. **Deployment:**
   > "Deployments to AKS GPU nodes are handled via GitOps or CI/CD pipelines."

3. **Model Serving:**
   > "I use KServe or Seldon for model serving, autoscaling, canary releases, traffic splitting, and rollbacks."

4. **Node Pools:**
   > "Separate CPU pools for API services and GPU pools for model serving with taints/tolerations."

5. **Exposure:**
   > "Ingress and APIM expose the model endpoints to applications."

**Closing:**
> "Observability uses Prometheus + Grafana + App Insights. Security via Private Link, Key Vault, and Managed Identity."

---

## Key Points to Emphasize

**GPU Node Pools:**
- Separate pools for inference vs training
- Taints and tolerations for isolation
- Right-sized GPU SKUs

**Canary Deployment:**
- Traffic splitting (10% to new version)
- Monitor latency, error rate, business metrics
- Automated rollback on threshold breach

**Model Registry:**
- Versioning and lifecycle management
- Integration with Azure ML
- Automated deployment triggers

**Zero-Downtime Rollouts:**
- Rolling updates
- Health probes
- Graceful degradation

---

## Keywords to Use

- GPU node pools
- Node taints and tolerations
- Canary deployment
- Model registry
- Zero-downtime rollouts
- Policy governance (OPA + Azure Policy)
- MLOps pipeline

---

## MLOps Pipeline Flow

**1. Training:**
- Azure ML experiments
- Hyperparameter tuning
- Model validation

**2. Registry:**
- Model versioning
- Metadata storage
- Approval workflows

**3. Deployment:**
- GitOps or CI/CD
- Automated to AKS
- Canary rollout

**4. Monitoring:**
- Model performance
- Drift detection
- Automated retraining triggers

---

## Common Follow-up Questions

**Q: How do you handle model versioning?**
- Azure ML model registry
- Semantic versioning
- Rollback capabilities

**Q: How do you ensure model quality?**
- Automated testing
- Shadow traffic
- A/B testing

**Q: How do you optimize GPU utilization?**
- Inference batching
- Model quantization
- Right-sizing SKUs

---

**Next**: Practice **Scenario 3** (`./05_Whiteboard-Scenarios-Part1-C.md`) - AI-Integrated Microservices Platform.

