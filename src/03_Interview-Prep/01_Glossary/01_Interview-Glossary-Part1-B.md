---
content_type: "interview_prep"
learning_level: "Beginner"
prerequisites: []
estimated_time: "25 minutes"
learning_objectives:
  - "Understand security, compliance, and AI/ML terminology for interviews"
  - "Master monitoring, observability, and reliability terms"
  - "Learn interview-specific acronyms and frameworks"
related_topics:
  prerequisites: ["./01_Interview-Glossary-Part1-A.md"]
  builds_upon: ["./01_Interview-Glossary-Part1-A.md"]
  enables: []
  cross_refs: ["../AI-Architect/", "../TPM/"]
---

# Interview Glossary - Part 1-B

> **Continuation of interview terminology** covering security, AI/ML, monitoring, and interview-specific terms.

---

## 📋 Table of Contents

1. [Security & Compliance](#security--compliance)
2. [AI & Machine Learning](#ai--machine-learning)
3. [Monitoring & Observability](#monitoring--observability)
4. [Interview Frameworks](#interview-frameworks)

---

## Security & Compliance

### Authentication & Authorization

- **RBAC (Role-Based Access Control)** – Authorization model based on user roles and permissions.
- **ABAC (Attribute-Based Access Control)** – Authorization model based on user attributes and policies.
- **OAuth** – Authorization framework for delegated access to resources.
- **JWT (JSON Web Token)** – Compact, URL-safe token format for securely transmitting information.
- **SAML (Security Assertion Markup Language)** – XML-based standard for exchanging authentication and authorization data.
- **SSO (Single Sign-On)** – Authentication process allowing users to access multiple applications with one login.
- **MFA (Multi-Factor Authentication)** – Security method requiring multiple authentication factors.

### Data Protection

- **PII (Personally Identifiable Information)** – Data that can identify an individual.
- **DLP (Data Loss Prevention)** – Controls to prevent sensitive data exfiltration or misuse.
- **Encryption at Rest** – Encrypting data stored on disk or in databases.
- **Encryption in Transit** – Encrypting data while being transmitted over networks (TLS/SSL).
- **TLS (Transport Layer Security)** – Cryptographic protocol for secure communication over networks.
- **SSL (Secure Sockets Layer)** – Predecessor to TLS, now deprecated.
- **E2EE (End-to-End Encryption)** – Encryption where only communicating users can decrypt messages.

### Compliance & Governance

- **GDPR (General Data Protection Regulation)** – EU regulation for data protection and privacy.
- **HIPAA (Health Insurance Portability and Accountability Act)** – US law for protecting health information.
- **SOC 2 (Service Organization Control 2)** – Security and availability controls framework.
- **OPA (Open Policy Agent)** – Policy engine used to enforce authorization and compliance rules.
- **Audit Logging** – Recording system activities for compliance and security monitoring.

---

## AI & Machine Learning

### Core Concepts

- **LLM (Large Language Model)** – Transformer-based model trained on large text corpora (e.g., GPT, Claude).
- **RAG (Retrieval-Augmented Generation)** – Pattern where an LLM uses retrieved context at query time.
- **Fine-tuning** – Process of adapting a pre-trained model to a specific task or domain.
- **Prompt Engineering** – Crafting effective prompts to get desired outputs from LLMs.
- **Token** – Basic unit of text processed by language models (word or sub-word piece).

### ML Operations

- **MLOps** – Practices for managing ML lifecycle (training, deployment, monitoring).
- **Model Training** – Process of teaching a machine learning model from data.
- **Model Inference** – Process of using a trained model to make predictions.
- **Feature Engineering** – Creating input features from raw data for ML models.
- **Model Versioning** – Tracking different versions of ML models.

### Vector Search & Embeddings

- **Embedding** – Numerical representation of data (text, images) in vector space.
- **Vector Database** – Database optimized for storing and searching high-dimensional vectors.
- **HNSW (Hierarchical Navigable Small World)** – Graph-based ANN index for fast vector search.
- **IVF (Inverted File Index)** – Vector index that clusters embeddings into coarse cells for search.
- **KNN (k-Nearest Neighbours)** – Algorithm that finds the k closest points in a vector space.
- **ANN (Approximate Nearest Neighbour)** – Algorithm for finding approximate nearest neighbours in high-dimensional spaces.

### AI Infrastructure

- **GPU (Graphics Processing Unit)** – Parallel compute accelerator, often for ML/AI workloads.
- **TPU (Tensor Processing Unit)** – Google's custom chip optimized for ML workloads.
- **Model Serving** – Infrastructure for deploying and serving ML models in production.

---

## Monitoring & Observability

### Core Concepts

- **Observability** – Ability to understand system state from external outputs (logs, metrics, traces).
- **Monitoring** – Continuous observation of system health and performance.
- **Logging** – Recording events and activities for debugging and auditing.
- **Metrics** – Quantitative measurements of system behavior over time.
- **Tracing** – Tracking requests as they flow through distributed systems.

### Reliability Metrics

- **SLA (Service Level Agreement)** – Contracted promise of availability or performance.
- **SLO (Service Level Objective)** – Target for service reliability or performance.
- **SLI (Service Level Indicator)** – Measurable metric that indicates service quality.
- **MTTR (Mean Time To Recovery)** – Average time to restore service after an incident.
- **MTBF (Mean Time Between Failures)** – Average time between system failures.
- **Uptime** – Percentage of time a service is available and operational.
- **Availability** – Measure of system accessibility and operational status.

### Monitoring Tools & Practices

- **APM (Application Performance Monitoring)** – Monitoring application performance and user experience.
- **Distributed Tracing** – Tracking requests across multiple services in microservices architecture.
- **Health Checks** – Periodic checks to verify service health and readiness.
- **Alerting** – Notifications triggered when metrics exceed thresholds.

---

## Interview Frameworks

### Behavioral Interviews

- **STAR (Situation, Task, Action, Result)** – Framework for structuring behavioral interview answers.
  - **Situation**: Set the context and background
  - **Task**: Explain your responsibility and what needed to be accomplished
  - **Action**: Describe specific actions you took (use "I" statements)
  - **Result**: Share outcomes, impact, and lessons learned

### System Design Interviews

- **Requirements Gathering** – Clarifying functional and non-functional requirements.
- **Capacity Estimation** – Estimating system scale (users, data, traffic).
- **API Design** – Designing interfaces and contracts between components.
- **Database Design** – Designing data models, schemas, and storage strategies.
- **Scalability** – Designing systems to handle growth in users, data, or traffic.

### Technical Concepts

- **Trade-offs** – Balancing competing requirements (consistency vs. availability, latency vs. throughput).
- **Bottleneck** – Component that limits overall system performance.
- **Single Point of Failure (SPOF)** – Component whose failure would cause entire system failure.
- **Idempotency** – Property where operations can be applied multiple times without changing result.
- **Backpressure** – Mechanism to handle situations where downstream components can't keep up.

---

## Business & Project Terms

- **ROI (Return on Investment)** – Benefit or value gained relative to cost.
- **KPI (Key Performance Indicator)** – Metric that tracks success against a business goal.
- **MVP (Minimum Viable Product)** – Product with minimum features to satisfy early users.
- **Agile** – Iterative software development methodology.
- **Scrum** – Agile framework for managing complex projects.
- **Sprint** – Time-boxed iteration in Scrum (typically 1-4 weeks).

---

## Additional Useful Terms

- **SKU (Stock Keeping Unit)** – Distinct pricing/feature tier for a service or product.
- **TTL (Time To Live)** – Expiry duration for cache or stored data.
- **Idempotent** – Operation that produces same result regardless of how many times it's executed.
- **Stateless** – System or service that doesn't store client state between requests.
- **Stateful** – System or service that maintains client state between requests.
- **Idempotency Key** – Unique identifier ensuring operations are only processed once.

---

## Quick Reference

**For AI Architect Interviews**: See [AI-Architect Glossary](../AI-Architect/11_Glossary.md) for role-specific terms.

**For System Design**: See [System Design Scenarios](../SystemDesign/) for practical examples.

**For Behavioral Questions**: See [STAR Method](../02_Common/01_STAR-Method/01_STAR-Method.md) for answer framework.

---

**Related Content**:
- [Part 1-A](./01_Interview-Glossary-Part1-A.md) – System Design, Cloud, DevOps, Performance terms
- [AI Architect Glossary](../AI-Architect/11_Glossary.md) – AI/ML specific terminology
- [System Design Fundamentals](../02_Common/02_SystemDesign/) – System design concepts

