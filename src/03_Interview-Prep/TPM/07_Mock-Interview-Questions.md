# Complete TPM Mock Interview (With Answers)

**Full mock interview question bank with model answers** organized by difficulty level - perfect for interview practice this week.

---

## 🟩 BASIC LEVEL (20 Questions + Model Answers)

### 1. Tell me about yourself.

**Model Answer:**
"I am a Technical Project Manager with a strong background in software development, specializing in .NET and Azure. I have led cross-functional engineering teams, delivered complex projects using Agile and Scrum methodologies, and driven end-to-end SDLC execution. My strength is bridging business and technical teams, ensuring smooth delivery, and solving engineering challenges."

---

### 2. What is Agile?

Agile is an iterative approach to software development focused on delivering value in small, frequent increments.

---

### 3. What is Scrum?

Scrum is an Agile framework with fixed-length sprints, defined roles (PO, SM, Dev Team), and ceremonies.

---

### 4. What is a sprint?

A time-boxed iteration (typically 2 weeks) where the team delivers a potentially shippable increment.

---

### 5. What is the role of a Scrum Master?

Facilitate ceremonies, remove blockers, coach the team in Agile practices, protect the sprint.

---

### 6. What is velocity?

The number of story points delivered per sprint. Used for planning.

---

### 7. What is a user story?

A requirement written from user perspective:
**As a <user> I want <feature> so that <benefit>**

---

### 8. What is acceptance criteria?

Clear conditions to consider a story "Done."

---

### 9. What is Definition of Done (DoD)?

Checklist ensuring quality: code complete, reviewed, tested, deployed to dev, meets AC.

---

### 10. What is a burndown chart?

Shows remaining work in a sprint.

---

### 11. What is backlog grooming?

Refining backlog stories, estimates, and priorities.

---

### 12. What tools do you use?

JIRA, Azure DevOps, Confluence, Git, Postman, Teams.

---

### 13. What is continuous integration?

Developers regularly merge code to main branch, triggering automated tests/builds.

---

### 14. What is the SDLC?

The lifecycle of software: requirement → design → development → testing → deployment → maintenance.

---

### 15. What is risk vs issue?

Risk = future problem
Issue = problem happening now

---

### 16. What is code review?

Peer-review process to ensure quality and maintainability.

---

### 17. What is Kanban?

Agile method with continuous flow, WIP limits, no fixed sprints.

---

### 18. What is MVP?

Minimum Viable Product — the smallest feature set that delivers value.

---

### 19. What is stakeholder management?

Aligning expectations, communication, status reporting, managing dependencies.

---

### 20. How do you communicate status?

Using dashboards, RAG status, milestone reports, risks/issues tracker.

---

## 🟨 INTERMEDIATE LEVEL (20 Questions + Model Answers)

### 1. How do you run a sprint planning meeting?

**Model Answer:**

* Review product backlog
* Prioritize with PO
* Estimate stories
* Break stories into tasks
* Define sprint goal
* Finalize sprint commitment
* Update JIRA board

---

### 2. How do you calculate sprint capacity?

Capacity = team members × available hours × focus factor (≈ 60–70%)

---

### 3. How do you estimate user stories?

Using story points with Planning Poker; consider complexity, risk, effort.

---

### 4. How do you handle mid-sprint changes?

* Protect sprint scope
* Create a new backlog item
* If urgent → swap stories of equal size
* Communicate impact

---

### 5. How do you manage dependencies?

* Dependency board
* Weekly sync
* Early API contracts
* Shared milestones

---

### 6. How do you remove blockers?

Identify root cause → delegate → escalate → track until resolved.

---

### 7. How do you handle a difficult developer?

Understand the issue → offer support → set expectations → give feedback → escalate if needed.

---

### 8. How do you ensure code quality?

* Code reviews
* Static analysis
* Unit tests
* CI pipelines
* Definition of Done

---

### 9. What metrics do you track?

* Velocity
* Cycle time
* Lead time
* Burndown
* Defect leakage
* Release frequency

---

### 10. How do you manage cross-functional teams?

Clear roles, communication channels, shared goals, sprint alignment meetings.

---

### 11. How do you manage scope creep?

Controlled via change management, impact analysis, re-estimation.

---

### 12. How do you communicate delays?

Using data (velocity, capacity) + revised timeline + mitigation plan.

---

### 13. How do you prioritize features?

MoSCoW, WSJF, business value, ROI.

---

### 14. How do you estimate timelines?

Historical velocity + story points + team capacity.

---

### 15. How do you run retrospectives?

What went well → what didn't → action items → owners → follow-up.

---

### 16. How do you deal with poor performance?

Identify cause → coaching → training → clear KPIs → escalations if needed.

---

### 17. How do you monitor progress?

JIRA dashboards, daily standups, sprint burndown, release burnup.

---

### 18. What branching strategy do you recommend?

Trunk-based development for fast teams; GitFlow for enterprise.

---

### 19. How do you manage test environments?

Environment calendar + approvals + automated deployments.

---

### 20. How do you coordinate with Product Owners?

