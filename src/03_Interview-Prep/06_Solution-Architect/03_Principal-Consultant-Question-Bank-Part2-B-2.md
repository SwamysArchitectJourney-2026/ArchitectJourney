---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Advanced level questions (Part 2)"
  - "Understand runtime differences and governance patterns"
  - "Prepare for Principal Consultant technical interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-B-1.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-C-1.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-B-2)

**Advanced level detailed answers (Part 2)** for Principal Consultant roles.

---

## ✅ ADVANCED LEVEL ANSWERS (Continued)

### 43. Difference: Databricks Runtime vs Photon Runtime?

**Databricks Runtime:**
* Standard Spark runtime with Databricks optimizations
* Includes Delta Lake, MLlib, GraphX
* Good for general-purpose workloads

**Photon Runtime:**
* Vectorized execution engine (C++ implementation)
* **2–5× faster performance** for SQL workloads
* Optimized for analytical queries
* Automatic query acceleration

**When to Use:**
* **Photon**: SQL-heavy workloads, BI queries, analytical processing
* **Standard Runtime**: ML workloads, complex UDFs, custom libraries

---

### 44. What is a Lakehouse governance model?

**Governance Components:**

* **Data catalogs** → Metadata management (Purview, Unity Catalog)
* **Table ACLs** → Fine-grained access control
* **Row-level security** → Data filtering by user/role
* **Audit logs** → Track data access, changes
* **Lineage tracking** → Data flow documentation
* **Naming conventions** → Standardized naming patterns
* **Medallion layers** → Bronze/Silver/Gold organization

**Implementation:**

* Use Unity Catalog (Databricks) or Purview (Azure)
* Enforce policies via RBAC
* Automate governance with templates
* Monitor compliance metrics

---

### 45. What is the best way to build streaming ETL in Databricks?

**Recommended Approach:**

Use **Delta Live Tables (DLT)** + Auto Loader for incremental ingestion.

**Benefits:**

* Auto-managed ETL pipelines
* Built-in data quality checks
* Automatic schema inference
* Continuous or batch mode
* Declarative pipeline definition

**Architecture:**

```
Source (Event Hubs/Kafka) 
  → Auto Loader (incremental)
  → DLT Pipeline (transformations)
  → Delta Tables (Bronze/Silver/Gold)
```

**Alternative:**

* Structured Streaming with checkpoints
* Event-driven architecture
* Lambda/Kappa architecture patterns

---

## 🔗 Related Documents

- [Part 2-B-1: Advanced Answers (Part 1)](./03_Principal-Consultant-Question-Bank-Part2-B-1.md) - Advanced level answers Part 1
- [Part 2-A-2: Medium Level Answers](./03_Principal-Consultant-Question-Bank-Part2-A-2.md) - Medium level detailed answers
- [Part 2-C: Advanced Answers (Continued)](./03_Principal-Consultant-Question-Bank-Part2-C-1.md) - Advanced level answers continued

