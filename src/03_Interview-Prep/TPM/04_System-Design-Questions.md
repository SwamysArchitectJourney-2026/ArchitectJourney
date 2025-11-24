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
  prerequisites: []
  builds_upon: []
  enables: []
  cross_refs: []
---

# TPM-Focused System Design Questions

**System design questions specifically tailored for Technical Project Manager role** - focusing on architecture, team coordination, SDLC, risk, dependencies, and delivery.

---

## 🟩 Basic TPM System Design Questions

1. **Design an online ticket booking system.**
2. **Design a notification service (SMS/Email/Push).**
3. **Design a URL shortener.**
4. **Design a simple HR attendance system.**

**Your focus should be:**

* Requirements gathering
* Non-functional requirements
* Basic architecture
* APIs
* Data flow

---

## 🟨 Intermediate TPM System Design Questions

1. **Design a Learning Management System (LMS).**
2. **Design a real-time chat application.**
3. **Design an online exam platform.**
4. **Design a meeting scheduling application.**

**Focus on:**

* Integrating frontend/backend
* Handling scalability
* Managing microservices
* Databases (SQL/NoSQL)
* DevOps pipelines

---

## 🟥 Advanced TPM-Focused System Design Questions

1. **Design a multi-tenant SaaS platform.**
2. **Design a microservices-based e-commerce system.**
3. **Design a distributed payment processing system.**
4. **Design an event-driven order management system.**
5. **Design a system where multiple teams build services that must integrate (API-first design).**

**Your focus should include:**

* Service boundaries
* Team alignment
* API contracts
* Handling distributed transactions
* Observability (logs, metrics, tracing)
* Release management

---

## 🟦 Expert TPM System Design (Leadership + Architecture)

These evaluate **how you lead cross-functional teams**:

1. **Design a scalable DevOps CI/CD pipeline for 50+ microservices.**
2. **Design a real-time data analytics platform (Kafka + Stream Processing).**
3. **Design a global high-availability system (multi-region failover).**
4. **Design a platform migration from monolith → microservices.**
5. **Design architecture + delivery plan for a system that must go live in 90 days.**

**You must talk about:**

* Architecture
* Risks
* Team structure
* Delivery roadmap
* Integration testing strategy
* Rollout plan
* Monitoring and alerts

---

## 📋 Sample Question: Online Course Management System

**Question:** Design a simple system for an Online Course Management System.

**They want to see:**

* Entities
* High level architecture
* APIs
* Deployment pipeline
* CI/CD stages

---

---

## 📋 Complete System Design Model Answers

### 🟩 System Design 1: Notification Service (Email/SMS/Push)

**Use Case:** Send notifications reliably and at scale.

#### Requirements (Functional)

* Send notifications: SMS, email, push
* Support multiple providers (Twilio, SendGrid, Firebase)
* Retry on failure
* Logging and tracking notification status
* Template support

#### Non-Functional Requirements

* High throughput
* Reliability
* Low latency
* Scalability
* Monitoring & alerts

#### High-Level Architecture

**Components:**

1. Notification API Gateway
2. Notification Service
3. Provider Adapters
4. Message Queue (Kafka / Azure Service Bus)
5. Template Service
6. Logging + Monitoring (AppInsights, ELK)

#### Flow

1. Client calls **POST /notifications** →
2. API pushes message to **queue**
3. Worker service reads messages
4. Routes to provider adapter (email, SMS, push)
5. Provider responds → status logged

#### API Example

```
POST /notifications
{
  "type": "email",
  "to": "user@example.com",
  "templateId": "welcome",
  "params": { "name": "Swamy" }
}
```

#### Database Design

**Notifications Table:**

* Id
* Type
* UserId
* Payload
* Status
* RetryCount
* Timestamp

#### Delivery & Team Strategy (TPM Angle)

* Split into 3 teams: API, Workers, Provider Integrations
* Weekly cross-team integration
* Use contract-first API design
* DevOps: automated CI/CD, feature toggles
* Canary rollout for each channel

#### Risks

* Provider downtime → mitigate using fallback providers
* Rate limits → queues smooth load

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

- [Interview Overview](./01_Interview-Overview.md) - Complete interview structure
- [Question Banks](./02_Question-Banks.md) - All questions organized by level
- [Model Answers](./03_Model-Answers.md) - Prepared answers
- [Mock Interview Questions](./07_Mock-Interview-Questions.md) - Complete mock interview

