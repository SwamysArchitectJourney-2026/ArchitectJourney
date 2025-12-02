---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["All previous .NET-Architect content"]
estimated_time: "25 minutes"
learning_objectives:
  - "Quick reference for key concepts and talking points"
  - "Memorize essential soundbites for interviews"
  - "Review architecture patterns and decision frameworks"
related_topics:
  prerequisites: ["./08_Glossary-and-KEDA-Part1-B.md"]
  builds_upon: []
  enables: []
  cross_refs: ["../07_AI-Architect/06_Cheat-Sheet.md"]
---

# .NET Architect Interview Cheat Sheet

**Quick reference guide** for .NET Architect interviews with Azure AI and Kubernetes focus.

---

## 🎯 Key Talking Points (Memorize These)

### 1️⃣ Two-Layer LLM Strategy

"Use Azure OpenAI for general LLM needs; use AKS GPU inference for custom or regulated workloads."

### 2️⃣ Node Pool Separation

"AKS → separate CPU pools for .NET apps and GPU pools for AI inference."

### 3️⃣ Autoscaling Strategy

"HPA for CPU/GPU, KEDA for queue-based scaling, Cluster Autoscaler for node-level scale."

### 4️⃣ Data Security

"Private Link, Key Vault, role-based access; prompt redaction and PII governance."

### 5️⃣ MLOps

"Azure ML manages training + versioning → deploy to AKS with canary or blue/green releases."

---

## 🏗️ Architecture Decision Framework

### Azure OpenAI vs Azure Machine Learning

**Use Azure OpenAI when:**
- Off-the-shelf LLM capabilities needed
- Rapid feature development priority
- Standard language tasks
- Lower operational overhead desired

**Use Azure ML when:**
- Custom model training required
- Fine-tuning on domain data
- Full MLOps lifecycle needed
- Regulatory compliance critical

### AKS vs Serverless (Container Apps)

**Use AKS when:**
- GPU support required
- Fine-grained control needed
- Persistent state required
- Custom runtimes needed

**Use Serverless when:**
- Lightweight, stateless workloads
- Low operational overhead priority
- No GPU requirements
- Simple deployment needs

---

## 📊 Autoscaling Layers

### Horizontal Pod Autoscaler (HPA)
- Scales pods based on CPU, memory, custom metrics
- Fast response to load changes
- Works with existing Kubernetes resources

### KEDA (Event-Driven Autoscaling)
- Scales based on external event sources
- Queue depth, Kafka lag, HTTP requests
- Enables scale-to-zero for cost efficiency

### Cluster Autoscaler
- Adds/removes nodes based on pending pods
- Works with node pool configurations
- Manages infrastructure capacity

---

## 🔒 Security Checklist

- ✅ Private Link for Azure OpenAI endpoints
- ✅ VNet integration for AKS clusters
- ✅ Managed identities for service authentication
- ✅ Key Vault for secrets management
- ✅ PII redaction in logs and telemetry
- ✅ Role-based access control (RBAC)
- ✅ Network policies for pod isolation

---

## 📈 Key Metrics to Track

### Performance Metrics
- P95/P99 latency for API calls
- Throughput (requests per second)
- Error rates and failure patterns
- GPU utilization percentage

### Business Metrics
- Model prediction accuracy
- Cost per inference
- User satisfaction scores
- Feature adoption rates

---

## 💡 Interview Soundbites

**30-Second Architecture Summary:**

"Across all enterprise AI workloads, I separate API services, AI orchestration, and LLM inference. I run .NET microservices on AKS CPU pools, custom models on GPU pools, and use Azure OpenAI for scalable managed LLMs. Retrieval uses Cosmos/Cognitive Search with vector indexing. Security is enforced via Private Link, Managed Identity, and Key Vault. Scaling is handled through HPA, KEDA, and Cluster Autoscaler. MLOps is driven by Azure ML pipelines with deployments into AKS using GitOps. This gives performance, security, and enterprise-grade reliability."

---

## 🎯 Common Questions & Quick Answers

**Q: How do you scale an Azure AI + AKS solution?**  
A: "Horizontal Pod Autoscaling for services, GPU node pools for inference, cluster autoscaler for node expansion, and KEDA for event-driven workloads."

**Q: How do you secure LLM workloads?**  
A: "Private Link for model endpoints, managed identities for auth, Key Vault for secrets, VNet integration for AKS, and prompt/response masking for PII."

**Q: How do you choose between Azure OpenAI and custom models on AKS?**  
A: "Azure OpenAI for fast delivery, low ops, and general tasks. AKS GPU serving when you need fine-tuned models, data isolation, or on-prem-like control."

---

## 📚 Quick Reference: Azure Services

| Service | Use Case | Key Benefit |
|---------|----------|-------------|
| Azure OpenAI | Managed LLMs | Fast deployment, managed scaling |
| Azure ML | Custom training | Full control, MLOps lifecycle |
| AKS | Container orchestration | GPU support, fine control |
| APIM | API gateway | Throttling, caching, auth |
| Cosmos DB | Vector store | Fast semantic search |
| Key Vault | Secrets | Secure credential management |
| App Insights | Monitoring | Distributed tracing |

---

**Review**: [Interview Overview](./01_Interview-Overview.md) - Start over for comprehensive review

