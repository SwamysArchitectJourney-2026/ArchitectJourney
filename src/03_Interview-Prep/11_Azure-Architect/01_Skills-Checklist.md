---
learning_level: "Intermediate"
prerequisites: ["Azure fundamentals", "Cloud architecture basics", "Software development experience"]
estimated_time: "25 minutes"
learning_objectives:
  - "Assess your readiness for Azure Architect interview positions"
  - "Identify key skill areas required for Azure Architect roles"
  - "Create a personalized study plan based on skill gaps"
related_topics:
  prerequisites: []
  builds_upon: ["../06_Solution-Architect/", "../07_AI-Architect/", "../10_.NET-Architect/"]
  enables: []
  cross_refs: ["../06_Solution-Architect/", "../07_AI-Architect/", "../10_.NET-Architect/"]
---
# Azure Architect Skills Checklist

**Purpose**: Use this checklist to assess your readiness for Azure Architect positions and identify areas for focused preparation.

## 📋 How to Use This Checklist

1. **Self-Assessment**: Mark each skill as ✅ **Strong**, ⚠️ **Moderate**, or ❌ **Weak**
2. **Prioritize**: Focus on ⚠️ and ❌ areas
3. **Study Plan**: Use related interview prep materials to strengthen weak areas

## 🔹 Programming Languages

- ✅/⚠️/❌ **Python** - Scripting, automation, data processing
- ✅/⚠️/❌ **C# and .NET Core** - Enterprise application development
- ✅/⚠️/❌ **Node.js / TypeScript** - Serverless functions, API development
**Interview Focus**: Be prepared to discuss when to use each language and demonstrate understanding of their strengths in cloud-native architectures.

## 🔹 Web Frameworks

- ✅/⚠️/❌ **ASP.NET Core** - Enterprise web applications, microservices
- ✅/⚠️/❌ **Express.js / FastAPI** - Lightweight APIs, serverless functions (good to have)
**Interview Focus**: Understand framework selection criteria, performance characteristics, and integration patterns with Azure services.

## 🔹 Frontend Integration

- ✅/⚠️/❌ **React or Angular** - Frontend framework understanding
- ✅/⚠️/❌ **JWT/OAuth flows** - Authentication with Single Page Applications (SPAs)
- ✅/⚠️/❌ **API integration design** - Multi-tenant UI architectures

**Interview Focus**: Design secure, scalable frontend-backend integration patterns for enterprise applications.

## 🔹 Cloud Platform Services

**Compute & Hosting**:

- ✅/⚠️/❌ **Azure App Service** - Web app hosting, scaling, deployment slots
- ✅/⚠️/❌ **Azure Functions** - Serverless compute, event-driven architectures

**API & Integration**:

- ✅/⚠️/❌ **Azure API Management** - API gateway, versioning, rate limiting

**Security & Secrets**:

- ✅/⚠️/❌ **Azure Key Vault** - Secrets management, certificate storage

**Storage Services**:

- ✅/⚠️/❌ **Azure Storage** - Blob, File, Queue storage types
- ✅/⚠️/❌ **Azure SQL Database** - Managed relational database
- ✅/⚠️/❌ **Cosmos DB** - NoSQL, multi-model database

**Monitoring & Analytics**:

- ✅/⚠️/❌ **Azure Monitor** - Infrastructure and application monitoring
- ✅/⚠️/❌ **Application Insights** - Application performance monitoring (APM)
- ✅/⚠️/❌ **Log Analytics** - Centralized log analysis with KQL queries

**Networking (Good to Have)**:

- ✅/⚠️/❌ **Azure Front Door** - Global load balancing, CDN
- ✅/⚠️/❌ **Azure CDN** - Content delivery network

---

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

## 🔹 Data & Storage

**Relational Databases**:

- ✅/⚠️/❌ **Azure SQL** - Managed SQL Server
  - Elastic Pools - Cost optimization for multiple databases
  - PITR (Point-in-Time Restore) - Backup and recovery
  - LTR (Long-Term Retention) - Extended backup retention
  - Geo-replication - Disaster recovery and read scaling

**NoSQL Databases**:

- ✅/⚠️/❌ **Cosmos DB** - Global-distributed NoSQL database

**Storage Services**:

- ✅/⚠️/❌ **Blob Storage lifecycle policies** - Automated tier management
- ✅/⚠️/❌ **Access policies** - Secure data access patterns

**Caching**:

- ✅/⚠️/❌ **Azure Cache for Redis** - In-memory data store, session management

**Data Integration**:

- ✅/⚠️/❌ **Azure Data Factory** - ETL/ELT orchestration
- ✅/⚠️/❌ **Azure Synapse Analytics** - Analytics and data warehousing

## 🔹 AI & Search Technologies

**Azure AI Services**:

- ✅/⚠️/❌ **Azure OpenAI** - GPT-4o, GPT-4.1, embedding models
- ✅/⚠️/❌ **Cognitive Services** - Vision, OCR, Text Analytics APIs

**Search & Retrieval**:

- ✅/⚠️/❌ **Azure AI Search** - Vector search and semantic search capabilities
- ✅/⚠️/❌ **RAG Architecture** - Retrieval-Augmented Generation patterns

**Implementation Skills**:

- ✅/⚠️/❌ **Embedding generation** - Vector embeddings for semantic search
- ✅/⚠️/❌ **Index design** - Search index architecture and optimization

## 🔹 Integration Services

**API Management**:

- ✅/⚠️/❌ **Azure API Management** - API gateway, versioning, policies

**Messaging & Events**:

- ✅/⚠️/❌ **Azure Service Bus** - Enterprise messaging, queues, topics
- ✅/⚠️/❌ **Event Grid** - Event-driven architectures, serverless events
- ✅/⚠️/❌ **Logic Apps** - Workflow automation, integration patterns

**API Patterns**:

- ✅/⚠️/❌ **REST APIs** - RESTful service design and implementation
- ✅/⚠️/❌ **Webhooks** - Event notification patterns
- ✅/⚠️/❌ **OAuth-protected external APIs** - Secure third-party integrations

---

## 🔹 Monitoring & Observability

**Application Monitoring**:

- ✅/⚠️/❌ **Application Insights** - APM, performance metrics, dependency tracking

**Logging & Analytics**:

- ✅/⚠️/❌ **Log Analytics** - Centralized log aggregation
- ✅/⚠️/❌ **KQL (Kusto Query Language)** - Log querying and analysis

**Alerting**:

- ✅/⚠️/❌ **Azure Monitor alerts** - Proactive monitoring and notifications

**Interview Focus**: Design comprehensive observability strategies, understand SLI/SLO concepts, and demonstrate troubleshooting approaches.

---

## 📊 Next Steps

1. **Review Your Assessment**: Identify your strongest and weakest areas
2. **Create Study Plan**: Prioritize skills marked as ⚠️ or ❌
3. **Use Related Materials**:
  - [Solution Architect Prep](../06_Solution-Architect/) - Cloud architecture patterns
  - [AI Architect Prep](../07_AI-Architect/) - Azure AI services and patterns
  - [.NET Architect Prep](../10_.NET-Architect/) - .NET and Azure integration
4. **Practice Scenarios**: Work through system design scenarios relevant to your weak areas

