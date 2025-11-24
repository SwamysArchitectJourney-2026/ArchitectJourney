---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM role understanding", "SDLC knowledge"]
estimated_time: "25 minutes"
learning_objectives:
  - "Prepare for TPM-focused system design questions"
  - "Understand architecture, coordination, and delivery aspects"
  - "Review system design patterns for TPM interviews"
related_topics:
  prerequisites: ["./04_System-Design-Questions-Part1-B.md"]
  builds_upon: []
  enables: []
  cross_refs: []
---

# TPM-Focused System Design Questions (Part 1-C)

**System design model answers** for Multi-Tenant SaaS Platform and E-commerce System.

---

### 🟦 System Design 4: Multi-Tenant SaaS Platform

#### Requirements

* Host multiple customers on same infra
* Tenant-level isolation
* Role-based access
* Configurable branding
* Usage-based billing

#### Architecture

* API Gateway
* Auth Service (OAuth, JWT)
* Tenant Resolver Middleware
* Tenant Metadata DB
* App Services
* Shared DB (with TenantId column) OR per-tenant DB (premium plan)

#### Important Concepts (Interview Gold)

* Tenant Isolation
* Per-tenant rate limits
* Tenant-aware caching
* Blue/green deployments

#### TPM Angle

* Parallel development per module
* Compliance: GDPR, retention
* Deployment automation
* SLA commitments

---

### 🟪 System Design 5: E-commerce System (Microservices)

#### Core Services

* Product Service
* Catalog Service
* Inventory
* Cart
* Order
* Payment
* Notification
* Shipping

#### Advanced Concepts

* Event-driven flow using Kafka
* Saga pattern for order handling
* API gateway
* Redis cache
* Caching strategies (write-through/read-through)

#### TPM Delivery Strategy

* 8–10 squads (each microservice = 1 squad)
* Domain-driven design
* Contract testing
* Sprint 0: Architecture + CI/CD + Infra
* Release every 2 weeks

---

## 🔗 Related Documents

- [Part 1-A: Questions and Notification Service](./04_System-Design-Questions-Part1-A.md) - Questions by level and System Design 1
- [Part 1-B: Online Exam Platform and Real-time Chat](./04_System-Design-Questions-Part1-B.md) - System Designs 2-3
- [Interview Overview](./01_Interview-Overview.md) - Complete interview structure
- [Question Banks](./02_Question-Banks.md) - All questions organized by level

