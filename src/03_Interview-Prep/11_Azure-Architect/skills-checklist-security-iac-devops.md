---
learning_level: "Intermediate"
prerequisites: ["Azure fundamentals", "Cloud security basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Assess your readiness on identity, security, IaC, and automation for Azure"
  - "Prepare talking points for governance, deployments, and secure-by-default designs"
related_topics:
  prerequisites: ["./skills-checklist-azure-platform.md"]
  builds_upon: ["../06_Solution-Architect/", "../12_DevOps-Architect/"]
  enables: ["./skills-checklist-data-ai-integration-and-observability.md"]
  cross_refs: ["../12_DevOps-Architect/", "../06_Solution-Architect/"]
---

# Skills Checklist: Identity, Security, IaC, and DevOps

Use this checklist together with the main index: [Azure Architect Skills Checklist](./01_Skills-Checklist.md).

## 🔹 Identity & Security

**Identity Management**:

- ✅/⚠️/❌ **Azure Entra ID (formerly Azure AD)** - Enterprise identity provider
- ✅/⚠️/❌ **Azure AD B2C** - Customer identity and access management

**Authentication Protocols**:

- ✅/⚠️/❌ **OAuth 2.0** - Authorization framework
- ✅/⚠️/❌ **OpenID Connect** - Authentication layer on OAuth 2.0
- ✅/⚠️/❌ **JWT (JSON Web Tokens)** - Token-based authentication
- ✅/⚠️/❌ **SAML** - Enterprise SSO protocol

**Security Patterns**:

- ✅/⚠️/❌ **Managed Identity** - Service-to-service authentication without secrets
- ✅/⚠️/❌ **RBAC (Role-Based Access Control)** - Fine-grained access control
- ✅/⚠️/❌ **Feature-based authorization** - Application-level authorization

**Network Security**:

- ✅/⚠️/❌ **VNET (Virtual Network)** - Network isolation and segmentation
- ✅/⚠️/❌ **Private Endpoints** - Private connectivity to Azure services
- ✅/⚠️/❌ **NSG (Network Security Groups)** - Network traffic filtering
- ✅/⚠️/❌ **Azure Firewall** - Network security service

**Data Protection**:

- ✅/⚠️/❌ **Encryption at rest** - Data encryption in storage
- ✅/⚠️/❌ **Encryption in transit** - TLS/SSL for data in motion
- ✅/⚠️/❌ **Key management** - Cryptographic key lifecycle management

## 🔹 Infrastructure as Code (IaC)

**Primary Tools**:

- ✅/⚠️/❌ **Terraform** - Multi-cloud IaC (preferred for many organizations)
- ✅/⚠️/❌ **Bicep** - Azure-native IaC language
- ✅/⚠️/❌ **ARM Templates** - Azure Resource Manager JSON templates

**Practices**:

- ✅/⚠️/❌ **GitOps practices** - Infrastructure changes via Git workflows

**Interview Focus**: Understand when to use each tool, version control strategies, and infrastructure testing approaches.

## 🔹 DevOps & Automation

**CI/CD Pipelines**:

- ✅/⚠️/❌ **Azure DevOps Pipelines** - Build and release automation
- ✅/⚠️/❌ **YAML Pipelines** - Pipeline-as-code approach

**Integration & Security**:

- ✅/⚠️/❌ **Service Connections** - Secure connections to Azure resources
- ✅/⚠️/❌ **Key Vault integration** - Secrets management in pipelines

**Deployment Strategies**:

- ✅/⚠️/❌ **Automated deployments** - Dev/UAT/Prod environment automation
- ✅/⚠️/❌ **Branching strategy** - Git workflow for code and infrastructure
- ✅/⚠️/❌ **Deployment governance** - Approval gates, compliance checks
