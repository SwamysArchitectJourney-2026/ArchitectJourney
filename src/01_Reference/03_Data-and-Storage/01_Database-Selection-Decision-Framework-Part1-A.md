---
learning_level: "Intermediate"
prerequisites: []
estimated_time: "15 minutes"
learning_objectives:
  - "Understand when to choose RDBMS vs Document DB vs Columnar DB"
  - "Apply a decision tree framework for database selection"
  - "Recognize the impact of database choice on non-functional requirements"
related_topics:
  builds_upon: []
  enables: ["./01_Database-Selection-Decision-Framework-Part1-B.md"]
---

# Database Selection Decision Framework (Part 1-A)

## Overview

This decision framework helps you choose the right database type based on your data characteristics and requirements. **Critical insight**: While databases don't affect functional requirements, they significantly influence non-functional aspects like scalability, query patterns, and data structure.

Use this as a systematic approach during system design interviews and real-world architecture decisions.

## Impact on Non-Functional Requirements

**Key Principle**: Database selection primarily affects **non-functional requirements (NFRs)**, not functional ones.

### NFRs Affected by Database Choice:

- **Scalability**: How well the system handles growth
- **Query Patterns**: Performance characteristics of different query types
- **Data Structure**: How data is organized and accessed
- **Consistency**: ACID vs eventual consistency trade-offs
- **Availability**: High availability and fault tolerance
- **Performance**: Read/write throughput and latency

---

## Decision Tree

```
                    ┌─────────────────────┐
                    │  Structured Data?   │
                    └──────────┬──────────┘
                               │
                    ┌──────────┴──────────┐
                    │                     │
                   Yes                   No
                    │                     │
                    ▼                     │
          ┌─────────────────┐            │
          │  Need ACID?     │            │
          └────────┬────────┘            │
                   │                     │
                  Yes                    │
                   │                     │
                   ▼                     │
          ┌─────────────────┐           │
          │     RDBMS        │           │
          │ MySQL, Oracle,   │           │
          │ SQL Server,      │           │
          │ Postgres         │           │
          └─────────────────┘           │
                                        │
                    ┌───────────────────┴───────────────────┐
                    │                                       │
                    ▼                                       ▼
        ┌───────────────────────────┐    ┌──────────────────────────────┐
        │ ++ Data Types             │    │ Ever Increasing Data          │
        │ ++ Queries                │    │ + Finite Queries              │
        └───────────┬───────────────┘    └──────────────┬───────────────┘
                    │                                   │
                   Yes                                  Yes
                    │                                   │
                    ▼                                   ▼
        ┌───────────────────────────┐    ┌──────────────────────────────┐
        │    Document DB             │    │      Columnar DB             │
        │ MongoDB, Couchbase         │    │ Cassandra, HBase             │
        └───────────────────────────┘    └──────────────────────────────┘
```

---

## Decision Paths Explained

### Path 1: Structured Data → Need ACID → RDBMS

**When to choose:**

- Your data has a well-defined schema (tables, rows, columns)
- You need ACID guarantees (Atomicity, Consistency, Isolation, Durability)
- You require complex joins and relational queries
- Data integrity and referential integrity are critical

**Examples:**

- Financial transactions
- User accounts and authentication
- E-commerce orders and inventory
- Content management systems with relationships

**Technologies:**

- MySQL
- Oracle
- SQL Server
- PostgreSQL

---

### Path 2: Unstructured Data → Many Data Types + Many Queries → Document DB

**When to choose:**

- Your data is semi-structured or unstructured
- You have diverse data types (JSON, nested objects, arrays)
- You need flexible schemas that evolve over time
- Query patterns vary significantly
- You don't need complex joins across documents

**Examples:**

- User profiles with varying attributes
- Product catalogs with different structures
- Content management (blogs, articles)
- Real-time analytics dashboards

**Technologies:**

- MongoDB
- Couchbase
- Amazon DocumentDB
- Azure Cosmos DB (Document API)

---

### Path 3: Unstructured Data → Ever Increasing Data + Finite Queries → Columnar DB

**When to choose:**

- Your data volume is continuously growing (time-series, logs, events)
- You have a limited set of query patterns (analytical queries)
- You need high write throughput
- Queries typically read many rows but few columns
- You can tolerate eventual consistency

**Examples:**

- IoT sensor data
- Application logs and metrics
- Time-series analytics
- Event streaming and analytics
- Large-scale data warehousing

**Technologies:**

- Apache Cassandra
- Apache HBase
- Amazon DynamoDB (with appropriate key design)
- Azure Cosmos DB (Cassandra API)

---

## Related Topics

- [Part 1-B: Considerations & Hybrid Approaches](./01_Database-Selection-Decision-Framework-Part1-B.md)
- [ACID Properties](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#acid)
- [CAP Theorem](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#cap-theorem)

