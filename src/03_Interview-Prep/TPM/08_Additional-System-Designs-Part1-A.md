---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for ticket booking and URL shortening"
  - "Understand architecture patterns for high-concurrency systems"
  - "Prepare for TPM system design interviews"
related_topics:
  prerequisites: []
  builds_upon: []
  enables: ["./08_Additional-System-Designs-Part1-B.md"]
  cross_refs: []
---

# Additional System Design Model Answers (Part 1-A)

**System design answers** for high-value TPM scenarios: Online Ticket Booking and URL Shortener.

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

## 🔗 Related Documents

- [Part 1-B: HR Attendance, Meeting Scheduling, Payment Processing](./08_Additional-System-Designs-Part1-B.md) - Scenarios 3-5
- [Part 1-C: Event-Driven Systems, Analytics, CI/CD](./08_Additional-System-Designs-Part1-C.md) - Scenarios 6-8
- [Part 1-D: Migration and Multi-Region](./08_Additional-System-Designs-Part1-D.md) - Scenarios 9-10
- [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design questions

