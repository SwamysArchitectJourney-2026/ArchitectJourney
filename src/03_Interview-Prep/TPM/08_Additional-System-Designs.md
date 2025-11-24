---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review 10 complete system design model answers"
  - "Understand architecture patterns for common scenarios"
  - "Prepare for TPM system design interviews"
related_topics:
  prerequisites: []
  builds_upon: []
  enables: []
  cross_refs: []
---

# Additional System Design Model Answers (10 Scenarios)

**Complete system design answers** for 10 high-value TPM scenarios covering online ticketing, payment systems, analytics, migrations, CI/CD, and more.

---

## 1) Online Ticket Booking System (concerts, movies)

**Key requirements (F / NF)**

* F: Search events, select seats, reserve/hold seats, purchase, generate ticket, cancellation/refund.
* NF: Strong consistency for seat inventory, high concurrency (ticket drops), low latency, payment integration, idempotency, audit trail, availability during peaks.

**High-level architecture**

* Client (web/mobile) → API Gateway → Booking Service (Seat manager) → Inventory DB (strong consistency) + Payment Service → Notification Service → Ticketing DB + CDN for assets.
* Use Redis for seat holds with TTL, relational DB (Postgres) for transactions, message queue (Kafka/Service Bus) for async processing (emails/tickets), search index (Elasticsearch) for events.

**Core components**

* Seat Reservation/Locking: Redis distributed lock + DB transaction fallback.
* Order Service: handles checkout, idempotency token.
* Payment Adapter: integrates with multiple payment gateways.
* Notification: email/SMS.
* Audit & Fraud: rate limit & anomaly detection.
* Event Scheduler: for pre-sales, dynamic pricing.

**Sample API**

* `GET /events?date=...`
* `POST /events/{id}/reserve` `{userId, seatIds, holdToken}`
* `POST /orders` `{reserveId, paymentMethod, idempotencyKey}`
* `POST /orders/{id}/capture` (webhook from payment)

**Data model (simplified)**

* Events(eventId, name, venue, startTime)
* Seats(seatId, eventId, row, number, status)
* Reservations(resId, seatIds, userId, expiresAt, status)
* Orders(orderId, reservationId, status, paymentInfo)

**Workflow**

1. User selects seats → call `reserve` → service locks seats in Redis + writes reservation record with TTL.
2. User checks out → `orders` call including idempotency key → payment processed; on success commit reservation → mark seats sold.
3. Async tasks generate ticket, send email.

**Scaling & resilience**

* Scale read-heavy components horizontally; use read replicas for catalog.
* Partition seats by event for locks to avoid hot keys.
* Use circuit breakers for payment providers; failover to backup gateways.

**Consistency**

* Strong for seat availability (use DB transaction on final commit).
* Soft for notifications.

**Security**

* PCI compliance for payments (tokenize card data via gateway).
* Rate limiting, bot detection (captcha), encryption at rest/in transit.

**Testing / Rollout**

* Stress test for peak traffic (10x expected).
* Chaos testing for network/DB failures.
* Canary release for payment adapters.

**TPM delivery plan & teams**

* Teams: Catalog & Search, Booking/Seat Management, Payments, Notifications, Ops (infra).
* Sprint 0: Architecture + infra + contract APIs + capacity plan.
* 3–4 sprints for MVP (browse, reserve, pay), 2 sprints for scale & hardening.

**Risks & mitigations**

* Race conditions on seat booking → mitigation: strict locking + DB commit patterns.
* Payment failures during high load → mitigate with retry/backoff and multiple gateways.
* Bots scalping → implement rate limits & CAPTCHA.

**Key metrics**

* Successful bookings/sec, reservation timeout rate, payment success rate, cart abandonment, mean time to recovery (MTTR).

---

## 2) URL Shortener (scaleable, low-latency)

**Requirements**

* F: Create short URL, redirect to original, analytics (clicks), custom alias, expiration.
* NF: Extremely low latency, high read throughput, global availability, idempotent create.

**Architecture**

* API Gateway → Shortening Service → Key generation / DB (Cassandra / DynamoDB) → Cache (CDN or Redis) → Analytics pipeline (Kafka → analytics store).

