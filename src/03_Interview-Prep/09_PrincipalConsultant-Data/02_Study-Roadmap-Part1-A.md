---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["Azure Data Engineering basics", "Databricks fundamentals", "PySpark basics"]
estimated_time: "15 minutes"
learning_objectives:
  - "Understand prioritized study order for Principal Consultant interviews"
  - "Learn key decision frameworks for Azure data services"
  - "Master performance optimization and architecture patterns"
related_topics:
  prerequisites: ["./01_Interview-Overview.md"]
  builds_upon: []
  enables: ["./02_Study-Roadmap-Part1-B.md"]
  cross_refs: []
---

# Principal Consultant - Data Study Roadmap - Part 1

**Prioritized learning path** for Principal Consultant - Data interviews with Azure Data Engineering, Databricks, and Fabric focus.

Study these topics in order for maximum interview effectiveness.

---

## 1️⃣ Azure Data Engineering Fundamentals

**Priority**: Critical - Foundation for all other topics

### Core Services

**Azure Data Factory (ADF)**
- Pipeline orchestration and scheduling
- Activity types and data movement patterns
- Linked services and integration runtimes
- Mapping Data Flows vs code-based transformations

**Azure Data Lake Storage Gen2**
- Hierarchical namespace and access patterns
- Partitioning strategies for performance
- Lifecycle management and cost optimization
- Security and access control

**Azure Synapse Analytics**
- Dedicated SQL pools vs serverless
- Integration with Spark pools
- Pipeline orchestration capabilities
- Comparison with Fabric

### Key Decision Points

- When to use ADF vs Databricks for transformations
- Data Lake vs Data Warehouse architecture
- Batch vs streaming processing patterns

---

## 2️⃣ Databricks Deep Dive

**Priority**: Critical - Core platform expertise

### Essential Concepts

**Workspace and Clusters**
- Cluster types and sizing strategies
- Autoscaling and cost optimization
- Cluster policies and governance
- Notebook vs job execution

**Delta Lake**
- ACID transactions and time travel
- Schema evolution and enforcement
- OPTIMIZE, VACUUM, and Z-ORDER operations
- Merge operations and upsert patterns

**Performance Optimization**
- Adaptive Query Execution (AQE)
- Partitioning and bucketing strategies
- Handling data skew
- Broadcast joins and caching

### Advanced Topics

- Delta Live Tables for streaming
- Auto Loader for incremental ingestion
- Unity Catalog for governance
- MLflow integration for ML workflows

---

## 3️⃣ Microsoft Fabric

**Priority**: High - Modern unified platform

### Core Concepts

**Fabric Architecture**
- Unified analytics platform overview
- Capacity units and pricing model
- Workspace organization and governance

**Lakehouse vs Warehouse**
- When to use each approach
- Integration patterns between services
- Data engineering workflows

**Data Pipelines**
- Fabric pipeline capabilities
- Integration with other Fabric services
- Comparison with ADF pipelines

### Key Decision Framework

- Fabric vs Databricks for different use cases
- Fabric vs Synapse for enterprise analytics
- Cost optimization strategies

---

**Next**: [PySpark, Architecture, and Governance](./02_Study-Roadmap-Part1-B.md)
