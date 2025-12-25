---
learning_level: "Intermediate"
prerequisites: ["Azure fundamentals", "Cloud architecture basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Assess your readiness on data, integration, AI/search, and observability"
  - "Prepare interview talking points for scalability, reliability, and operational excellence"
related_topics:
  prerequisites: ["./skills-checklist-security-iac-devops.md"]
  builds_upon: ["../06_Solution-Architect/", "../07_AI-Architect/", "../09_PrincipalConsultant-Data/"]
  enables: []
  cross_refs: ["../07_AI-Architect/", "../03_System-Design-Scenarios/"]
---

# Skills Checklist: Data, AI, Integration, and Observability

Use this checklist together with the main index: [Azure Architect Skills Checklist](./01_Skills-Checklist.md).

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

## 🔹 Monitoring & Observability

**Application Monitoring**:

- ✅/⚠️/❌ **Application Insights** - APM, performance metrics, dependency tracking

**Logging & Analytics**:

- ✅/⚠️/❌ **Log Analytics** - Centralized log aggregation
- ✅/⚠️/❌ **KQL (Kusto Query Language)** - Log querying and analysis

**Alerting**:

- ✅/⚠️/❌ **Azure Monitor alerts** - Proactive monitoring and notifications

**Interview Focus**: Design comprehensive observability strategies, understand SLI/SLO concepts, and demonstrate troubleshooting approaches.
