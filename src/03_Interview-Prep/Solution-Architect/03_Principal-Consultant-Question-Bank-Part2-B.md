---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Advanced level questions"
  - "Understand architecture and optimization patterns"
  - "Prepare for Principal Consultant technical interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-A.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-C.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-B)

**Advanced level detailed answers** for Principal Consultant roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI).

---

## ✅ ADVANCED LEVEL ANSWERS

### 41. How to design an ETL platform using ADF + Databricks + ADLS?

**Architecture:**

* **ADF** → Orchestration (pipeline scheduling, dependency management)
* **Databricks** → Transformations (batch + streaming, ML workloads)
* **ADLS** → Bronze/Silver/Gold (medallion architecture)
* **Purview** → Lineage & governance (data catalog, classification)
* **Key Vault** → Secrets (credentials, connection strings)
* **Azure Monitor** → Logs (observability, alerting)

**Key Features:**

* Parameterized pipelines (environment-specific configs)
* Retry + notify (error handling, alerting)
* Data quality checks (validation rules, quarantine layer)
* Delta Lake optimizations (Z-Ordering, compaction)
* CI/CD with GitHub Actions (automated deployments)

**Best Practices:**

* Use managed identity for authentication
* Implement data contracts for schema validation
* Enable audit logging for compliance
* Use Auto Loader for incremental ingestion
* Implement medallion architecture (Bronze/Silver/Gold)

---

### 42. How do you optimize Spark for large datasets?

**Optimization Strategies:**

* **Avoid UDFs** → Use built-in Spark SQL functions (native code execution)
* **Use Delta** → Predicate pushdown, file skipping, Z-Ordering
* **Use correct partitioning** → Partition by frequently filtered columns
* **Use coalesce/repartition wisely** → Avoid over-partitioning
* **Use Photon runtime** → 2-5× faster for SQL workloads
* **Enable AQE** → Adaptive Query Execution (automatic optimization)
* **Cache minimal data** → Only cache when data is reused multiple times
* **Avoid exploding shuffles** → Use broadcast joins, salting for skewed data

**Performance Tuning:**

* Right-size executors (memory, cores)
* Tune shuffle partitions (200-800)
* Monitor Spark UI for bottlenecks
* Use Delta Lake for ACID guarantees

---

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

- [Part 2-A: Easy/Medium Answers](./03_Principal-Consultant-Question-Bank-Part2-A.md)
- [Part 2-C: Advanced Answers (Continued)](./03_Principal-Consultant-Question-Bank-Part2-C.md)
- [Part 1-A: Question Bank](./03_Principal-Consultant-Question-Bank-Part1-A.md)

