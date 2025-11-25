---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Advanced level questions (continued - Part 1)"
  - "Understand data governance, security, and optimization patterns"
  - "Prepare for Principal Consultant technical interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-B-2.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-C-2.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-C-1)

**Advanced level detailed answers (continued - Part 1)** for Principal Consultant roles.

---

## ✅ ADVANCED LEVEL ANSWERS (Continued)

### 46. How do you handle GDPR in Databricks?

**GDPR Compliance Strategies:**

* **Delete user data** → Use Delta DELETE with time travel for audit
* **Use CHANGE DATA FEED** → Track deletions and modifications
* **Encrypt PII** → Field-level encryption, tokenization
* **Access logs + Purview** → Audit data access, track lineage
* **Data retention policies** → Automated lifecycle management
* **Right to be forgotten** → Automated deletion workflows

**Implementation:**

* Use Delta Lake for ACID transactions
* Implement data classification (Purview)
* Use row-level security for data filtering
* Enable audit logging for compliance reporting

---

### 47. How do you secure ADF Pipelines?

**Security Best Practices:**

* **Private endpoints** → Isolate network traffic
* **Managed identity** → No password storage
* **Key Vault for passwords** → Centralized secret management
* **VNet integration** → Network isolation
* **RBAC** → Least privilege access
* **Encryption at rest** → Customer-managed keys
* **Encryption in transit** → TLS 1.2+

**Additional Measures:**

* Enable diagnostic logs
* Monitor pipeline executions
* Implement approval gates for sensitive operations
* Use parameterized pipelines (no hardcoded values)

---

### 48. How do you scale Spark cluster efficiently?

**Scaling Strategies:**

* **Right-size executors** → Balance memory and cores
* **Autoscaling** → Scale based on workload demand
* **Spot instances** → Cost reduction for non-critical workloads
* **Use Photon** → Faster execution = fewer nodes needed
* **Cluster pools** → Pre-warmed clusters for faster startup

**Optimization:**

* Monitor cluster utilization
* Use cluster policies to enforce limits
* Implement auto-termination for idle clusters
* Use different cluster sizes for different workloads

---

### 49. How do you handle bad data at scale?

**Data Quality Framework:**

* **Quarantine layer** → Isolate bad data for review
* **Validation rules** → Schema validation, business rules
* **Great Expectations / Deequ** → Data quality testing
* **Logging of errors** → Track data quality issues
* **Automated alerts** → Notify on quality threshold breaches

**Process:**

1. Ingest to Bronze (raw data)
2. Apply validation rules
3. Route bad data to quarantine
4. Clean and reprocess quarantined data
5. Load clean data to Silver

**Monitoring:**

* Data quality metrics dashboard
* Trend analysis for quality issues
* Automated remediation where possible

---

### 50. Lakehouse vs Warehouse — When to choose what?

**Use Lakehouse for:**

* **Data science** → ML workloads, experimentation
* **ML/AI** → Feature engineering, model training
* **Streaming** → Real-time data processing
* **Unstructured data** → JSON, images, text
* **Cost-effective storage** → Object storage pricing

**Use Warehouse for:**

* **BI teams** → SQL-first analytics
* **OLAP reporting** → Aggregated analytics
* **Highly structured queries** → Star/snowflake schemas
* **Performance-critical SQL** → MPP engine optimization

**Hybrid Approach:**

* Use Lakehouse for data engineering and ML
* Use Warehouse for BI and reporting
* Share data via Delta Sharing or Fabric Data Sharing

---

## 🔗 Related Documents

- [Part 2-C-2: Advanced Answers (Continued - Part 2)](./03_Principal-Consultant-Question-Bank-Part2-C-2.md) - Advanced level answers continued Part 2
- [Part 2-B-2: Advanced Answers (Part 2)](./03_Principal-Consultant-Question-Bank-Part2-B-2.md) - Advanced level answers Part 2
- [Part 2-D: Expert Answers](./03_Principal-Consultant-Question-Bank-Part2-D.md) - Expert level detailed answers

