# Model Answers for TPM Interview Questions

**Prepared answers organized by difficulty level** for quick reference during interview preparation.

---

## 🟩 EASY LEVEL — Model Answers

### 1. What is the difference between Agile and Scrum?

**Answer:**
Agile is a mindset and set of values for iterative software delivery.
Scrum is a specific Agile framework with defined roles (PO, SM, Dev Team), events (sprints, standups), and artifacts (backlogs).

---

### 2. What is a sprint?

**Answer:**
A time-boxed iteration (usually 2 weeks) where the team delivers potentially shippable product increments.

---

### 3. What happens in daily stand-up?

**Answer:**
Each team member answers:

* What I did yesterday
* What I will do today
* What blockers I have

The goal is **synchronization**, not status reporting.

---

### 4. What is a user story?

**Answer:**
A short requirement written from the user's perspective:
**"As a [user], I want [feature], so that [benefit]."**

---

### 5. What is acceptance criteria?

**Answer:**
Conditions that must be met for the story to be considered done. It removes ambiguity.

---

### 6. What is velocity?

**Answer:**
The number of story points completed in a sprint. Used for planning future sprints.

---

## 🟨 MEDIUM LEVEL — Model Answers

### 1. Explain the SDLC phases

**Answer:**

1. Requirements
2. Design
3. Development
4. Testing
5. Deployment
6. Maintenance

I ensure each phase is aligned with Agile incremental delivery.

---

### 2. How do you estimate stories?

**Answer:**
Using **story points** based on:

* Complexity
* Effort
* Risks
* Uncertainties

We use **planning poker** for consensus.

---

### 3. How do you calculate sprint capacity?

**Answer:**
**Capacity = Team Members × Available Hours × Focus Factor (0.6–0.7)**
Then stories are pulled based on velocity + capacity.

---

### 4. What do you do when requirements change mid-sprint?

**Answer:**

* Protect sprint scope
* Log new changes as backlog items
* If urgent → negotiate with the PO and swap equivalent story points (capacity matching)

---

### 5. How do you handle delayed stories in mid-sprint?

**Answer:**

1. Identify blockers
2. Swarm the team if needed
3. Re-prioritize tasks
4. Communicate early to stakeholders
5. Move to next sprint only if unavoidable

---

### 6. How do you ensure quality?

**Answer:**

* Code reviews
* Static analysis
* Unit/integration tests
* Automated pipelines
* Definition of Done enforcement

---

### 7. QA is overloaded — what is your plan?

**Answer:**

* Reprioritize testing tasks
* Introduce risk-based testing
* Developers help with automation
* Redistribute workload
* Increase automation coverage

---

### 8. Stakeholder keeps changing requirements — what do you do?

**Answer:**

* Implement change request workflow
* Re-estimate
* Show impact on timeline
* Educate stakeholder on Agile planning
* Negotiate scope/timeline

---

## 🟥 ADVANCED LEVEL — Model Answers

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

### 1. What is your strategy for scaling engineering teams?

**Answer:**

* Clear role definitions
* Team topology (feature teams / platform teams)
* Architecture runway
* Standardized coding practices
* CI/CD automation
* Data-driven delivery (cycle time, flow efficiency)

---

### 2. How do you prioritize tech debt vs features?

**Answer:**
I classify tech debt into:

* High-risk
* Medium-risk
* Cosmetic

I allocate **15–20% sprint capacity** for tech debt and show ROI to stakeholders (performance, stability, faster development).

---

### 3. A major architectural decision is wrong. What do you do?

**Answer:**

* Conduct impact assessment
* Evaluate refactoring vs rewrite
* Create RFC
* Plan phased migration
* Communicate transparently
* Prioritize for the next release window

---

### 4. A senior engineer quits before release — what's your action?

**Answer:**

* Reassign tasks to leads
* Protect critical path
* Bring external contractor if needed
* Knowledge transfer from Git commits, documents, recordings
* Update risk register

---

### 5. CEO asks for a status update in 5 minutes — what do you present?

**Answer:**
A concise **executive summary**:

* % completion
* Risks (RAG status)
* Milestones
* Blockers
* Release date confidence

Chart + one-page summary.

---

## 🔗 Related Documents

* [Question Banks](./02_Question-Banks.md) - All questions organized by level
* [Interview Overview](./01_Interview-Overview.md) - Complete interview structure
* [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design