**Design choices**

* Use Base62 or base64 url id generation; prefer collision-resistant approach:
  * Option A: Sequential ID + base62 (fast, predictable)
  * Option B: Hash of URL + collision resolution (better idempotency for same URL)
* Use CDN edge to cache redirects for global low-latency.

**Data model**

* ShortURL(key, longUrl, ownerId, expireAt, createdAt)
* ClickEvent(shortKey, timestamp, ip, referrer, userAgent)

**APIs**

* `POST /shorten {url, customAlias?, expireIn?}`
* `GET /{key}` -> 302 redirect
* `GET /analytics/{key}`

**Scaling & HA**

* Partition keys by hash, use consistent hashing.
* Read-heavy: cache nearly all redirects in CDN/Redis; write path goes to DB and invalidates cache.

**Analytics**

* Publish events to Kafka; process via stream jobs to aggregate.

**Security & Abuse**

* Rate limiting, abuse detection, domain whitelist/blacklist.
* Short links phishing detection (scan target URL on create).

**TPM delivery**

* Small team 2–3 sprints for MVP; rollout staged with telemetry.

**Metrics**

* Redirect latency, cache hit ratio, created-to-click ratio, malicious URL detection rate.

---

## 3) HR Attendance System (simple, accurate)

**Requirements**

* F: Clock-in/out, timesheets, leave requests, reports.
* NF: Accuracy, auditability, offline support (mobile), multi-timezones.

**Architecture**

* Client apps (mobile/web) → API → Auth Service (SSO/LDAP) → Attendance Service → Database (Postgres) + Event logs → Reporting Service.

**Core features**

* Geo-fencing (optional), device authentication, offline sync (device stores encrypted logs then syncs).

**Data model**

* Attendance(userId, timestamp, type, deviceId, location)
* Timesheet(userId, periodStart, periodEnd, totalHours)
* Leave(leaveId, userId, startDate, endDate, status)

**APIs**

* `POST /attendance {userId, type, timestamp, location}`
* `GET /timesheet?userId=&period=`

**Consistency & audit**

* Write-ahead log (append-only) for tamper-evidence, retention for audits.

**Security**

* Encrypt PII, role-based access, strong auth, change audit trail.

**TPM delivery**

* 3 sprints: core clock-in/out + timesheets + reporting.
* Integrate with payroll in later sprint.

**Risks**

* Time spoofing → mitigations: device attestation, location verification, random checks.

**Metrics**

* Sync success rate, data latency, approval cycle time.

---

## 4) Meeting Scheduling Application (calendar + availability + invites)

**Requirements**

* F: Find mutual availability, book meeting, send invites, integrate calendars (Google/Outlook), reschedule, timezones, meeting types.
* NF: Accuracy, low latency, calendar sync reliability.

**Architecture**

* Web/mobile app → Scheduling API → Calendar Connector Service (OAuth tokens) → Availability Service (cache) → Booking Service → Notification Service.

**Core flows**

* Availability query: aggregate busy slots from linked calendars (cached with TTL).
* Booking: create event in both organizer & attendees' calendars via connectors; confirm success.

**Data model**

* CalendarToken(userId, provider, refreshToken)
* Meeting(meetingId, organizer, attendees, start, end, status)

**APIs**

* `GET /availability?users=[ids]&range=`
* `POST /meetings {organizer, attendees, slot}`

**Scaling**

* Cache availability; prefetch for frequent users; use background jobs for token refresh.

**Edge cases**

* Conflicting concurrent bookings → optimistic concurrency plus retry/resolution UI.

**Security**

* OAuth token security, scope-limited tokens, least privilege.

**TPM delivery**

* Integrations are biggest risk: schedule milestones for each connector (Google, MS Graph).

**Metrics**

* Booking success rate, calendar sync failure rate, time to sync.

---

## 5) Distributed Payment Processing System (high reliability)

**Requirements**

* F: Accept payments, support multiple gateways, reconciliation, refunds, refunds idempotency, settlement.
* NF: PCI scope minimization, high reliability, audit, eventual consistency for settlements.

**Architecture**

