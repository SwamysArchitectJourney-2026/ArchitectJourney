---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["Advanced Azure Data Engineering", "Databricks", "PySpark", "Architecture"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review advanced-level questions for Principal Consultant interviews"
  - "Understand architecture and performance optimization scenarios"
  - "Learn governance and scalability patterns"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-B.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-D.md", "./04_Architecture-Patterns-Part1-A.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part2-A-1.md"]
---

# Principal Consultant - Data Question Bank (Advanced Level)

**Advanced architecture and optimization questions** for Principal Consultant - Data interviews.

---

## Azure Architecture & Data Engineering

### 1. Design a Production-Grade ETL Platform

**Question**: Design a production-grade ETL platform using ADF, Databricks, and ADLS Gen2. What are the key components, and how do you ensure monitoring and fault tolerance?

**Answer Framework:**

**Architecture Components:**
- **ADF**: Orchestration layer for pipeline scheduling and coordination
- **ADLS Gen2**: Storage layer with Bronze/Silver/Gold medallion architecture
- **Databricks**: Transformation engine for batch and streaming processing
- **Purview**: Data governance, lineage tracking, and cataloging
- **Azure Monitor + Log Analytics**: Comprehensive monitoring and alerting
- **Key Vault**: Secrets management for secure credential storage
- **CI/CD**: GitHub Actions or Azure DevOps for automated deployments

**Key Capabilities:**
- Parameterized pipelines for flexibility
- Retry mechanisms with exponential backoff
- Data validation and quality checks
- Audit tables for tracking pipeline execution
- Delta Lake schema enforcement
- Auto Loader for incremental ingestion

**Monitoring Strategy:**
- Pipeline execution metrics and success rates
- Data quality metrics and validation results
- Resource utilization and cost tracking
- Alerting on failures and threshold breaches

**Fault Tolerance:**
- Idempotent pipeline design
- Checkpointing for long-running processes
- Dead letter queues for failed records
- Automated retry with backoff strategies

---

### 2. Migrate On-Prem SQL Data Warehouse to Fabric/Synapse

**Question**: How would you migrate an on-prem SQL data warehouse to Fabric or Synapse?

**Answer Framework:**

**Migration Strategy:**

**Assessment Phase:**
- Inventory existing schemas, tables, and dependencies
- Analyze query patterns and performance requirements
- Identify data volumes and growth patterns
- Document ETL processes and data lineage

**Design Phase:**
- Choose target platform (Fabric vs Synapse) based on requirements
- Design target schema optimized for cloud architecture
- Plan data partitioning and distribution strategies
- Design ETL migration approach (lift-and-shift vs re-architect)

**Migration Approach:**
- **Lift-and-Shift**: Use Azure Database Migration Service for schema and data
- **Re-Architect**: Redesign for cloud-native patterns (lakehouse, medallion)
- **Hybrid**: Migrate in phases, starting with new workloads

**Execution:**
- Set up parallel environments for validation
- Implement data validation and reconciliation
- Use dual-write pattern during transition
- Plan cutover with minimal downtime

**Post-Migration:**
- Performance tuning and optimization
- Update downstream systems and reports
- Decommission legacy systems
- Establish monitoring and governance

---

### 3. Compare Synapse Dedicated SQL Pool vs Fabric Data Warehouse

**Question**: Compare Synapse Dedicated SQL Pool vs Fabric Data Warehouse.

**Answer:**

| Aspect | Synapse Dedicated SQL Pool | Fabric Data Warehouse |
|--------|---------------------------|----------------------|
| **Architecture** | Dedicated compute with separate storage | Unified compute and storage (OneLake) |
| **Scaling** | Pause/resume, scale compute independently | Capacity-based scaling model |
| **Integration** | Part of Synapse Analytics workspace | Integrated with Fabric ecosystem |
| **Cost Model** | Pay for compute when running | Pay for capacity units (always-on) |
| **Use Case** | Enterprise data warehousing, large-scale analytics | Unified analytics, business-led analytics |
| **Performance** | MPP engine optimized for large queries | Optimized for Fabric ecosystem integration |

**Decision Framework:**
- **Choose Synapse**: Large-scale enterprise data warehousing, existing Synapse investments
- **Choose Fabric**: Unified analytics platform, business-led analytics, Power BI integration

---

### 4. Implement CI/CD for ADF, Databricks, and Fabric

**Question**: How do you implement CI/CD for ADF, Databricks, and Fabric together?

**Answer Framework:**

**ADF CI/CD:**
- Use Git integration for pipeline versioning
- ARM/Bicep templates for infrastructure as code
- Azure DevOps or GitHub Actions for deployment pipelines
- Environment-specific parameter files

**Databricks CI/CD:**
- Databricks Repos for code versioning
- Deploy notebooks and Python/Scala artifacts
- Use Databricks CLI or REST API for deployments
- Cluster policies for environment consistency

**Fabric CI/CD:**
- Fabric Git integration for Lakehouses and pipelines
- Deployment pipelines for workspace promotion
- Version control for data engineering artifacts
- Automated testing and validation

**Unified Approach:**
- Single repository or monorepo for all artifacts
- Shared CI/CD pipelines with environment promotion
- Automated testing at each stage
- Infrastructure as code for all components

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

**Next**: [Question Bank - Expert Level](./03_Question-Bank-Part1-D.md) - Strategic leadership questions

