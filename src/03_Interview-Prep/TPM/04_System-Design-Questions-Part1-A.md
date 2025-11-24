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
  enables: ["./04_System-Design-Questions-Part1-B.md"]
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

## 🔗 Related Documents

- [Part 1-B: Online Exam Platform and Real-time Chat](./04_System-Design-Questions-Part1-B.md) - System Designs 2-3
- [Part 1-C: Multi-Tenant SaaS and E-commerce](./04_System-Design-Questions-Part1-C.md) - System Designs 4-5
- [Interview Overview](./01_Interview-Overview.md) - Complete interview structure