* Client → Order Service → Payment Orchestrator → Gateway Adapters (Stripe/PayPal/Bank) → Clearing/Settlement Service → Accounting DB.
* Use asynchronous workflows via message broker; state machine (workflow engine) for payment lifecycle.

**Core components**

* Payment Orchestrator: centralizes flows, retries, timeouts, compensations.
* Gateway Adapters: encapsulate provider specifics.
* Reconciliation Service: matches settlement files from banks, marks completed.
* Ledger/Accounting: immutable ledger for audit.

**Design patterns**

* Saga pattern for multi-step payments (authorize → capture → settle) with compensating actions (refund) if partially failed.
* Idempotency keys across payment operations.

**APIs**

* `POST /payments {orderId, amount, method, idempotencyKey}`
* `POST /payments/{id}/refund {amount, reason}`

**Security & Compliance**

* Use tokenization; never store card numbers; redirect to gateway-hosted pages or use client-side tokenization.
* PCI-DSS scope reduction via hosted fields.

**Resilience**

* Retry logic with exponential backoff; fallback gateways; circuit breakers.

**Testing & Rollout**

* Mock payment provider for end-to-end test; run test settlement cycles; reconcile with test banks.

**TPM delivery**

* Large cross-functional effort: payments team, accounting, legal/compliance; start with single gateway, then add others.

**Risks**

* Settlement mismatches → robust reconciliation and alerts.
* Chargebacks/fraud → fraud detection pipeline.

**Metrics**

* Payment success rate, average payment latency, reconciliation lag, failed refunds.

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

## 9) Monolith → Microservices Migration (strategy + plan)

**Goal**

* Decompose monolith into services while minimizing user impact and delivery risk.

**Strategy options**

* Strangler Fig Pattern: incrementally replace parts with services.
* Vertical slice by business capability.
* Database decomposition: introduce service-owned data stores; use anti-corruption layers.

**Phased plan**

1. Discovery & domain modeling (identify bounded contexts).
2. Create infra foundation (CI/CD, service mesh).
3. Implement APIs/Contracts for next slices.
4. Extract services for one capability (e.g., auth, payments).
5. Use adapters to maintain compatibility.
6. Incrementally migrate traffic; monitor.

**Key technical choices**

* Use API gateway and service mesh (Istio) for traffic management, retries, observability.
* Introduce event bus for async integration where needed.

**Testing**

* Contract testing, end-to-end tests, canary deployments for extracted services.

**TPM delivery**

* Multi-year roadmap with milestones, risk register, migration playbooks.
* Governance: ADRs, architecture review, standards.

**Risks**

* Data consistency → prefer event-driven updates with eventual consistency; use sagas when needed.
* Team bandwidth → stagger migration, provide platform teams.

**Metrics**

* Number of services extracted, deployment frequency per service, incident rate during/after migration.

---

## 10) Global High-Availability Multi-Region Failover

**Requirements**

* F: Application must work even if one region fails; data locality and GDPR concerns.
* NF: Low RTO/RPO (define), low latency for users worldwide.

**Architecture**

* Active-active or active-passive multi-region architecture.
* Use CDN (CloudFront) + global API gateway.
* Databases: multi-region DB (e.g., Cosmos DB, Spanner) or primary-secondary with async replication and conflict resolution.
* Use traffic manager (DNS + health checks) for failover.

**Data strategy**

* For strongly consistent data: use global DB with multi-master (if available) or designate regional writes.
* For eventual consistency: use event log replication.

**Resilience**

* Cross-region load balancing, health checks, automated failover playbooks, runbooks for DB failover.

**Testing**

* Regular DR drills, runbooks, and failover rehearsals (simulate outages).

**TPM delivery**

* CapEx/Ops planning, SLA definitions, phased rollouts (pilot regions).

**Risks**

* Split brain in multi-master DB → use quorum-based approaches and conflict resolution policies.
* Data sovereignty → implement per-region data partitions.

**Metrics**

* RTO/RPO compliance, cross-region replication lag, failover time, error rate during failover.

---

## 🔗 Related Documents

* [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design questions
* [Interview Overview](./01_Interview-Overview.md) - Complete interview structure
* [Interview Cheatsheet](./09_Interview-Cheatsheet.md) - Quick reference guide
