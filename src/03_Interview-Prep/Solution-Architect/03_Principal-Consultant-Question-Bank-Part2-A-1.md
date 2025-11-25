---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Easy level questions"
  - "Understand foundational concepts for Principal Consultant interviews"
  - "Prepare answers for basic technical questions"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part1-A.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-A-2.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-A-1)

**Detailed answers** for Easy level questions for Principal Consultant roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI).

---

## ✅ EASY LEVEL ANSWERS

### 1. What is Azure Data Factory?

ADF is a fully managed ETL/ELT orchestration service used to move, transform, and integrate data across on-prem and cloud systems.

**Key Features:**
- Pipeline-based workflow orchestration
- 90+ built-in connectors
- Code-free data transformation (Mapping Data Flows)
- Hybrid data integration (on-prem and cloud)
- Pay-per-use pricing model

---

### 2. What is the difference between Pipeline and Activity?

* **Pipeline** = container of workflow (logical grouping of activities)
* **Activity** = a single step inside a pipeline (Copy, Notebook, Mapping Data Flow, etc.)

**Example:**
- Pipeline: "Daily Sales ETL"
- Activities: Copy from SQL → Transform in Data Flow → Load to Data Warehouse

---

### 3. What is a Spark DataFrame?

A distributed, immutable collection of data organized into named columns—optimized for parallel processing.

**Characteristics:**
- Distributed across cluster nodes
- Immutable (transformations create new DataFrames)
- Lazy evaluation (executed only when action is called)
- Schema-aware (type-safe operations)
- Optimized execution plan (Catalyst optimizer)

---

### 4. What is Delta Lake?

A storage format providing **ACID transactions, schema enforcement, time travel, and scalable metadata** on top of a data lake.

**Key Benefits:**
- ACID transactions (all-or-nothing commits)
- Schema enforcement and evolution
- Time travel (query historical versions)
- Upsert and merge operations
- Optimized file layout (Z-Ordering, compaction)

---

### 5. What is a Lakehouse?

An architecture combining the **reliability of a warehouse** with the **scalability of a data lake** (Delta, Iceberg, Hudi).

**Characteristics:**
- Open storage format (Parquet, Delta)
- ACID transactions
- Schema enforcement
- BI and ML workloads on same data
- Cost-effective storage (object storage)

---

## 🔗 Related Documents

- [Part 2-A-2: Medium Level Answers](./03_Principal-Consultant-Question-Bank-Part2-A-2.md) - Medium level detailed answers
- [Part 1-A: Question Bank (Easy/Medium)](./03_Principal-Consultant-Question-Bank-Part1-A.md) - Question bank
- [Part 1-B: Question Bank (Advanced/Expert)](./03_Principal-Consultant-Question-Bank-Part1-B.md) - Advanced questions

