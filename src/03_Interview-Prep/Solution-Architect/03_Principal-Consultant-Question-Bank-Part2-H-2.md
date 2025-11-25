---
content_type: "interview_prep"
learning_level: "Expert"
prerequisites: ["Advanced Azure Data Engineering", "Databricks", "PySpark", "AI/ML", "Architecture", "Security"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review Principal/Staff-level case studies (Part 2)"
  - "Understand multi-tenant data platform architecture"
  - "Prepare for case study interviews"
related_topics:
  prerequisites: ["./03_Principal-Consultant-Question-Bank-Part2-H-1.md"]
  builds_upon: []
  enables: ["./03_Principal-Consultant-Question-Bank-Part2-I-1.md"]
  cross_refs: []
---

# Principal Consultant Interview Prep - Case Studies (Part 2-H-2)

**Principal/Staff-level case studies (Part 2)** with detailed answers.

---

## 🔵 CASE STUDY 4 — Multi-Tenant Data Platform for 30 Business Units

### Key Points:

### 1. Data Isolation

**Isolation Strategies:**

* Separate **Lakehouse folders** per tenant
* ACL-based access control
* Workspace-per-tenant (Databricks)
* Warehouse isolation (Fabric)

**Implementation:**

* Use folder structure: `/tenant_id/bronze/`, `/tenant_id/silver/`, `/tenant_id/gold/`
* Apply ACLs at folder level
* Separate compute resources per tenant

---

### 2. Compute Isolation

**Compute Strategies:**

* **Cluster policies** → Enforce resource limits
* **CU allocation per tenant** (Fabric) → Capacity management
* **Autoscaling per workspace** → Dynamic scaling

**Benefits:**

* Cost isolation
* Performance isolation
* Security isolation

---

### 3. Data Mesh Architecture

**Data Mesh Principles:**

Each business unit becomes a **data producer and consumer**.

**Publish Gold layer as Data Products via:**

* Fabric Data Sharing
* Delta Sharing
* Purview Catalog

**Benefits:**

* Domain ownership
* Self-service analytics
* Scalable governance

---

### 4. Chargeback Model

**Chargeback Components:**

* **Log compute usage** → Track resource consumption
* **Cost per tenant** → Allocate costs
* **Monthly dashboard delivered to CIO** → Reporting

**Implementation:**

* Use Azure Cost Management
* Tag resources by tenant
* Generate monthly reports
* Allocate shared costs

---

## 🔗 Related Documents

- [Part 2-H-1: Case Studies (Part 1)](./03_Principal-Consultant-Question-Bank-Part2-H-1.md) - Case studies Part 1
- [Part 2-G-2: Case Studies (Part 2)](./03_Principal-Consultant-Question-Bank-Part2-G-2.md) - Case studies Part 2
- [Part 2-I-1: Mock Interview (Part 1)](./03_Principal-Consultant-Question-Bank-Part2-I-1.md) - Mock interview Part 1




