---
learning_level: "Advanced"
prerequisites: ["Azure fundamentals", "DevOps basics", "Kubernetes basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Create a structured study plan for DevOps & Azure Cloud Architect interviews"
  - "Prioritize learning areas based on role requirements"
  - "Identify key resources and practice scenarios"
related_topics:
  prerequisites: ["./01_Interview-Overview.md"]
  builds_upon: ["../06_Solution-Architect/", "../11_Azure-Architect/"]
  enables: []
  cross_refs: ["../06_Solution-Architect/", "../11_Azure-Architect/"]
---
# DevOps & Azure Cloud Architect Study Roadmap

**Timeline**: 6-week preparation plan

## 📅 Week 1-2: Foundation & Core Services
- **Key topics**: compute (App Service, Functions, Container Instances, AKS); storage (Blob, Files, Queues, Tables, Cosmos DB); networking (VNet, Load Balancer, App Gateway, Front Door); identity/security (Entra ID, Managed Identity, Key Vault, RBAC); monitoring (Monitor, App Insights, Log Analytics)
- **Practice scenarios**: multi-tier web app; cloud migration strategy; disaster recovery design
- **Resources**: [Azure Architect Skills Checklist](../11_Azure-Architect/01_Skills-Checklist.md), [Solution Architect Prep](../06_Solution-Architect/)

## 📅 Week 3: Kubernetes & AKS Deep Dive
- **Key topics**: Kubernetes architecture; AKS node pools/networking/scaling; scheduling (affinity/anti-affinity/taints/tolerations); service types; ingress; ConfigMaps/Secrets; PVs/storage classes
- **Practice scenarios**: multi-tenant AKS cluster; GPU node pools for ML; HA AKS design
- **Talking points**:
  - "I separate AKS node pools by workload (CPU web services, GPU inference, spot for batch)."
  - "I use PDBs + multi-AZ to protect availability during upgrades and failures."
  - "I apply network policies + private endpoints for secure multi-tenant designs."

## 📅 Week 4: Infrastructure as Code & DevOps Automation
- **Key topics**: Terraform (Azure provider); Bicep/ARM; GitOps (Flux/ArgoCD); CI/CD (Azure DevOps, GitHub Actions); infra testing/validation; multi-env deployments
- **Practice scenarios**: IaC for a complete Azure environment; GitOps workflow; CI/CD for containerized apps
- **Talking points**: "Terraform for multi-cloud"; "Bicep for Azure-native"; "pipelines with gates, tests, and rollback"

## 📅 Week 5: MLOps & Advanced Patterns
- **Key topics**: MLOps patterns; training pipelines; deployment (A/B, canary, blue/green); monitoring + drift; feature store/model registry; GPU optimization
- **Practice scenarios**: end-to-end MLOps pipeline; GPU allocation plan; model versioning + governance
- **Resources**: [AI Architect Prep](../07_AI-Architect/)
- **Talking points**: "automated train/validate/deploy with rollback"; "AKS GPU pools + autoscale"; "monitor drift + performance"

## 📅 Week 6: System Design & Interview Practice
- **Scenarios**: multi-product cloud foundation; AKS microservices platform; MLOps platform; migration strategy
- **For each scenario**: explain trade-offs, scalability, security, and cost; do 45-60 minute whiteboard sessions

## 📚 Daily Routine (Repeat)
- Morning (1-2h): theory (one topic/day)
- Afternoon (1-2h): hands-on practice (IaC, labs, designs)
- Evening (30-60m): review + talking points + STAR stories

## 🎯 Competencies + Checklist
- **Technical**: Azure; AKS/Kubernetes; IaC; CI/CD; MLOps; security/compliance
- **Soft skills**: system design thinking; troubleshooting; communication; leadership
- **Checklist**: Azure core; AKS deep dive; Terraform/Bicep; MLOps; system design; migrations; intro + STAR stories; explain complex ideas simply

## 🔗 Additional Resources
- [Azure Architect Skills Checklist](../11_Azure-Architect/01_Skills-Checklist.md)
- [Solution Architect Prep](../06_Solution-Architect/)
- [AI Architect Prep](../07_AI-Architect/)
- [System Design Scenarios](../03_System-Design-Scenarios/)

**Next**: Revisit [Interview Overview](./01_Interview-Overview.md) and run 2-3 timed system-design practice sessions.

