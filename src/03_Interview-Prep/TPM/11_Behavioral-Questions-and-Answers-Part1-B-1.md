---
content_type: "interview_prep"
learning_level: "Intermediate"
prerequisites: ["STAR method", "TPM interview preparation"]
estimated_time: "25 minutes"
learning_objectives:
  - "Review STAR answers for technical decisions, incidents, and cross-team management"
  - "Understand behavioral interview patterns for mid-level TPM roles"
  - "Prepare for behavioral interview rounds"
related_topics:
  prerequisites: ["./11_Behavioral-Questions-and-Answers-Part1-A.md"]
  builds_upon: []
  enables: ["./11_Behavioral-Questions-and-Answers-Part1-B-2.md"]
  cross_refs: []
---

# TPM Behavioral Interview Questions and Answers (Part 1-B)

**STAR answers for Technical Decision-Making, Incident Management, and Cross-Team Collaboration** for Technical Project Manager interviews.

---

## ✅ Category 2: Technical Decision-Making (6 STAR Answers)

### ⭐ 9. Tell me about a time you influenced a technical decision.

**S:** Dev team wanted to rewrite a module; would take 3 months.  
**T:** Evaluate objectively.  
**A:** Proposed targeted refactor + caching + DB index changes.  
**R:** Achieved **70% performance improvement** in 3 weeks, no rewrite needed.

---

### ⭐ 10. Tell me about a time you made a trade-off between speed and quality.

**S:** Hard launch deadline for a new loan calculator.  
**T:** Maintain delivery without compromising critical quality.  
**A:** Removed non-critical features, kept core logic robust, added post-release plan.  
**R:** Delivered on time with **0 P1 bugs**.

---

### ⭐ 11. Tell me about a time you solved a complex technical problem.

**S:** API latency was high (1.8s).  
**T:** Reduce latency for customer experience.  
**A:** Profiling → found inefficient LINQ queries + missing DB indexes.  
**R:** Reduced latency from **1.8s → 200ms**.

---

### ⭐ 12. Tell me about a system you redesigned.

**S:** Monolithic reporting service was slow and expensive.  
**T:** Modernize.  
**A:** Moved to materialized views + Redis + archival strategy.  
**R:** Costs reduced **₹2 lakh/month**, performance improved **10x**.

---

### ⭐ 13. Tell me about a time you challenged a design decision.

**S:** Team proposed synchronous API chaining for order flow.  
**T:** Prevent cascading failures.  
**A:** Proposed event-driven model using message broker + saga.  
**R:** Improved fault tolerance; system handled **5x** load seamlessly.

---

### ⭐ 14. Tell me about a time technical debt caused issues.

**S:** Legacy codebase had no tests; new features broke existing functionality.  
**T:** Prevent regression.  
**A:** Introduced unit test coverage targets + integration tests + CI gates.  
**R:** Defect leakage reduced by **80%**; confidence in releases increased.

---

## 🔗 Related Documents

- [Part 1-B-2: Incident and Cross-Team Management](./11_Behavioral-Questions-and-Answers-Part1-B-2.md) - Categories 3-4
- [Part 1-A-1: Questions by Category](./11_Behavioral-Questions-and-Answers-Part1-A-1.md) - Behavioral questions organized by category

## ✅ Category 3: Incident / Outage Management (6 STAR Answers)

### ⭐ 15. Tell me about a production outage you handled.

**S:** Payment gateway went down during peak hours.  
**T:** Restore service quickly.  
**A:** Activated war room, identified root cause (DB connection pool exhaustion), scaled DB, added circuit breaker.  
**R:** Service restored in **45 minutes**; prevented recurrence with monitoring.

---

