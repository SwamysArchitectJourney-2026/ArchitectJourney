# Architecture Diagrams & Mock Interview

**Visual architecture diagrams and Principal/Staff-level mock interview** with questions and ideal answers.

---

## 🟦 Visual Architecture Diagram — GenAI Platform (RAG + Azure)

```
                          ┌──────────────────────────────┐
                          │     Business Applications     │
                          │  (Web, Mobile, Internal Apps) │
                          └───────────────┬───────────────┘
                                          │ API Calls
                                ┌─────────▼─────────┐
                                │    API Gateway    │
                                │    (APIM/Azure    │
                                │    Front Door)     │
                                └─────────┬─────────┘
                                          │
                                ┌─────────▼─────────┐
                                │  Orchestration     │
                                │   Layer (Logic     │
                                │   Apps/Azure Fn)   │
                                └─────────┬─────────┘
                                          │
          ┌────────────────────────────────┼─────────────────────────────────┐
          │                                │                                 │
┌─────────▼───────────┐        ┌───────────▼──────────┐         ┌───────────▼─────────┐
│  Azure Cognitive     │        │ Azure OpenAI / GPT    │         │ Vector Database      │
│  Search (Indexing)   │        │ (LLM Inference)       │         │ (ACS, Qdrant, Redis)│
└─────────┬────────────┘        └───────────▲──────────┘         └───────────▲─────────┘
          │                         (RAG retrieves context)                 │
  ┌───────▼─────────┐                                                    ┌───┴───────────┐
  │ Embedding Gen   │────────────────────────────────────────────────────│ Document Store │
  │ (Databricks /   │  Embeddings + Metadata                              │ (ADLS/OneLake)│
  │   Azure ML)     │                                                    └───────────────┘
  └─────────────────┘
```

---

## 🟩 Visual Architecture Diagram — Lakehouse Architecture (Bronze/Silver/Gold)

```
                        ┌─────────────────────────────────────────┐
                        │           Data Sources                  │
                        │  ERP | CRM | Logs | IoT | APIs | DBs    │
                        └───────────────┬─────────────────────────┘
                                        │
                                ┌───────▼───────┐
                                │  Ingestion     │
                                │ ADF / DLT /    │
                                │ Auto Loader    │
                                └───────┬───────┘
                                        │
                   ┌────────────────────┼────────────────────┐
                   │                    │                    │
         ┌─────────▼────────┐   ┌───────▼──────────┐   ┌─────▼───────────┐
         │ Bronze Layer      │   │ Silver Layer      │   │ Gold Layer      │
         │ Raw Data          │   │ Cleaned / Enriched│   │ Curated / BI    │
         │ Delta Tables      │   │ Delta Tables      │   │ Delta Tables    │
         └─────────┬────────┘   └────────┬──────────┘   └────────┬────────┘
                   │                     │                       │
                   │          ┌───────────▼────────┐              │
                   │          │ Databricks/Fabric │              │
                   └─────────▶│ Transformations   ◀──────────────┘
                              └──────────┬────────┘
                                         │
                            ┌────────────▼────────────┐
                            │BI/Analytics/ML Serving  │
                            │Power BI | MLflow | Apps │
                            └──────────────────────────┘
```

---

## 🟧 Visual Architecture Diagram — ADF + Databricks + ADLS Integration

```
        ┌──────────────────────────┐
        │     Azure Data Factory   │
        │   Pipelines & Triggers   │
        └───────────┬──────────────┘
                    │
     ┌──────────────▼────────────────┐
     │ Linked Services / Datasets    │
     │ ADLS | SQL | Databricks       │
     └──────────────┬────────────────┘
                    │
           ┌────────▼────────┐
           │ Activities       │
           │ Copy → Notebook  │
           │ → Stored Proc    │
           └────────┬────────┘
                    │ (Execute Notebook)
            ┌───────▼──────────────────┐
            │  Azure Databricks        │
            │  Spark/Delta Processing  │
            └───────┬──────────────────┘
                    │
            ┌───────▼────────────────┐
            │  ADLS Gen2 / OneLake   │
            │  Bronze/Silver/Gold    │
            └────────┬───────────────┘
                     │
            ┌────────▼──────────┐
            │ Downstream Systems │
            │ Synapse | Power BI │
            └────────────────────┘
```

---

## 🔴 MOCK INTERVIEW (Principal/Staff Level) — 15 Questions + Ideal Answers

### 1. Explain the difference between Lakehouse and Warehouse. Why does it matter?

**Answer (Principal-Level):**
A warehouse provides strong schema, governance, and MPP compute but lacks scalability and flexibility for unstructured/semi-structured data. A lakehouse uses Delta/Parquet to combine warehouse-level reliability with lake-level scalability.

This matters because modern workloads (ML, GenAI, streaming) cannot fit inside a warehouse-only environment.

---

### 2. How would you design an enterprise data platform for 100+ teams?

**Key points:**

* Hub-spoke model
* Data Mesh architecture
* Lakehouse as the foundation
* Fabric/Databricks workspaces per domain
* Purview for governance
* Standard ingestion templates
* Cluster policies & capacity units for cost governance
* Central CI/CD

---

### 3. How do you optimize a Spark job that's running 10× slower in production?

**Diagnosis steps:**

1. Check Spark UI for bottlenecks
2. Identify skewed partitions
3. Review shuffle operations
4. Check executor utilization
5. Analyze data skew with `groupBy().count()`

**Optimization techniques:**

* Repartition data before joins
* Use broadcast joins for small tables
* Enable AQE (Adaptive Query Execution)
* Tune executor memory and cores
* Use Delta Lake with Z-Ordering
* Cache intermediate results strategically

---

### 4. Design a multi-region, high-availability data platform on Azure.

**Architecture:**

* Active-active or active-passive multi-region setup
* CDN + global API gateway
* Multi-region databases (Cosmos DB, Spanner) or primary-secondary with async replication
* Traffic manager for failover
* Cross-region data replication
* Automated failover playbooks

**Key considerations:**

* RTO/RPO requirements
* Data locality and GDPR
* Conflict resolution strategies
* Cost implications

---

### 5. How do you guide C-level executives in choosing between Databricks and Fabric?

**Decision framework:**

**Choose Databricks when:**
* AI/ML is a primary use case
* Large-scale data processing required
* Engineering-led organization
* Need advanced Spark capabilities
* Complex streaming requirements

**Choose Fabric when:**
* Business-led analytics focus
* Tight Power BI integration needed
* Unified governance priority
* Lower learning curve desired
* Small to medium teams

**Hybrid approach:**
* Databricks for ETL/ML workloads
* Fabric for analytics and BI
* Shared data lake (OneLake/ADLS)

---

## 🔗 Related Documents

- [Question Bank](./03_Principal-Consultant-Question-Bank.md) - Complete question bank
- [Complete Interview Prep Pack](./04_Complete-Interview-Prep-Pack.md) - Full preparation pack
- [Azure Data Engineering Interview](./01_Azure-Data-Engineering-Interview.md) - Interview prep with answers

