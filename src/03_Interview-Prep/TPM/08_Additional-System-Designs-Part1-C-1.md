---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: [
"System design basics", "TPM interview preparation"
]
estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for event-driven systems, analytics, and CI/CD"
  - "Understand microservices patterns and stream processing architectures"
  - "Prepare for TPM system design interviews"
related_topics:  
prerequisites: [
"./08_Additional-System-Designs-Part1-B.md"
]  builds_upon: [

]  enables: [
"./08_Additional-System-Designs-Part1-D.md"
]  cross_refs: [

]
---

# Additional System Design Model Answers (Part 1-C)**System design answers** for Event-Driven Order Management, Real-Time Analytics, and CI/CD Pipeline systems.---## 6) Event-Driven Order Management System (microservices)**Requirements*** F: Handle orders across microservices: cart, order, inventory, payment, shipping.* NF: Loose coupling, eventual consistency, high throughput.**Architecture*** Use Kafka (or Azure Event Grid) as backbone. Microservices publish/subscribe to domain events.* Services: Order Service (creates orders), Inventory Service (reserves), Payment Service, Shipping Service, Notification Service.**Patterns*** Saga (choreography): services react to events and publish their own events.* Idempotency & deduplication for event handlers.**Data model*** Each service owns its data (per microservice DB).* Order aggregate with status (Created → InventoryReserved → PaymentCaptured → Shipped → Completed).**Workflow (example)**1. Cart Checkout → Order Service emits `OrderCreated`.2. Inventory Service consumes → reserves stock → emits `InventoryReserved` or `InventoryFailed`.3. Payment Service consumes `InventoryReserved` → captures payment → emits `PaymentCaptured` or `PaymentFailed`.4. On failures, compensating events (`InventoryRelease`, `OrderCancelled`) are emitted.**Observability*** Correlation IDs across events.* Centralized tracing (OpenTelemetry).**Testing*** Contract testing (PACT), integration testing with event replay, chaos testing.**TPM delivery*** Domain decomposition + team ownership per service.* Contract-first design; version APIs and events; roll out core saga flows first.**Risks*** Eventual consistency complicates UX (showing "Reserved" vs "Confirmed"), mitigate with clear status transitions in UI.* Ordering of events → use event versioning and idempotent handlers.**Metrics*** Orders per minute, event lag, failure rate per saga, mean time to repair (for failed sagas).---## 7) Real-Time Data Analytics Platform (Kafka + Stream Processing)**Requirements*** F: Ingest streams (clicks, telemetry), process in real-time (aggregations, alerts), store materialized views, support ad-hoc queries.* NF: Low latency (<1s for some aggregations), high throughput, fault tolerance, schema evolution.**Architecture*** Producers → Kafka (partitioned topics) → Stream Processing (Flink/Spark Streaming/Kafka Streams) → Serving Store (Cassandra, ClickHouse) + OLAP for batch (Snowflake/Databricks) → Dashboards (Grafana/Looker).* Schema registry for Avro/Protobuf to manage schema evolution.**Processing**
