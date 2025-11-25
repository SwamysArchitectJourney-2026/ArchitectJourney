---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["Advanced Azure Data Engineering", "Microsoft Fabric", "PySpark", "Architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Deep dive into Microsoft Fabric and PySpark"
  - "Understand Principal/Staff Engineer level Fabric and PySpark knowledge"
  - "Prepare for architect-level technical interviews"
related_topics:
  prerequisites: ["./04_Principal-Consultant-Deep-Dives-Part1-A.md"]
  builds_upon: []
  enables: ["./04_Principal-Consultant-Deep-Dives-Part1-C.md"]
  cross_refs: []
---

# Principal Consultant Deep Dives - Fabric & PySpark (Part 3-B)

**Deep dive into Microsoft Fabric and PySpark** for Principal Consultant / Staff Engineer interviews.

---

## 🔵 SECTION 2 — MICROSOFT FABRIC DEEP DIVE

**Architecture, Components, Best Practices**

---

## 2.1 Fabric Architecture Overview

**Core Components:**

* **OneLake** → Unified storage (single source of truth)
* **Warehouse** → SQL MPP engine
* **Lakehouse** → Delta tables + Spark + SQL
* **Pipelines** → Data orchestration
* **Notebooks** → PySpark development
* **Power BI** → Analytics and visualization

**Key Features:**

* **SaaS Platform** → Fully managed
* **Unified Storage** → OneLake (ADLS-based)
* **Integrated BI** → Power BI native
* **Capacity-Based Pricing** → F64, F128, etc.

---

## 2.2 Fabric Warehouse vs Lakehouse

**Warehouse:**

* **SQL-first** → T-SQL, MPP engine
* **High-performance analytics** → Optimized for BI
* **Structured data** → Star/snowflake schemas
* **Use Cases** → BI reporting, OLAP

**Lakehouse:**

* **Spark + Delta** → Data engineering, ML
* **Unified analytics** → SQL + notebooks
* **Unstructured data** → JSON, images, text
* **Use Cases** → Data engineering, ML, streaming

**When to Use:**

* **Warehouse** → BI teams, SQL-heavy workloads
* **Lakehouse** → Data engineering, ML, Spark workloads
* **Both** → Hybrid approach for large enterprises

---

## 2.3 Fabric Best Practices

**Performance:**

* **Optimize capacity** → Right-size F-SKU
* **Use Direct Lake** → No import for Power BI
* **Partition data** → Efficient queries
* **Use Warehouse for SQL** → MPP performance
* **Use Lakehouse for Spark** → Delta Lake benefits

**Cost Management:**

* **Capacity optimization** → Right-size F-SKU
* **Auto-pause datasets** → Cost savings
* **Schedule refreshes** → Control timing
* **Monitor usage** → Track consumption

**Governance:**

* **Purview integration** → Data catalog
* **RBAC** → Access control
* **Data sharing** → Cross-workspace access
* **Lineage tracking** → Data flow documentation

---

## 🔵 SECTION 3 — PYSPARK DEEP DIVE

**Optimization, Patterns, Best Practices**

---

## 3.1 PySpark Optimization

**Performance Tips:**

* **Avoid UDFs** → Use native Spark functions
* **Use Broadcast Joins** → Small lookup tables
* **Repartition Wisely** → Balance partitions
* **Use Delta Lake** → Predicate pushdown, file skipping
* **Enable AQE** → Adaptive Query Execution
* **Cache Strategically** → Only when reused

**Memory Management:**

* **Right-size executors** → Balance memory and cores
* **Monitor Spark UI** → Identify bottlenecks
* **Avoid data skew** → Use salting, broadcast joins
* **Tune shuffle partitions** → 200-800 range

---

## 3.2 PySpark Patterns

**Common Patterns:**

* **Medallion Architecture** → Bronze/Silver/Gold
* **Incremental Processing** → Auto Loader, CDF
* **Change Data Capture** → MERGE INTO
* **Streaming ETL** → Structured Streaming
* **Data Quality** → Validation, quarantine

**Code Patterns:**

```python
# Broadcast join
from pyspark.sql.functions import broadcast
df.join(broadcast(lookup_df), "key")

# Salting for skewed data
df.withColumn("salt", (rand() * 100).cast("int"))

# Window functions for dedupe
from pyspark.sql.window import Window
window = Window.partitionBy("key").orderBy("timestamp")
df.withColumn("row_num", row_number().over(window))
```

---

## 3.3 PySpark Best Practices

**Code Quality:**

* **Use Spark SQL** → More efficient than Python UDFs
* **Avoid collect()** → Brings data to driver
* **Use explain()** → Understand execution plan
* **Test with small data** → Validate logic
* **Monitor performance** → Use Spark UI

**Error Handling:**

* **Try-except blocks** → Handle exceptions
* **Logging** → Track errors
* **Data validation** → Check data quality
* **Retry logic** → Handle transient failures

---

## 🔗 Related Documents

- [Part 3-A: Deep Dives - Databricks](./04_Principal-Consultant-Deep-Dives-Part1-A.md)
- [Part 3-C: Deep Dives - GenAI/RAG](./04_Principal-Consultant-Deep-Dives-Part1-C.md)

