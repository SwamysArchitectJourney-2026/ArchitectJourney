---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["./03_Question-Bank-Part1-C-A-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Compare Synapse and Fabric architectures"
  - "Implement CI/CD for data platforms"
  - "Understand unified deployment strategies"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-C-A-A.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-C-B.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part2-A-1.md"]
---

# Principal Consultant - Data Question Bank (Advanced Level) - Part 1-B

**Advanced architecture questions** covering Synapse vs Fabric and CI/CD.

---

## Azure Architecture & Data Engineering

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

**Next**: [Databricks and Spark Performance Engineering](./03_Question-Bank-Part1-C-B.md)
