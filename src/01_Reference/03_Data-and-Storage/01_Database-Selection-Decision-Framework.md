---
learning_level: "Intermediate"
prerequisites: []
estimated_time: "15 minutes"
learning_objectives:
  - "Understand when to choose RDBMS vs Document DB vs Columnar DB"
  - "Apply a decision tree framework for database selection"
  - "Recognize the trade-offs between different database types"
related_topics:
  builds_upon: []
  enables: []
---

# Database Selection Decision Framework

## Overview

This decision framework helps you choose the right database type based on your data characteristics and requirements. Use this as a systematic approach during system design interviews and real-world architecture decisions.

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

## Key Considerations

### ACID Requirements

- **RDBMS**: Strong ACID guarantees, perfect for transactional data
- **Document DB**: Limited ACID (often per-document), eventual consistency
- **Columnar DB**: Eventual consistency, optimized for write-heavy workloads

### Query Patterns

- **RDBMS**: Complex joins, aggregations, ad-hoc queries
- **Document DB**: Document-based queries, flexible filtering
- **Columnar DB**: Analytical queries, aggregations over large datasets

### Scalability

- **RDBMS**: Vertical scaling (bigger machines) or read replicas
- **Document DB**: Horizontal scaling, sharding by document
- **Columnar DB**: Horizontal scaling, partition by time/range

### Schema Flexibility

- **RDBMS**: Fixed schema, requires migrations
- **Document DB**: Schema-less or schema-flexible
- **Columnar DB**: Schema-flexible, column families

---

## Hybrid Approaches

In real-world systems, you often use multiple database types:

- **RDBMS** for transactional data (users, orders)
- **Document DB** for flexible content (product catalogs, user preferences)
- **Columnar DB** for analytics and time-series data (metrics, logs)

This is called **polyglot persistence** - using the right tool for each job.

---

## Interview Tips

1. **Start with data characteristics**: Ask about structure, volume, and query patterns
2. **Clarify ACID requirements**: Financial systems need ACID; analytics can be eventual
3. **Consider growth**: Will data volume grow linearly or exponentially?
4. **Query patterns**: Are queries known upfront or ad-hoc?
5. **Mention trade-offs**: No single database is perfect for all use cases

---

## Related Topics

- [ACID Properties](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#acid)
- [CAP Theorem](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#cap-theorem)
- [Sharding](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#sharding)
- [Replication](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#replication)
