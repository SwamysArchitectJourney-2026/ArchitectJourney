---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["Advanced Azure Data Engineering", "Databricks", "PySpark", "AI/ML", "Architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review Principal/Staff-level case studies (Part 1)"
  - "Understand data warehouse consolidation and migration scenarios"
  - "Prepare for case study interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-F-2.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-G-2.md"]
  cross_refs: []
---

# Principal Consultant Interview Prep - Case Studies (Part 2-G-1)

**Principal/Staff-level case studies (Part 1)** with detailed answers for Principal Consultant interviews.

---

## 🔵 CASE STUDY 1 — Consolidate 14 Data Warehouses Across Regions into One Azure Platform

### ❓ 1. What architecture do you propose?

**Architecture: Multi-Region Distributed Lakehouse Platform**

**Core Components:**

* **Azure Data Lake Storage Gen2** → Unified storage layer
* **Delta Lake or OneLake (Fabric)** → ACID, schema enforcement, time travel
* **Azure Databricks / Fabric Lakehouse** → Transformations
* **Fabric Warehouse / Synapse Dedicated SQL Pool** → MPP analytical queries
* **Azure Data Factory / Fabric Pipelines** → Orchestration
* **Purview** → Governance, data classification, lineage
* **Entra ID + Key Vault** → Security
* **Azure Monitor + Log Analytics** → Observability

**Regional Approach:**

* Deploy **active-active Lakehouse** across regions
* Use **GEO-replicated storage** (RA-GZRS / multi-region OneLake workspace)
* Use **cross-region replication** for metadata & Delta logs

**Data Domains:**

* Apply **Data Mesh**: each business unit becomes a domain team
* Domains own their **Bronze/Silver/Gold** layers
* Central team defines standards (Data Contracts, Tags, Naming Conventions)

---

### ❓ 2. How do you migrate workloads without downtime?

**Migration Strategy:**

1. **Lift and Shift → Modernize**
   * Phase 1: Move existing DW tables "as is" into Bronze layer
   * Phase 2: Slowly rebuild transformations in Lakehouse

2. **Dual Run**
   * Run legacy DWH + new platform in parallel for 2–3 months

3. **Incremental Cutover**
   * Report by report → Pipeline by pipeline → Domain by domain

4. **Automated Validation**
   * Row count checks
   * Checksum validation
   * Business metric validation

5. **Communication Plan**
   * Each domain publishes readiness signals
   * Stakeholders approve cutover

---

### ❓ 3. How do you enforce governance?

**Governance Framework:**

* **Purview** for classification, lineage, glossary
* **RBAC + ACLs** for data access
* **Data Contracts** for schemas and quality
* **Standardized ingestion templates**
* **Centralized monitoring dashboards**
* **Lineage coverage > 95%**

**Security:**

* Private Endpoints
* VNet Injection
* Customer-managed keys

---

### ❓ 4. How do you plan capacity?

**Capacity Planning:**

1. **Storage:**
   * 5–10 years retention
   * Delta compression (~40%)
   * Tiered storage for cost optimization

2. **Compute:**
   * Autoscaling clusters
   * Cluster policies limiting max nodes
   * Fabric Capacity Units (minimum F64 or F128)

3. **Demand Forecasting:**
   * Daily ingestion volume
   * Peak transformation workloads
   * Cost allocation per domain

---

## 🔗 Related Documents

- [Part 2-G-2: Case Studies (Part 2)](./03_Principal-Consultant-Question-Bank-Part2-G-2.md) - Case studies Part 2
- [Part 2-F-2: Study Plan](./03_Principal-Consultant-Question-Bank-Part2-F-2.md) - 30-day study plan
- [Part 2-H: Case Studies (Continued)](./03_Principal-Consultant-Question-Bank-Part2-H.md) - Case studies continued

