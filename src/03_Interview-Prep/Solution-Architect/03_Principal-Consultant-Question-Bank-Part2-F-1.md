---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review Principal-level cheat sheets for quick reference"
  - "Understand best practices for Databricks, PySpark, ADF, and Fabric"
  - "Prepare comprehensive interview preparation"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-E.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-F-2.md"]
  cross_refs: []
---

# Principal Consultant Interview Prep - Cheat Sheets (Part 2-F-1)

**Principal-level cheat sheets** for Principal Consultant / Staff Engineer interviews.

---

## 🔥 CHEAT SHEETS (Principal-Level)

### Databricks Cheat Sheet

**Best Practices:**

* Use Delta for everything (ACID, time travel, schema enforcement)
* Enable auto-optimize, auto-compaction (performance)
* Use `OPTIMIZE ZORDER` for selective querying (co-locate related data)
* Avoid cross joins (expensive operations)
* Use broadcast joins for small lookup tables (< 500MB)
* Enable AQE (Adaptive Query Execution)
* Use Auto Loader for ingestion (incremental, scalable)
* Use cluster policies to enforce governance (cost control)

**Performance Tips:**

* Right-size clusters (memory, cores)
* Use Photon runtime for SQL workloads (2-5× faster)
* Monitor Spark UI for bottlenecks
* Cache only when data is reused

---

### PySpark Cheat Sheet

**Key Operations:**

* `df.repartition()` vs `coalesce()` → Repartition increases partitions, coalesce decreases
* Avoid UDFs; use Spark SQL functions (native code execution)
* Use `explain(True)` to see physical plan (optimization)
* Cache responsibly (only when reused)
* Use Window functions for dedupe (row_number, rank)
* Detect data skew with `groupBy().count().show()` (uneven distribution)

**Common Patterns:**

* Broadcast joins for small tables
* Salting for skewed data
* Delta Lake for ACID transactions
* Auto Loader for incremental ingestion

---

### Azure Data Factory Cheat Sheet

**Best Practices:**

* Use integration runtimes smartly (self-hosted vs Azure)
* Parameterize everything (no hardcoded values)
* Use Key Vault for credentials (centralized secrets)
* Use activity-level retries (error handling)
* Use global parameters (shared configs)
* Logging: capture runId, pipelineName, errorMessage (observability)

**Security:**

* Managed identity (no passwords)
* Private endpoints (network isolation)
* VNet integration (hybrid connectivity)

---

### Fabric Cheat Sheet

**Key Concepts:**

* Use Warehouse for SQL MPP (high-performance analytics)
* Use Lakehouse for Spark + Delta (unified analytics)
* Use Pipelines to replace ADF (orchestration)
* Use Notebooks for PySpark (data engineering)
* Use Data Activator for event-based automation (real-time)
* Capacity is the NEW bottleneck → optimize (cost management)

**Architecture:**

* OneLake unified storage (single source of truth)
* Direct Lake for Power BI (no import needed)
* Data sharing for cross-workspace access

---

## 🔗 Related Documents

- [Part 2-F-2: 30-Day Study Plan](./03_Principal-Consultant-Question-Bank-Part2-F-2.md) - 30-day study plan
- [Part 2-E: Expert Answers](./03_Principal-Consultant-Question-Bank-Part2-E.md) - Expert level answers
- [Part 2-G: Case Studies](./03_Principal-Consultant-Question-Bank-Part2-G.md) - Case studies


