---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML"]
estimated_time: "25 minutes"
learning_objectives:
  - "Complete interview prep with 150+ Q&A"
  - "Review cheat sheets, study plans, and case studies"
  - "Prepare comprehensively for Principal Consultant interviews"
related_topics:
  prerequisites: []
  builds_upon: []
  enables: ["./04_Complete-Interview-Prep-Pack-Part1-B.md"]
  cross_refs: []
---

# Complete Principal Consultant Interview Prep Pack

**Full interview preparation pack** for Principal Consultant / Staff Engineer roles (Azure Data Engineering, Databricks, Fabric, PySpark, AI).

---

## 1️⃣ Interview Q&A – Easy → Expert (150+ Questions With Answers)

### ✅ EASY LEVEL ANSWERS

#### 1. What is Azure Data Factory?

ADF is a fully managed ETL/ELT orchestration service used to move, transform, and integrate data across on-prem and cloud systems.

#### 2. What is the difference between Pipeline and Activity?

* **Pipeline** = container of workflow
* **Activity** = a single step inside a pipeline (Copy, Notebook, Mapping Data Flow, etc.)

#### 3. What is a Spark DataFrame?

A distributed, immutable collection of data organized into named columns—optimized for parallel processing.

#### 4. What is Delta Lake?

A storage format providing **ACID transactions, schema enforcement, time travel, and scalable metadata** on top of a data lake.

#### 5. What is a Lakehouse?

An architecture combining the **reliability of a warehouse** with the **scalability of a data lake** (Delta, Iceberg, Hudi).

---

### ✅ MEDIUM LEVEL ANSWERS

#### 1. Mapping Data Flows vs Databricks Notebooks?

| Mapping Data Flows       | Databricks                         |
| ------------------------ | ---------------------------------- |
| No-code ETL in ADF       | Code-first ETL in Spark            |
| Low complexity workloads | Complex, scalable transformations  |
| Limited to ADF/Synapse   | Can integrate with ML, Delta, etc. |

#### 2. Medallion Architecture?

* **Bronze**: Raw data
* **Silver**: Cleaned, conformed data
* **Gold**: Business curated, analytics-ready data

Improves **quality, lineage, and reusability**.

#### 3. How do you handle skewed data in Spark?

* Use **salting**
* Broadcast joins
* Increase shuffle partitions
* Avoid `groupByKey` → use `reduceByKey`

#### 4. How do you optimize a Spark job?

* Use Delta
* Cache only when required
* Tune partitions
* Avoid UDFs where possible
* Enable AQE
* Choose correct cluster size

#### 5. Difference between Fabric Warehouse and Lakehouse?

* **Warehouse** = SQL-first, MPP engine
* **Lakehouse** = Delta table storage with SQL + notebooks + Spark

---

