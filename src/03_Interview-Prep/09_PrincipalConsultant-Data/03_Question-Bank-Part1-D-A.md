---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["./03_Question-Bank-Part1-C-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Review expert-level system design questions"
  - "Understand enterprise data platform architecture"
  - "Learn modernization strategies for legacy systems"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-C-B.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-D-B.md"]
  cross_refs: ["../06_Solution-Architect/04_Principal-Consultant-Deep-Dives-Part1-A.md"]
---

# Principal Consultant - Data Question Bank (Expert Level) - Part 1

**System Design & Strategy questions** for Principal Consultant - Data interviews.

---

## System Design & Strategy

### 1. Enterprise Data Platform for 100+ Teams

**Question**: Design an enterprise Azure data platform for 100+ teams with governance, lineage, monitoring, and cost optimization. What services do you choose and why?

**Answer Framework:**

**Architecture Principles:**
- **Hub-Spoke Model**: Central landing zone with team-specific workspaces
- **Data Mesh Approach**: Domain ownership with centralized governance
- **Unified Governance**: Purview for lineage, cataloging, and access control
- **Multi-Tenancy**: Secure isolation with shared infrastructure

**Service Selection:**

**Orchestration:**
- **ADF**: Centralized pipeline orchestration
- **Fabric**: Business-led analytics and self-service

**Processing:**
- **Databricks**: Engineering-led advanced ETL and ML
- **Synapse**: Enterprise data warehousing

**Storage:**
- **ADLS Gen2**: Central data lake with medallion architecture
- **OneLake**: Fabric unified storage

**Governance:**
- **Purview**: Data catalog, lineage, and classification
- **Azure Policy**: Automated compliance enforcement

**Monitoring:**
- **Azure Monitor**: Centralized monitoring and alerting
- **Cost Management**: Budget alerts and resource tagging

**Key Design Decisions:**
- Separate workspaces per team for isolation
- Centralized governance and standards
- Self-service capabilities with guardrails
- Cost allocation and chargeback mechanisms

---

### 2. Modernize Legacy ETL to Lakehouse

**Question**: How do you modernize a legacy ETL system (SSIS/On-prem Hadoop) to a Lakehouse on Databricks/Fabric?

**Answer Framework:**

**Assessment Phase:**
- Inventory existing ETL processes and dependencies
- Analyze data volumes and processing patterns
- Identify technical debt and optimization opportunities
- Document business requirements and SLAs

**Modernization Strategy:**

**Phase 1: Foundation**
- Set up target lakehouse architecture (Bronze/Silver/Gold)
- Migrate data to ADLS Gen2
- Establish governance and security framework

**Phase 2: Incremental Migration**
- Start with low-risk, high-value workloads
- Use Strangler Pattern: gradually replace legacy components
- Maintain parallel processing during transition

**Phase 3: Transformation**
- Re-architect ETL to leverage Spark and Delta Lake
- Implement medallion architecture patterns
- Optimize for cloud-native capabilities

**Key Considerations:**
- Data validation and reconciliation
- Minimal downtime migration
- Team training and change management
- Cost optimization and right-sizing

---

### 3. Databricks vs Fabric Trade-offs

**Question**: What are the trade-offs of Databricks vs Fabric for enterprise adoption?

**Answer:**

| Aspect | Databricks | Fabric |
|--------|-----------|--------|
| **Target Users** | Engineering teams, data engineers | Business analysts, data analysts |
| **Learning Curve** | Steeper, requires Spark/Python knowledge | Lower, familiar Power BI interface |
| **Integration** | Best for Spark, ML, GenAI workloads | Tight Power BI integration |
| **Governance** | Unity Catalog, advanced features | Built-in governance, simpler model |
| **Cost Model** | Cluster-based, pay for compute | Capacity-based, always-on |
| **Use Cases** | Advanced ETL, ML pipelines, streaming | Business analytics, self-service BI |
| **Scalability** | Excellent for large-scale processing | Good for analytics workloads |

**Decision Framework:**
- **Choose Databricks**: Engineering-led, advanced Spark/ML needs, large-scale processing
- **Choose Fabric**: Business-led analytics, Power BI integration, unified platform
- **Hybrid Approach**: Use both - Databricks for engineering, Fabric for analytics

**C-Level Guidance:**
"Databricks excels for engineering teams building advanced data pipelines and ML models. Fabric provides a unified platform for business analytics with lower learning curve. Many enterprises use both: Databricks for data engineering and Fabric for business intelligence."

---

**Next**: [AI Strategy and Leadership - Part 1](./03_Question-Bank-Part1-D-B-A.md)
