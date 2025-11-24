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

* Chaos testing for network/DB failures.* Canary release for payment adapters.**TPM delivery plan & teams*** Teams: Catalog & Search, Booking/Seat Management, Payments, Notifications, Ops (infra).* Sprint 0: Architecture + infra + contract APIs + capacity plan.* 3–4 sprints for MVP (browse, reserve, pay), 2 sprints for scale & hardening.**Risks & mitigations*** Race conditions on seat booking → mitigation: strict locking + DB commit patterns.* Payment failures during high load → mitigate with retry/backoff and multiple gateways.* Bots scalping → implement rate limits & CAPTCHA.**Key metrics*** Successful bookings/sec, reservation timeout rate, payment success rate, cart abandonment, mean time to recovery (MTTR).---## 2) URL Shortener (scaleable, low-latency)**Requirements*** F: Create short URL, redirect to original, analytics (clicks), custom alias, expiration.* NF: Extremely low latency, high read throughput, global availability, idempotent create.**Architecture*** API Gateway → Shortening Service → Key generation / DB (Cassandra / DynamoDB) → Cache (CDN or Redis) → Analytics pipeline (Kafka → analytics store).**Design choices*** Use Base62 or base64 url id generation; prefer collision-resistant approach:  * Option A: Sequential ID + base62 (fast, predictable)  * Option B: Hash of URL + collision resolution (better idempotency for same URL)* Use CDN edge to cache redirects for global low-latency.**Data model*** ShortURL(key, longUrl, ownerId, expireAt, createdAt)* ClickEvent(shortKey, timestamp, ip, referrer, userAgent)**APIs*** `POST /shorten {url, customAlias?, expireIn?}`* `GET /{key}` -> 302 redirect* `GET /analytics/{key}`**Scaling & HA*** Partition keys by hash, use consistent hashing.* Read-heavy: cache nearly all redirects in CDN/Redis; write path goes to DB and invalidates cache.**Analytics*** Publish events to Kafka; process via stream jobs to aggregate.**Security & Abuse*** Rate limiting, abuse detection, domain whitelist/blacklist.* Short links phishing detection (scan target URL on create).**TPM delivery*** Small team 2–3 sprints for MVP; rollout staged with telemetry.**Metrics*** Redirect latency, cache hit ratio, created-to-click ratio, malicious URL detection rate.---## 🔗 Related Documents- [Part 1-B: HR Attendance, Meeting Scheduling, Payment Processing](./08_Additional-System-Designs-Part1-B.md) - Scenarios 3-5- [Part 1-C: Event-Driven Systems, Analytics, CI/CD](./08_Additional-System-Designs-Part1-C.md) - Scenarios 6-8- [Part 1-D: Migration and Multi-Region](./08_Additional-System-Designs-Part1-D.md) - Scenarios 9-10- [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design questions
