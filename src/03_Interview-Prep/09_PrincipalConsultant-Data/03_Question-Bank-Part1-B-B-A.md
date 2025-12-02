---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["./03_Question-Bank-Part1-B-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master Spark optimization techniques"
  - "Understand Adaptive Query Execution (AQE)"
  - "Learn to handle skewed data"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-B-A.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-B-B-B.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-B.md"]
---

# Principal Consultant - Data Question Bank (Medium Level) - Part 2-A

**Optimization and performance tuning questions** for Databricks and Spark.

---

## Databricks & Spark

### 4. How do you optimize a Spark job?

**Answer Framework:**

**Partitioning Strategies:**
- Repartition data based on join keys
- Use appropriate partition sizes (128MB-1GB)
- Avoid over-partitioning (too many small files)
- Use Z-ORDER for query optimization

**Caching:**
- Cache only when data is reused multiple times
- Use appropriate storage levels (MEMORY_ONLY vs MEMORY_AND_DISK)
- Unpersist when no longer needed

**Query Optimization:**
- Enable Adaptive Query Execution (AQE)
- Use broadcast joins for small lookup tables
- Avoid wide transformations when possible
- Use column pruning and predicate pushdown

**Cluster Configuration:**
- Right-size clusters for workload
- Enable autoscaling for variable workloads
- Use spot instances for cost optimization
- Configure appropriate driver/executor memory

---

### 5. What is adaptive query execution (AQE)?

**Answer:**

Adaptive Query Execution (AQE) is a Spark optimization feature that:

- **Dynamically adjusts execution plan** based on runtime statistics
- **Coalesces small partitions** to reduce overhead
- **Optimizes join strategies** based on data size
- **Handles data skew** automatically

**Key Benefits:**
- Improved performance without manual tuning
- Automatic handling of data skew
- Better resource utilization
- Reduced need for manual optimization

**When to Use:**
- Enable by default in Spark 3.0+
- Particularly effective for:
  - Joins with skewed data
  - Queries with many small partitions
  - Dynamic workloads with varying data sizes

---

### 6. How do you handle skewed data in Spark?

**Answer:**

**Skew Detection:**
- Monitor partition sizes and execution times
- Identify keys with disproportionate data distribution
- Use Spark UI to identify straggler tasks

**Mitigation Techniques:**

**Salting:**
- Add random salt to skewed keys
- Distribute data more evenly across partitions
- Remove salt after processing

**Broadcast Joins:**
- Use for small lookup tables
- Avoids shuffle for small datasets
- Reduces network overhead

**Partitioning:**
- Repartition based on join keys
- Increase number of partitions
- Use custom partitioners

**Alternative Approaches:**
- Filter skewed data separately
- Use different join strategies
- Pre-aggregate data to reduce size

---

**Next**: [PySpark Optimization](./03_Question-Bank-Part1-B-B-B.md)
