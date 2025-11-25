---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["Azure Data Engineering", "Databricks", "PySpark", "AI/ML basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review detailed answers for Advanced level questions (continued - Part 2)"
  - "Understand Data Mesh, CDC, and SCD patterns"
  - "Prepare for Principal Consultant technical interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-C-1.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-D.md"]
  cross_refs: []
---

# Principal Consultant Interview Answers (Part 2-C-2)

**Advanced level detailed answers (continued - Part 2)** for Principal Consultant roles.

---

## ✅ ADVANCED LEVEL ANSWERS (Continued)

### 51. How to design Data Mesh on Azure?

**Data Mesh Principles:**

* **One domain = one workspace** → Domain ownership
* **Contracts per domain** → Data contracts for schemas
* **Delta Sharing / Fabric Data Sharing** → Cross-domain data sharing
* **Purview for unified catalog** → Centralized discovery
* **Platform team enforces standards** → Governance framework

**Architecture:**

* Domain workspaces (Databricks/Fabric)
* Central governance (Purview)
* Data products (Gold layer)
* Self-service platform capabilities

**Benefits:**

* Faster time to market
* Domain expertise utilization
* Scalable governance
* Innovation at domain level

---

### 52. The best CDC pattern in Databricks?

**Recommended Pattern:**

Use **Auto Loader + Change Data Feed (CDF)** with upserts using MERGE INTO.

**Components:**

* **Auto Loader** → Incremental file ingestion
* **Change Data Feed** → Track changes in Delta tables
* **MERGE INTO** → Upsert operations (insert/update)

**Workflow:**

1. Source system generates change files
2. Auto Loader detects new files
3. Ingest to Bronze (raw changes)
4. Apply transformations
5. MERGE INTO Silver/Gold tables

**Benefits:**

* Efficient incremental processing
* ACID guarantees
* Time travel capabilities
* Minimal data movement

---

### 53. How do you enforce SCD Type 2 in Databricks?

**SCD Type 2 Implementation:**

Use MERGE INTO with conditions:

* **Current record** → `update` (set valid_to, is_current = false)
* **New record** → `insert` with valid_to null, is_current = true

**Example Pattern:**

```sql
MERGE INTO dim_customer AS target
USING source_data AS source
ON target.customer_id = source.customer_id
WHEN MATCHED AND target.is_current = true 
  AND target.hash_key != source.hash_key
THEN UPDATE SET 
  valid_to = current_timestamp(),
  is_current = false
WHEN NOT MATCHED
THEN INSERT (customer_id, name, valid_from, valid_to, is_current)
VALUES (source.customer_id, source.name, current_timestamp(), null, true)
```

**Benefits:**

* Historical tracking
* Time-based queries
* Audit trail
* Delta Lake ACID guarantees

---

## 🔗 Related Documents

- [Part 2-C-1: Advanced Answers (Continued - Part 1)](./03_Principal-Consultant-Question-Bank-Part2-C-1.md) - Advanced level answers continued Part 1
- [Part 2-B-2: Advanced Answers (Part 2)](./03_Principal-Consultant-Question-Bank-Part2-B-2.md) - Advanced level answers Part 2
- [Part 2-D: Expert Answers](./03_Principal-Consultant-Question-Bank-Part2-D.md) - Expert level detailed answers

