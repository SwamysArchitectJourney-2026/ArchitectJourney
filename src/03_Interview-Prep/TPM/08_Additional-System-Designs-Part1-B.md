---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["System design basics", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review system design model answers for HR attendance, meeting scheduling, and payment processing"
  - "Understand architecture patterns for calendar integration and payment systems"
  - "Prepare for TPM system design interviews"
related_topics:
  prerequisites: ["./08_Additional-System-Designs-Part1-A.md"]
  builds_upon: []
  enables: ["./08_Additional-System-Designs-Part1-C.md"]
  cross_refs: []
---

# Additional System Design Model Answers (Part 1-B)

**System design answers** for HR Attendance, Meeting Scheduling, and Payment Processing systems.

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

## 🔗 Related Documents

- [Part 1-A: Ticket Booking and URL Shortener](./08_Additional-System-Designs-Part1-A.md) - Scenarios 1-2
- [Part 1-C: Event-Driven Systems, Analytics, CI/CD](./08_Additional-System-Designs-Part1-C.md) - Scenarios 6-8
- [Part 1-D: Migration and Multi-Region](./08_Additional-System-Designs-Part1-D.md) - Scenarios 9-10
- [System Design Questions](./04_System-Design-Questions.md) - TPM-focused system design questions

