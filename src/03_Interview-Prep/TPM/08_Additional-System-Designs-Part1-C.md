---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for event-driven systems, analytics, and CI/CD"
  - "Understand microservices patterns and stream processing architectures"
  - "Prepare for TPM system design interviews"
related_topics:
  prerequisites: ["./08_Additional-System-Designs-Part1-B.md"]
  builds_upon: []
  enables: ["./08_Additional-System-Designs-Part1-D.md"]
  cross_refs: []
---

# Additional System Design Model Answers (Part 1-C)

**System design answers** for Event-Driven Order Management, Real-Time Analytics, and CI/CD Pipeline systems.

---

## 6) Event-Driven Order Management System (microservices)

**Requirements**

* F: Handle orders across microservices: cart, order, inventory, payment, shipping.
* NF: Loose coupling, eventual consistency, high throughput.

**Architecture**

* Use Kafka (or Azure Event Grid) as backbone. Microservices publish/subscribe to domain events.
* Services: Order Service (creates orders), Inventory Service (reserves), Payment Service, Shipping Service, Notification Service.

**Patterns**

* Saga (choreography): services react to events and publish their own events.
* Idempotency & deduplication for event handlers.

**Data model**

* Each service owns its data (per microservice DB).
* Order aggregate with status (Created → InventoryReserved → PaymentCaptured → Shipped → Completed).

**Workflow (example)**

1. Cart Checkout → Order Service emits `OrderCreated`.
2. Inventory Service consumes → reserves stock → emits `InventoryReserved` or `InventoryFailed`.
3. Payment Service consumes `InventoryReserved` → captures payment → emits `PaymentCaptured` or `PaymentFailed`.
4. On failures, compensating events (`InventoryRelease`, `OrderCancelled`) are emitted.

**Observability**

* Correlation IDs across events.
* Centralized tracing (OpenTelemetry).

**Testing**

* Contract testing (PACT), integration testing with event replay, chaos testing.

**TPM delivery**

* Domain decomposition + team ownership per service.
* Contract-first design; version APIs and events; roll out core saga flows first.

**Risks**

* Eventual consistency complicates UX (showing "Reserved" vs "Confirmed"), mitigate with clear status transitions in UI.
* Ordering of events → use event versioning and idempotent handlers.

**Metrics**

* Orders per minute, event lag, failure rate per saga, mean time to repair (for failed sagas).

---

## 7) Real-Time Data Analytics Platform (Kafka + Stream Processing)

**Requirements**

* F: Ingest streams (clicks, telemetry), process in real-time (aggregations, alerts), store materialized views, support ad-hoc queries.
* NF: Low latency (<1s for some aggregations), high throughput, fault tolerance, schema evolution.

**Architecture**

* Producers → Kafka (partitioned topics) → Stream Processing (Flink/Spark Streaming/Kafka Streams) → Serving Store (Cassandra, ClickHouse) + OLAP for batch (Snowflake/Databricks) → Dashboards (Grafana/Looker).
* Schema registry for Avro/Protobuf to manage schema evolution.

**Processing**

* Real-time aggregations (rolling windows), anomaly detection, real-time enrichments (lookup via state store).

**Data retention**

* Hot layer: last X days in log-structured DB for fast queries.
* Cold layer: S3 for long-term analytics.

**Fault tolerance**

* Kafka consumer group rebalancing, processing checkpoints, idempotent sinks.

**APIs**

* `GET /analytics/real-time?metric=ctr&window=5m`

**Security**

* Kafka ACLs, encryption in transit, role-based access to dashboards.

**Testing**

* Simulate high throughput using producer replay; test windowing correctness.

**TPM delivery**

* Teams: Ingest, Stream Processing, Serving, BI.
* Sprint 0 for infra (Kafka cluster sizing, schema registry).
* Deploy simple pipelines first (pageviews → counts), then advanced (join streams, ML models).

**Risks**

* Hot partitions → design partition keys carefully.
* Schema drift → enforce backward/forward compatibility rules.

**Metrics**

* Throughput (msgs/sec), processing lag, end-to-end latency, data loss (zero tolerance).

---

## 8) Scalable CI/CD Pipeline for 50+ Microservices

**Requirements**

* F: Reliable automated builds, tests, security scans, deploys; fast feedback; isolation per service; shared components.
* NF: Scalable parallel builds, reproducible artifacts, traceable promotions.

**Architecture & components**

* Source code repos (mono-repo or many repos) → CI runner pool (k8s or self-hosted runners) → Build cache (artifact storage e.g., Nexus/Artifactory) → Test stages (unit, integration, contract) → Security scans (SCA/ SAST) → CD orchestrator (ArgoCD/Spinnaker) → Environment namespaces per team.

**Design choices**

* Prefer **trunk-based development** with feature flags.
* Shared pipeline templates (YAML) for consistency.
* Use ephemeral test environments (review apps) via namespaces.

**Optimizations**

* Build cache & incremental builds.
* Parallel test execution per PR.
* Selective pipeline execution (only affected services).

**Observability**

* Pipeline dashboards, SLAs for build times, failure rates.

**Security**

* Secrets in vault, image signing, policy-as-code.

**TPM delivery**

* Phase 1: infra + shared pipeline templates + 10 pilot services.
* Phase 2: rollout to all services + performance tuning.

**Risks**

* CI congestion → scale runners, prioritize pipelines.
* Flaky tests → quarantine, test stability metrics.

**Metrics**

* Mean time to feedback, build queue time, pipeline success rate, deployment frequency.

---

## 🔗 Related Documents

- [Part 1-A: Ticket Booking and URL Shortener](./08_Additional-System-Designs-Part1-A.md) - Scenarios 1-2
- [Part 1-B: HR Attendance, Meeting Scheduling, Payment Processing](./08_Additional-System-Designs-Part1-B.md) - Scenarios 3-5
- [Part 1-D: Migration and Multi-Region](./08_Additional-System-Designs-Part1-D.md) - Scenarios 9-10
- [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design questions

