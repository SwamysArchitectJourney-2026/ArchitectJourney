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

# Additional System Design Model Answers (Part 1-B)**System design answers** for HR Attendance, Meeting Scheduling, and Payment Processing systems.---## 3) HR Attendance System (simple, accurate)**Requirements*** F: Clock-in/out, timesheets, leave requests, reports.* NF: Accuracy, auditability, offline support (mobile), multi-timezones.**Architecture*** Client apps (mobile/web) → API → Auth Service (SSO/LDAP) → Attendance Service → Database (Postgres) + Event logs → Reporting Service.**Core features*** Geo-fencing (optional), device authentication, offline sync (device stores encrypted logs then syncs).**Data model*** Attendance(userId, timestamp, type, deviceId, location)* Timesheet(userId, periodStart, periodEnd, totalHours)* Leave(leaveId, userId, startDate, endDate, status)**APIs*** `POST /attendance {userId, type, timestamp, location}`* `GET /timesheet?userId=&period=`**Consistency & audit*** Write-ahead log (append-only) for tamper-evidence, retention for audits.**Security*** Encrypt PII, role-based access, strong auth, change audit trail.**TPM delivery*** 3 sprints: core clock-in/out + timesheets + reporting.* Integrate with payroll in later sprint.**Risks*** Time spoofing → mitigations: device attestation, location verification, random checks.**Metrics*** Sync success rate, data latency, approval cycle time.---## 4) Meeting Scheduling Application (calendar + availability + invites)**Requirements*** F: Find mutual availability, book meeting, send invites, integrate calendars (Google/Outlook), reschedule, timezones, meeting types.* NF: Accuracy, low latency, calendar sync reliability.**Architecture*** Web/mobile app → Scheduling API → Calendar Connector Service (OAuth tokens) → Availability Service (cache) → Booking Service → Notification Service.**Core flows*** Availability query: aggregate busy slots from linked calendars (cached with TTL).* Booking: create event in both organizer & attendees' calendars via connectors; confirm success.**Data model*** CalendarToken(userId, provider, refreshToken)
