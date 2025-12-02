---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["./03_Question-Bank-Part1-C-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master Spark performance diagnosis"
  - "Understand cluster sizing strategies"
  - "Learn optimization operations (OPTIMIZE, VACUUM, ZORDER)"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-C-A.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-D-A.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part2-A-1.md"]
---

# Principal Consultant - Data Question Bank (Advanced Level) - Part 2

**Performance engineering questions** for Databricks and Spark.

---

## Databricks & Spark Performance Engineering

### 5. Diagnose Slow Spark Job (10× Slower in Production)

**Question**: You see a Spark job running 10× slower in production than dev. What steps do you take to diagnose and fix it?

**Answer Framework:**

**Diagnosis Steps:**

1. **Compare Environments:**
   - Cluster sizes and configurations
   - Data volumes and partitioning
   - Network conditions and latency
   - Resource contention

2. **Analyze Execution Plans:**
   - Use `explain(True)` to compare plans
   - Identify differences in join strategies
   - Check for missing optimizations (broadcast joins, etc.)

3. **Review Spark UI:**
   - Task execution times and skew
   - Shuffle read/write sizes
   - Garbage collection patterns
   - Resource utilization

4. **Data Analysis:**
   - Data skew detection
   - Partition sizes and distribution
   - Small file problems
   - Schema differences

**Common Fixes:**
- Repartition data to address skew
- Enable Adaptive Query Execution (AQE)
- Use broadcast joins for small tables
- Optimize partitioning strategy
- Tune executor memory and cores
- Fix small file issues with compaction

---

### 6. Cluster Sizing Strategies

**Question**: Describe cluster sizing strategies (driver/executor memory and cores).

**Answer Framework:**

**Driver Configuration:**
- **Memory**: 4-8GB for small jobs, 16GB+ for large jobs
- **Cores**: 2-4 cores typically sufficient
- **Considerations**: Large broadcast tables, complex aggregations

**Executor Configuration:**
- **Memory**: Balance between heap and off-heap (spill to disk)
- **Cores**: 2-5 cores per executor (avoid too many cores)
- **Executors**: Calculate based on cluster size and overhead

**Sizing Formula:**
- Total cluster cores ÷ cores per executor = number of executors
- Account for overhead (10-20% for OS and system processes)
- Consider YARN/Kubernetes resource overhead

**Best Practices:**
- Start with standard configurations
- Monitor and adjust based on actual usage
- Use autoscaling for variable workloads
- Right-size based on workload patterns

---

### 7. OPTIMIZE, VACUUM, ZORDER Operations

**Question**: Explain `OPTIMIZE`, `VACUUM`, and `ZORDER` and their impact.

**Answer:**

**OPTIMIZE:**
- Compacts small files into larger files
- Improves query performance by reducing file count
- Reduces metadata overhead
- Use for tables with many small files

**VACUUM:**
- Removes old data files no longer referenced
- Frees up storage space
- Requires retention period configuration
- Use for storage cleanup and cost optimization

**ZORDER:**
- Co-locates related data in same files
- Improves query performance for filtered queries
- Reduces data scanning
- Use for frequently filtered columns

**Impact:**
- **Performance**: Faster queries, reduced metadata overhead
- **Cost**: Lower storage and compute costs
- **Maintenance**: Requires periodic execution
- **Trade-off**: Cost of optimization vs query performance

---

## 🎯 Answering Strategy for Advanced Questions

1. **Show Architecture Thinking**: Present comprehensive solution design
2. **Discuss Trade-offs**: Cost, complexity, performance implications
3. **Provide Specifics**: Concrete configurations, patterns, examples
4. **Demonstrate Experience**: Reference real-world scenarios and best practices

---

**Next**: [Question Bank - Expert Level](./03_Question-Bank-Part1-D-A.md)
