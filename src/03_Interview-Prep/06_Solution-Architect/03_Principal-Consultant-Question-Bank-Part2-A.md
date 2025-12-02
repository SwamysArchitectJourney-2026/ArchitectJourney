---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Easy and Medium level questions"
  - "Understand comprehensive explanations for Principal Consultant interviews"
  - "Prepare answers for foundational and intermediate technical questions"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part1-A.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-B.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-A)

**Detailed answers** for Easy and Medium level questions for Principal Consultant roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI).

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

## ✅ MEDIUM LEVEL ANSWERS

### 1. Mapping Data Flows vs Databricks Notebooks?

| Mapping Data Flows       | Databricks                         |
| ------------------------ | ---------------------------------- |
| No-code ETL in ADF       | Code-first ETL in Spark            |
| Low complexity workloads | Complex, scalable transformations  |
| Limited to ADF/Synapse   | Can integrate with ML, Delta, etc. |

**When to Use:**
- **Mapping Data Flows**: Business users, simple transformations, ADF-native workflows
- **Databricks**: Complex logic, ML integration, large-scale processing, Delta Lake features

---

### 2. Medallion Architecture?

* **Bronze**: Raw data (as-is from source)
* **Silver**: Cleaned, conformed data (validated, deduplicated)
* **Gold**: Business curated, analytics-ready data (aggregated, modeled)

**Benefits:**
- Improves **quality, lineage, and reusability**
- Enables incremental processing
- Supports data quality checks at each layer
- Facilitates data governance

---

### 3. How do you handle skewed data in Spark?

**Techniques:**
* Use **salting** (add random salt to keys)
* Broadcast joins (for small lookup tables)
* Increase shuffle partitions
* Avoid `groupByKey` → use `reduceByKey` (reduces data movement)
* Repartition before join
* Use AQE (Adaptive Query Execution)

**Example:**
```python
# Salting approach
df_salted = df.withColumn("salt", (rand() * 100).cast("int"))
df_grouped = df_salted.groupBy("key", "salt").agg(...)
```

---

### 4. How do you optimize a Spark job?

**Optimization Strategies:**
* Use Delta (predicate pushdown, file skipping)
* Cache only when required (don't over-cache)
* Tune partitions (200-800 shuffle partitions)
* Avoid UDFs where possible (use built-in functions)
* Enable AQE (Adaptive Query Execution)
* Choose correct cluster size (right-size workers)
* Use broadcast joins for small tables
* Optimize data layout (Z-Ordering, compaction)

---

### 5. Difference between Fabric Warehouse and Lakehouse?

* **Warehouse** = SQL-first, MPP engine (T-SQL, high-performance analytics)
* **Lakehouse** = Delta table storage with SQL + notebooks + Spark (unified analytics)

**Use Cases:**
- **Warehouse**: SQL-heavy workloads, BI reporting, traditional analytics
- **Lakehouse**: Spark workloads, ML, data engineering, unified analytics

---

## 🔗 Related Documents

- [Part 1-A: Question Bank (Easy/Medium)](./03_Principal-Consultant-Question-Bank-Part1-A.md) - Question bank
- [Part 1-B: Question Bank (Advanced/Expert)](./03_Principal-Consultant-Question-Bank-Part1-B.md) - Advanced questions
- [Part 2-B: Advanced Answers](./03_Principal-Consultant-Question-Bank-Part2-B.md) - Advanced level detailed answers

