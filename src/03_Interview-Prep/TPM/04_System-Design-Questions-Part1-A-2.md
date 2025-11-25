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
  prerequisites: ["./04_System-Design-Questions-Part1-A-1.md"]
  builds_upon: []
  enables: ["./04_System-Design-Questions-Part1-B.md"]
  cross_refs: []
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
