# Principal Consultant Interview Question Bank

**Comprehensive interview preparation guide** for Principal Consultant roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI) with Easy, Medium, Advanced, and Expert-level questions.

---

## ✅ EASY LEVEL – Fundamentals (Warm-Up Questions)

### Azure Data Engineering Basics

1. What are the core components of Azure Data Factory?
2. Explain the difference between a Pipeline and an Activity in ADF.
3. What is the purpose of Linked Services in ADF?
4. What is PolyBase and where is it used?
5. What is Delta Lake?
6. What is the difference between Azure Blob Storage and ADLS Gen2?
7. Explain the concept of pipelines vs notebooks in Databricks.
8. What is a Spark DataFrame?
9. What is a Lakehouse?
10. What is Azure Synapse Analytics?

### Python & PySpark Basics

11. Explain lazy evaluation in Spark.
12. What's the difference between `map()` and `flatMap()`?
13. What is a wide vs narrow transformation?
14. What are Spark partitions?
15. How do you read/write Delta tables in PySpark?

---

## ✅ MEDIUM LEVEL – Architecting & Real Project Scenarios

### Azure Data Engineering (ADF / Synapse / Fabric)

1. How do you orchestrate a complex ETL pipeline with dynamic branching in ADF?
2. Compare ADF Mapping Data Flows vs Databricks for ETL.
3. How do you optimize pipeline performance in ADF?
4. What is the difference between Synapse Pipelines and ADF Pipelines?
5. Explain Slowly Changing Dimensions (SCD Type 1 & 2) using Mapping Data Flows.
6. How do you design a medallion architecture (Bronze/Silver/Gold)?
7. How do you handle schema drift in Data Flows or Fabric Data Pipelines?
8. What are Warehouse vs Lakehouse vs KQL Database in Fabric?

### Databricks & Spark

9. How do you optimize a Spark job (3 common techniques)?
10. What is adaptive query execution (AQE)?
11. How do you use Z-Ordering in Databricks?
12. Explain checkpointing and caching.
13. How do you handle skewed data in Spark?

### PySpark

14. Explain UDF vs Pandas UDF vs SQL functions.
15. How do you join two large datasets efficiently?
16. What is broadcast join and when would you use it?

### AI Basics

17. How do you build a feature store in a Lakehouse?
18. What are vector databases used for in AI?
19. Explain how embeddings work in simple terms.

---

## ✅ ADVANCED LEVEL – Architecture, Performance, Governance, Scalability

### Azure Architecture & Data Engineering

1. Design a production-grade ETL platform using ADF, Databricks, and ADLS Gen2. What are the key components, and how do you ensure monitoring & fault tolerance?
2. How would you migrate an on-prem SQL data warehouse to Fabric/Synapse?
3. Compare Synapse Dedicated SQL Pool vs Fabric Data Warehouse.
4. How do you implement CI/CD for ADF, Databricks, and Fabric together?
5. Explain data governance using Purview and how lineage is tracked end-to-end.
6. How do you secure data pipelines in a multi-tenant architecture?

### Databricks & Spark Performance Engineering

7. You see a Spark job running 10× slower in production than dev. What steps do you take to diagnose and fix it?
8. Describe cluster sizing strategies (driver/executor memory & cores).
9. Explain `OPTIMIZE`, `VACUUM`, `ZORDER`, and their impact.
10. How do you handle CDC ingestion at scale (CDC streams, Delta Live Tables, Auto Loader)?
11. How do you design high-throughput streaming ETL in Databricks?

### Fabric Advanced

12. How does Fabric unify compute and storage?
13. How would you architect a Lakehouse + Warehouse + Power BI solution on Fabric?
14. How do Fabric Capacity units impact performance and cost?

### AI / ML Engineering

15. How do you architect an end-to-end ML pipeline using Databricks ML & Feature Store?
16. What is RAG (Retrieval Augmented Generation) and when would you use it?
17. Design a scalable GenAI solution using Azure OpenAI + Fabric + Vector Store.

---

## ✅ EXPERT LEVEL – Staff/Principal Engineering Scenarios

### System Design & Strategy

1. Design an enterprise Azure data platform for 100+ teams with governance, lineage, monitoring, and cost optimization. What services do you choose and why?
2. How do you modernize a legacy ETL system (SSIS/On-prem Hadoop) to a Lakehouse on Databricks/Fabric?
3. What are the tradeoffs of Databricks vs Fabric for enterprise adoption?
4. Your client wants a *single source of truth* for analytics, AI, and real-time processing. What architecture would you propose?
5. How do you enforce organizational data governance without blocking developer velocity?

### Scalability & Optimization

6. A client's Spark workload is failing under peak load due to shuffle explosion. How would you redesign it?
7. How would you guarantee high availability and disaster recovery in a multi-region data platform?
8. How do you design cost governance across ADF pipelines, Spark workloads, and Fabric capacities?

### Security & Compliance

9. Design a zero-trust, secure data platform for a financial institution on Azure.
10. How do you implement fine-grained security (row/column level) across Fabric, Databricks, and Power BI?

### AI & GenAI Strategy for Enterprises

11. Architect an RAG-based enterprise GenAI platform for 50+ internal apps using Azure OpenAI + Vector Databases + Fabric.
12. How do you productionize ML models using CI/CD, feature stores, model registry, governance, and monitoring?
13. What is your strategy for building an LLMOps ecosystem for an enterprise company?

### Leadership & Consulting

14. How do you guide C-level clients in selecting between Databricks and Fabric?
15. How do you handle an architecture disagreement between teams and land a decision?
16. What's your approach to influencing architecture across multiple engineering teams?

---

## 🔗 Related Documents

- [Azure Data Engineering Interview](./01_Azure-Data-Engineering-Interview.md) - Complete interview prep with answers
- [ML Platform Design Answer](./02_ML-Platform-Design-Answer.md) - Enterprise ML platform system design
- [Complete Interview Prep Pack](./04_Complete-Interview-Prep-Pack.md) - Full preparation pack with cheat sheets and study plan
- [Architecture Diagrams & Mock Interview](./05_Architecture-Diagrams-Mock-Interview.md) - Visual diagrams and mock interview
