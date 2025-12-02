---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["Azure Data Engineering basics", "Databricks fundamentals"]
estimated_time: "15 minutes"
learning_objectives:
  - "Review easy-level questions for Principal Consultant interviews"
  - "Understand foundational concepts and definitions"
  - "Prepare concise, clear answers for basic questions"
related_topics:
  prerequisites: ["./02_Study-Roadmap.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-A-B.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-A.md"]
---

# Principal Consultant - Data Question Bank (Easy Level) - Part 1

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

**Next**: [Databricks and PySpark Basics](./03_Question-Bank-Part1-A-B.md)
