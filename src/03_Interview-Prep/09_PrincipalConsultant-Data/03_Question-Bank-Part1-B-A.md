---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["./03_Question-Bank-Part1-A-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Review medium-level questions for Principal Consultant interviews"
  - "Understand practical application scenarios in Azure Data Engineering"
  - "Learn architecture and optimization techniques"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-A-B.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-B-B.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-B.md"]
---

# Principal Consultant - Data Question Bank (Medium Level) - Part 1

**Practical application questions** covering Azure Data Engineering scenarios.

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

**Next**: [Databricks, Spark, and PySpark Scenarios](./03_Question-Bank-Part1-B-B-A.md)
