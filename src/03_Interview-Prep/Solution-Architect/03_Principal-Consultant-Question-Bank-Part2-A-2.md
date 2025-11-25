---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Medium level questions"
  - "Understand intermediate concepts for Principal Consultant interviews"
  - "Prepare answers for intermediate technical questions"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-A-1.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-B.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-A-2)

**Detailed answers** for Medium level questions for Principal Consultant roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI).

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

- [Part 2-A-1: Easy Level Answers](./03_Principal-Consultant-Question-Bank-Part2-A-1.md) - Easy level detailed answers
- [Part 1-A: Question Bank (Easy/Medium)](./03_Principal-Consultant-Question-Bank-Part1-A.md) - Question bank
- [Part 2-B: Advanced Answers](./03_Principal-Consultant-Question-Bank-Part2-B.md) - Advanced level detailed answers

