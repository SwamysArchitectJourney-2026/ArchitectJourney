---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["Azure Data Engineering basics", "Databricks fundamentals"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review easy-level questions for Principal Consultant interviews"
  - "Understand foundational concepts and definitions"
  - "Prepare concise, clear answers for basic questions"
related_topics:
  prerequisites: ["./02_Study-Roadmap.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-B.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-A.md"]
---

# Principal Consultant - Data Question Bank (Easy Level)

**Foundational questions** for Principal Consultant - Data interviews covering basic concepts and definitions.

---

## Azure Data Engineering Basics

### 1. What is Azure Data Factory?

**Answer Framework:**

Azure Data Factory is a cloud-based ETL/ELT orchestration service that enables data movement and transformation across diverse sources. It provides:

- **Pipeline orchestration**: Schedule and coordinate data workflows
- **Data movement**: Copy activities for data transfer
- **Data transformation**: Mapping Data Flows and integration with compute services
- **Integration**: Connect to on-premises and cloud data sources

**Key Use Cases:**
- ETL/ELT pipeline orchestration
- Data migration projects
- Scheduled data processing
- Data integration across systems

---

### 2. What is the difference between a Pipeline and an Activity in ADF?

**Answer:**

- **Pipeline**: A container that groups related activities into a workflow. It defines the overall data processing logic and can be scheduled or triggered.

- **Activity**: A single step within a pipeline that performs a specific action. Examples include:
  - Copy Activity: Moves data between sources
  - Notebook Activity: Executes Databricks notebooks
  - Mapping Data Flow: Performs transformations
  - Stored Procedure Activity: Executes SQL procedures

**Analogy**: A pipeline is like a recipe, and activities are the individual steps in that recipe.

---

### 3. What is the purpose of Linked Services in ADF?

**Answer:**

Linked Services define connection information to external data sources or compute services. They:

- **Store connection details**: Connection strings, authentication credentials
- **Enable reuse**: Multiple pipelines can reference the same linked service
- **Simplify management**: Update connection info in one place
- **Support various sources**: Databases, storage accounts, compute services

**Example**: A linked service to Azure Blob Storage contains the storage account name and authentication method, which can be used by multiple copy activities.

---

### 4. What is Delta Lake?

**Answer:**

Delta Lake is an open-source storage layer that brings ACID transactions and reliability to data lakes. Key features:

- **ACID transactions**: Ensures data consistency
- **Schema enforcement**: Validates data structure
- **Time travel**: Query historical versions of data
- **Upsert capabilities**: Merge operations for incremental loads
- **Scalable metadata**: Efficient handling of large datasets

**Benefits**: Transforms data lakes into reliable, queryable data platforms suitable for analytics and ML workloads.

---

### 5. What is the difference between Azure Blob Storage and ADLS Gen2?

**Answer:**

**Azure Blob Storage:**
- Flat namespace structure
- Object storage for unstructured data
- Lower cost for simple storage needs
- Standard REST API access

**Azure Data Lake Storage Gen2:**
- Hierarchical namespace (file system-like)
- Optimized for analytics workloads
- Better performance for large files
- POSIX-compliant access control
- Integration with analytics services

**Key Difference**: ADLS Gen2 adds a hierarchical namespace on top of Blob Storage, making it better suited for big data analytics.

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

**Next**: [Question Bank - Medium Level](./03_Question-Bank-Part1-B.md) - Practical application questions

