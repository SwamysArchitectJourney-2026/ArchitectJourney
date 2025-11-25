---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for monolith migration and multi-region failover"
  - "Understand migration strategies and global architecture patterns"
  - "Prepare for TPM system design interviews"
related_topics:
  prerequisites: ["./01_System-Design-Model-Answers-Part1-C.md"]
  builds_upon: []
  enables: []
  cross_refs: []
---

# Additional System Design Model Answers (Part 1-D)

**System design answers** for Monolith to Microservices Migration and Global Multi-Region Failover.

---

## 9) Monolith → Microservices Migration (strategy + plan)

**Goal**

* Decompose monolith into services while minimizing user impact and delivery risk.

**Strategy options**

* Strangler Fig Pattern: incrementally replace parts with services.
* Vertical slice by business capability.
* Database decomposition: introduce service-owned data stores; use anti-corruption layers.

**Phased plan**

1. Discovery & domain modeling (identify bounded contexts).
2. Create infra foundation (CI/CD, service mesh).
3. Implement APIs/Contracts for next slices.
4. Extract services for one capability (e.g., auth, payments).
5. Use adapters to maintain compatibility.
6. Incrementally migrate traffic; monitor.

**Key technical choices**

* Use API gateway and service mesh (Istio) for traffic management, retries, observability.
* Introduce event bus for async integration where needed.

**Testing**

* Contract testing, end-to-end tests, canary deployments for extracted services.

**TPM delivery**

* Multi-year roadmap with milestones, risk register, migration playbooks.
* Governance: ADRs, architecture review, standards.

**Risks**

* Data consistency → prefer event-driven updates with eventual consistency; use sagas when needed.
* Team bandwidth → stagger migration, provide platform teams.

**Metrics**

* Number of services extracted, deployment frequency per service, incident rate during/after migration.

---

## 10) Global High-Availability Multi-Region Failover

**Requirements**

* F: Application must work even if one region fails; data locality and GDPR concerns.
* NF: Low RTO/RPO (define), low latency for users worldwide.

**Architecture**

* Active-active or active-passive multi-region architecture.
* Use CDN (CloudFront) + global API gateway.
* Databases: multi-region DB (e.g., Cosmos DB, Spanner) or primary-secondary with async replication and conflict resolution.
* Use traffic manager (DNS + health checks) for failover.

**Data strategy**

* For strongly consistent data: use global DB with multi-master (if available) or designate regional writes.
* For eventual consistency: use event log replication.

**Resilience**

* Cross-region load balancing, health checks, automated failover playbooks, runbooks for DB failover.

**Testing**

* Regular DR drills, runbooks, and failover rehearsals (simulate outages).

**TPM delivery**

* CapEx/Ops planning, SLA definitions, phased rollouts (pilot regions).

**Risks**

* Split brain in multi-master DB → use quorum-based approaches and conflict resolution policies.
* Data sovereignty → implement per-region data partitions.

**Metrics**

* RTO/RPO compliance, cross-region replication lag, failover time, error rate during failover.

---

## 🔗 Related Documents

- [Part 1-A-1: Ticket Booking and URL Shortener](./01_System-Design-Model-Answers-Part1-A-1.md) - Scenarios 1-2 Part 1
- [Part 1-A-2: Ticket Booking and URL Shortener](./01_System-Design-Model-Answers-Part1-A-2.md) - Scenarios 1-2 Part 2
- [Part 1-B-1: HR Attendance, Meeting Scheduling, Payment Processing](./01_System-Design-Model-Answers-Part1-B-1.md) - Scenarios 3-5 Part 1
- [Part 1-B-2: HR Attendance, Meeting Scheduling, Payment Processing](./01_System-Design-Model-Answers-Part1-B-2.md) - Scenarios 3-5 Part 2
- [Part 1-C-1: Event-Driven Systems, Analytics, CI/CD](./01_System-Design-Model-Answers-Part1-C-1.md) - Scenarios 6-8 Part 1
- [Part 1-C-2: Event-Driven Systems, Analytics, CI/CD](./01_System-Design-Model-Answers-Part1-C-2.md) - Scenarios 6-8 Part 2

