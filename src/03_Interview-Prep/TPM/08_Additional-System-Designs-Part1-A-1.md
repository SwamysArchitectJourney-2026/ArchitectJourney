---
content_type: "interview_prep"
learning_level: "Intermediate"
  prerequisites: [

    "System design basics",
    "TPM interview preparation"]estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for ticket booking and URL shortening"
  - "Understand architecture patterns for high-concurrency systems"
  - "Prepare for TPM system design interviews"
related_topics:    prerequisites: [
]    builds_upon: [
]    enables: [

    "./08_Additional-System-Designs-Part1-B.md"]    cross_refs: [
]
---

# Additional System Design Model Answers (Part 1-A)**System design answers** for high-value TPM scenarios: Online Ticket Booking and URL Shortener.---## 1) Online Ticket Booking System (concerts, movies)**Key requirements (F / NF)*** F: Search events, select seats, reserve/hold seats, purchase, generate ticket, cancellation/refund.* NF: Strong consistency for seat inventory, high concurrency (ticket drops), low latency, payment integration, idempotency, audit trail, availability during peaks.**High-level architecture*** Client (web/mobile) → API Gateway → Booking Service (Seat manager) → Inventory DB (strong consistency) + Payment Service → Notification Service → Ticketing DB + CDN for assets.* Use Redis for seat holds with TTL, relational DB (Postgres) for transactions, message queue (Kafka/Service Bus) for async processing (emails/tickets), search index (Elasticsearch) for events.**Core components*** Seat Reservation/Locking: Redis distributed lock + DB transaction fallback.* Order Service: handles checkout, idempotency token.* Payment Adapter: integrates with multiple payment gateways.* Notification: email/SMS.* Audit & Fraud: rate limit & anomaly detection.* Event Scheduler: for pre-sales, dynamic pricing.**Sample API*** `GET /events?date=...`* `POST /events/{id}/reserve` `{userId, seatIds, holdToken}`* `POST /orders` `{reserveId, paymentMethod, idempotencyKey}`* `POST /orders/{id}/capture` (webhook from payment)**Data model (simplified)*** Events(eventId, name, venue, startTime)* Seats(seatId, eventId, row, number, status)* Reservations(resId, seatIds, userId, expiresAt, status)* Orders(orderId, reservationId, status, paymentInfo)**Workflow**1. User selects seats → call `reserve` → service locks seats in Redis + writes reservation record with TTL.2. User checks out → `orders` call including idempotency key → payment processed; on success commit reservation → mark seats sold.3. Async tasks generate ticket, send email.**Scaling & resilience*** Scale read-heavy components horizontally; use read replicas for catalog.* Partition seats by event for locks to avoid hot keys.* Use circuit breakers for payment providers; failover to backup gateways.**Consistency*** Strong for seat availability (use DB transaction on final commit).* Soft for notifications.**Security*** PCI compliance for payments (tokenize card data via gateway).* Rate limiting, bot detection (captcha), encryption at rest/in transit.**Testing / Rollout*** Stress test for peak traffic (10x expected).