Backlog prioritization → grooming → sprint goals → roadmap alignment.

---

## 🟥 ADVANCED LEVEL (20 Questions + Model Answers)

### 1. Explain microservices architecture.

Small, independent services with their own DBs communicating via REST or events.

---

### 2. How do you handle distributed transactions?

Using Saga pattern (orchestration or choreography).

---

### 3. What is API gateway?

Entry point for all clients, handling routing, rate limits, authentication, caching.

---

### 4. What is event-driven architecture?

Services communicate via pub-sub instead of synchronous API calls.

---

### 5. What is your CI/CD pipeline?

Code → build → tests → security scan → deploy to dev → QA → staging → prod (manual/auto).

---

### 6. How do you handle production incidents?

War room → triage → rollback → RCA → preventive measures.

---

### 7. How do you scale a system?

Caching, load balancers, horizontal scaling, DB sharding, async messaging.

---

### 8. How do you resolve conflicts between teams?

Data-driven discussion + clear ownership + meeting facilitation + decision logs.

---

### 9. How do you manage multiple scrum teams?

Scrum of Scrums, shared backlog, cross-team dependency board.

---

### 10. How do you ensure architecture consistency?

Architecture review board, ADR (architecture decision record), coding standards.

---

### 11. How do you build a release plan?

Define release cycles → entry/exit criteria → regression testing → deployment window → rollback plan.

---

### 12. How do you manage risks?

Identify → assess → mitigate → track → escalate high-impact risks.

---

### 13. How do you handle performance bottlenecks?

Profiling → DB optimization → caching → async processing → load testing.

---

### 14. How do you ensure security?

OWASP top 10, static analysis, API authentication, secrets management.

---

### 15. How do you handle tech debt?

Allocate 10–20% sprint capacity + prioritize based on impact.

---

### 16. Explain blue-green deployment.

Two identical environments → switch traffic → zero downtime.

---

### 17. Explain canary release.

Release to small % users → monitor → expand gradually.

---

### 18. How do you manage remote teams?

Clear communication rules + overlap hours + tooling + written documentation.

---

### 19. How do you track test coverage?

Using SonarQube, unit test reports, code coverage dashboards.

---

### 20. How do you manage architectural changes?

RFC document → review → impact analysis → phased rollout.

---

## 🟦 EXPERT LEVEL (20 Questions + Model Answers)

### 1. Describe the most complex project you led.

(*Use STAR: Situation, Task, Action, Result*)
Focus on scope, architecture, people, timeline, and business impact.

---

### 2. How do you drive delivery under uncertainty?

Break big features into increments → short sprints → prototypes → risk reduction spikes.

---

### 3. How do you influence without authority?

Data, trust, collaboration, technical understanding, and clear communication.

---

### 4. How do you balance technical debt vs new features?

Quantify impact → ROI → negotiate with Product → set aside 20% capacity.

---

### 5. How do you manage senior engineers with strong opinions?

Let them speak → focus on data → architectural principles → time-box → final decision.

---

### 6. A project is 2 months behind. What do you do?

Re-baseline → re-scope → add resources → parallel execution → revised roadmap.

---

### 7. How do you build a high-performing team?

Psychological safety → clear goals → regular feedback → growth opportunities.

---

### 8. How do you manage multi-team architecture?

Define domains → contract-first APIs → integration tests → frequent syncs.

---

### 9. What do you do if QA finds critical bugs before release?

Triage → fix only blockers → razor focus → negotiate release timeline if needed.

---

### 10. How do you run PI planning (Scaled Agile)?

Vision → roadmap → team breakouts → risks → features → dependencies.

---

### 11. How do you forecast delivery for 6 months?

Historical velocity → risk adjustment → capacity → roadmap → buffers.

---

### 12. How do you handle unclear requirements?

Workshops → prototypes → clarify with PO → document assumptions → iterate.

---

### 13. When do you refactor vs rewrite?

Refactor when scope is small; rewrite when architecture is fundamentally broken.

---

### 14. How do you manage global distributed systems?

Multi-region deployments → CDNs → data replication → failovers.

---

### 15. How do you ensure observability?

Structured logs → metrics → traces → dashboards → alerts.

---

### 16. How do you manage business pressure?

Show trade-offs → data-backed decisions → negotiate → protect the team.

---

### 17. How do you ensure alignment with business goals?

OKRs → roadmap → backlog prioritization → stakeholder communication.

---

### 18. How do you manage 10+ parallel initiatives?

Portfolio dashboard → RAG status → risk heat map → weekly executive review.

---

### 19. How do you escalate issues?

Use escalation matrix → clear documentation → impact assessment → solution proposals.

---

### 20. How do you handle a team member who is toxic but technically strong?

Private conversation → clear behavioral expectations → coaching → escalate if no improvement.

---

## 🔗 Related Documents

- [Model Answers](./03_Model-Answers.md) - Additional model answers
- [Question Banks](./02_Question-Banks.md) - Complete question banks
- [Interview Overview](./01_Interview-Overview.md) - Complete interview structure

