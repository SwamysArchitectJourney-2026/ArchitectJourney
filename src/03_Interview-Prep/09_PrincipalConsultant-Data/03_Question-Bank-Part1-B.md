---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "Data architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review medium-level questions for Principal Consultant interviews"
  - "Understand practical application scenarios"
  - "Learn architecture and optimization techniques"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-A.md"]
  builds_upon: []
  enables: ["./04_Architecture-Patterns-Part1-A.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-B.md"]
---

# Principal Consultant - Data Question Bank (Medium Level)

**Practical application questions** for Principal Consultant - Data interviews covering real-world scenarios and optimization.

---

## Azure Data Engineering

### 1. How do you orchestrate a complex ETL pipeline with dynamic branching in ADF?

**Answer Framework:**

**Pipeline Design:**
- Use **If Condition Activities** for branching logic
- **Switch Activities** for multiple conditional paths
- **Until Activities** for loops and retries
- **Set Variable Activities** for state management

**Dynamic Branching Patterns:**
- Route data based on file names or metadata
- Handle different data sources with conditional logic
- Implement error handling and retry mechanisms
- Use parameters for flexible pipeline execution

**Best Practices:**
- Keep branching logic simple and maintainable
- Use parameters for dynamic configuration
- Implement comprehensive error handling
- Log all branching decisions for troubleshooting

---

### 2. Compare ADF Mapping Data Flows vs Databricks for ETL.

**Answer:**

| Aspect | Mapping Data Flows | Databricks |
|--------|-------------------|------------|
| **Approach** | No-code/low-code visual interface | Code-first with PySpark/Scala |
| **Complexity** | Best for standard transformations | Handles complex, custom logic |
| **Scalability** | Managed scaling | Fine-grained cluster control |
| **Integration** | Native ADF integration | Broader ecosystem integration |
| **ML/AI** | Limited ML capabilities | Full ML/AI integration |
| **Cost** | Pay-per-use pricing | Cluster-based pricing |

**Decision Framework:**
- **Use Mapping Data Flows**: Standard transformations, non-technical users, quick prototyping
- **Use Databricks**: Complex logic, ML integration, performance-critical workloads, advanced Spark features

---

### 3. How do you design a medallion architecture (Bronze/Silver/Gold)?

**Answer:**

**Bronze Layer (Raw Data)**
- Store data exactly as received from source
- No transformations or cleaning
- Preserve all historical versions
- Use Delta Lake for ACID guarantees

**Silver Layer (Cleaned Data)**
- Apply data quality rules and validation
- Standardize schemas and formats
- Remove duplicates and handle nulls
- Enrich with reference data

**Gold Layer (Curated Data)**
- Business-ready, aggregated datasets
- Optimized for analytics and reporting
- Denormalized for query performance
- Ready for consumption by BI tools

**Implementation Strategy:**
- Use Delta Lake for all layers
- Implement incremental processing
- Maintain data lineage between layers
- Apply appropriate partitioning strategies

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

## PySpark

### 7. Explain UDF vs Pandas UDF vs SQL functions.

**Answer:**

**SQL Functions (Built-in):**
- Native Spark functions (e.g., `concat`, `substring`, `date_format`)
- Optimized by Catalyst optimizer
- Best performance
- Use whenever possible

**UDF (User-Defined Functions):**
- Custom Python functions
- Row-by-row processing
- Slower performance (Python overhead)
- Use only when SQL functions insufficient

**Pandas UDF (Vectorized UDF):**
- Processes data in batches using Pandas
- Better performance than regular UDFs
- Still slower than SQL functions
- Use for complex transformations not available in SQL

**Performance Order:**
1. SQL functions (fastest)
2. Pandas UDF (moderate)
3. Regular UDF (slowest)

**Best Practice:** Always prefer SQL functions, use UDFs only when necessary.

---

### 8. How do you join two large datasets efficiently?

**Answer:**

**Join Strategy Selection:**

**Broadcast Join:**
- Use when one dataset is small (< 2GB)
- Avoids shuffle operation
- Best performance for small lookup tables

**Sort-Merge Join:**
- Default for large datasets
- Requires data sorted on join keys
- Efficient for equi-joins

**Bucketed Join:**
- Pre-bucket data on join keys
- Avoids shuffle during join
- Requires pre-processing

**Optimization Techniques:**
- Ensure join keys are properly partitioned
- Filter data before joining when possible
- Use appropriate join types (inner vs outer)
- Monitor and handle data skew

---

## 🎯 Answering Strategy for Medium Questions

1. **Show Practical Experience**: Reference real-world scenarios
2. **Explain Trade-offs**: Discuss pros and cons of approaches
3. **Provide Examples**: Concrete implementation details
4. **Demonstrate Depth**: Show understanding beyond surface level

---

**Next**: [Architecture Patterns](./04_Architecture-Patterns-Part1-A.md) - Data platform architecture patterns

