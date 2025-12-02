---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["./03_Question-Bank-Part1-A-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Review Databricks and PySpark basics"
  - "Understand Lakehouse architecture concepts"
  - "Master lazy evaluation and transformation types"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-A-A.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-B-A.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-A.md"]
---

# Principal Consultant - Data Question Bank (Easy Level) - Part 2

**Foundational questions** covering Databricks, Lakehouse, and PySpark basics.

---

## Databricks Basics

### 6. Explain the concept of pipelines vs notebooks in Databricks.

**Answer:**

**Notebooks:**
- Interactive development environment
- Code cells with immediate execution
- Great for exploration and prototyping
- Can be scheduled as jobs

**Pipelines (Delta Live Tables):**
- Declarative data transformation framework
- Automatic dependency management
- Built-in data quality monitoring
- Production-ready data engineering workflows

**When to Use:**
- **Notebooks**: Ad-hoc analysis, experimentation, interactive development
- **Pipelines**: Production ETL workflows, automated data processing, complex dependencies

---

### 7. What is a Spark DataFrame?

**Answer:**

A Spark DataFrame is a distributed, immutable collection of data organized into named columns. It provides:

- **Distributed processing**: Data partitioned across cluster nodes
- **Schema awareness**: Column names and types
- **Optimized execution**: Catalyst optimizer for query planning
- **API flexibility**: SQL, Python, Scala, R interfaces

**Key Characteristics:**
- Lazy evaluation (operations build execution plan)
- Immutable (transformations create new DataFrames)
- Optimized for analytics workloads

---

### 8. What is a Lakehouse?

**Answer:**

A Lakehouse is an architecture that combines the benefits of data lakes and data warehouses:

- **Data Lake Benefits**: Scalable storage, support for diverse data types, cost-effective
- **Data Warehouse Benefits**: ACID transactions, schema enforcement, query performance
- **Foundation**: Built on open formats like Delta Lake, Iceberg, or Hudi

**Key Features:**
- Single source of truth for all data
- Support for both batch and streaming
- Direct access for analytics and ML
- Governance and security capabilities

---

## PySpark Basics

### 9. Explain lazy evaluation in Spark.

**Answer:**

Lazy evaluation means Spark operations are not executed immediately. Instead:

- **Build execution plan**: Transformations create a logical plan
- **Optimize plan**: Catalyst optimizer improves the plan
- **Execute on action**: Only when an action (like `collect()`, `count()`) is called

**Benefits:**
- Optimization opportunities across the entire plan
- Efficient resource utilization
- Ability to cancel before execution

**Example**: Multiple transformations build a plan, but nothing executes until you call `show()` or `write()`.

---

### 10. What's the difference between `map()` and `flatMap()`?

**Answer:**

**`map()`:**
- Applies a function to each element
- Input and output have 1:1 relationship
- Returns same number of elements

**`flatMap()`:**
- Applies a function that returns multiple values
- Flattens the results into a single collection
- Can change the number of elements

**Example**: 
- `map()`: Split string into words → returns array of arrays
- `flatMap()`: Split string into words → returns flat list of words

---

## 🎯 Answering Strategy for Easy Questions

1. **Be Concise**: Clear, direct answers without unnecessary detail
2. **Use Examples**: Concrete examples help illustrate concepts
3. **Show Understanding**: Connect concepts to real-world use cases
4. **Be Confident**: These are warm-up questions - answer confidently

---

**Next**: [Question Bank - Medium Level](./03_Question-Bank-Part1-B-A.md) - Practical application questions
