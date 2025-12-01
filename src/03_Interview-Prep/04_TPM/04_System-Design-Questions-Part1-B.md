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
  prerequisites: ["./04_System-Design-Questions-Part1-A-2.md"]
  builds_upon: []
  enables: ["./04_System-Design-Questions-Part1-C.md"]
  cross_refs: []
---

# TPM-Focused System Design Questions (Part 1-B)

**System design model answers** for Online Exam Platform and Real-time Chat Application.

---

### 🟨 System Design 2: Online Exam Platform

#### Functional Requirements

* User login
* Take timed exams
* Randomized questions
* Proctoring (optional)
* Results & reporting

#### Non-Functional Requirements

* Secure
* High performance
* Prevent cheating
* Scalable

#### Architecture

* Web/App UI
* Exam Service
* Question Bank Service
* Timer Service
* Result Service
* Cache for question retrieval
* Database (SQL for results, NoSQL for questions)

#### Workflow

* User starts exam → backend generates unique exam set
* Timer starts
* Questions fetched from Question Bank
* Auto-save answers via polling/WebSocket
* End exam → evaluate → return result

#### TPM Angle — Delivery Plan

* Feature teams for Question Bank, Exam Session, Scoring
* API contract-first approach
* Sprint 1–4:
  * S1: Auth + Question CRUD
  * S2: Exam-taking UI + API
  * S3: Timer + Autosave
  * S4: Reports & Admin

---

### 🟥 System Design 3: Real-time Chat Application

#### Key Requirements

* 1:1 chat
* Group chat
* Message history
* Delivery status
* Online presence
* Typing indicator

#### Architecture

* WebSocket Gateway
* Chat Service
* Message Queue
* Presence Service
* History Service
* Notification Service
* DB: MongoDB or Cassandra

#### High-Level Flow

1. User connects to WebSocket Gateway
2. Presence Service marks user online
3. Messages are delivered via WebSocket
4. Stored in DB asynchronously via queue
5. Offline users receive push notifications

#### TPM Leadership Focus

* Coordinate backend, frontend, mobile teams
* Weekly integration for WebSockets
* Performance testing for concurrency
* Security review for vulnerabilities

---

## 🔗 Related Documents

- [Part 1-A-1: Questions and Notification Service](./04_System-Design-Questions-Part1-A-1.md) (Part 1-A-1) | [Part 1-A-2](./04_System-Design-Questions-Part1-A-2.md) - Questions by level and System Design 1
- [Part 1-C: Multi-Tenant SaaS and E-commerce](./04_System-Design-Questions-Part1-C.md) - System Designs 4-5
- [Interview Overview](./01_Interview-Overview.md) - Complete interview structure

