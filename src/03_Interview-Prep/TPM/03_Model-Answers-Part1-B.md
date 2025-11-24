---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["TPM interview question knowledge", "Agile/Scrum understanding"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review model answers for TPM interview questions"
  - "Understand expected answer structure and depth"
  - "Prepare responses for different difficulty levels"
related_topics:
  prerequisites: []
  builds_upon: []
  enables: []
  cross_refs: []
---

### 1. Explain circuit breaker pattern

**Answer:**
A resilience pattern that prevents a system from repeatedly calling a failing service.
States: **Closed → Open → Half-open**
Prevents cascading failures in microservices.

---

### 2. What is Saga pattern?

**Answer:**
A way to manage distributed transactions across microservices.
Two types:

* Choreography (event-driven)
* Orchestration (central coordinator)

---

### 3. What branching strategy do you prefer?

**Answer:**
**Trunk-based development** for fast-moving teams:

* Short-lived feature branches
* Frequent merges
* Automated tests
* Ensures continuous integration

**Or GitFlow** for enterprise stability.

---

### 4. How do you manage multi-team dependencies?

**Answer:**

* Shared dependency board
* Weekly sync
* API contracts
* Delivery milestones
* Early integration in CI/CD
* Risk-based prioritization

---

### 5. Production issue at 2 AM — what is your first step?

**Answer:**

* Trigger incident management
* Form a WAR room
* Assign triage owner
* Rollback/mitigation
* RCA (Root Cause Analysis) within 24 hours
* Add preventive measures

---

### 6. Backend and frontend teams blame each other — what do you do?

**Answer:**

* Review logs, API contracts, test results
* Facilitate a fact-based joint debugging session
* Identify root cause
* Improve contract testing and CI automation

---

### 7. How do you rescue a failing project?

**Answer:**

1. Identify root cause
2. Re-baseline timelines
3. Prioritize critical path
4. Reassign resources
5. Fix process bottlenecks
6. Increase stakeholder communication

---

## 🟦 EXPERT LEVEL — Model Answers
