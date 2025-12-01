---
learning_level: "Intermediate"
prerequisites: ["./01_Database-Selection-Decision-Framework-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Understand trade-offs between database types"
  - "Learn when to combine multiple database types"
  - "Apply database selection in interview scenarios"
related_topics:
  builds_upon: ["./01_Database-Selection-Decision-Framework-Part1-A.md"]
  enables: ["./02_Additional-Storage-Types-Part1-A.md"]
---

# Database Selection Decision Framework (Part 1-B)

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

## Hybrid Approaches: Combining Database Types

**Critical Insight**: In real-world systems, you **must** use multiple database types to meet both functional and non-functional requirements.

This is called **polyglot persistence** - using the right tool for each job.

### Common Combinations:

- **RDBMS** for transactional data (users, orders, financial records)
- **Document DB** for flexible content (product catalogs, user preferences, content management)
- **Columnar DB** for analytics and time-series data (metrics, logs, IoT data)
- **Cache** (Redis) for frequently accessed data to reduce database load
- **Search Engine** (Elasticsearch) for full-text search capabilities
- **Blob Storage** (S3) for images, videos, and large files
- **Time-Series DB** (InfluxDB) for metrics and monitoring data
- **Data Warehouse** (Hadoop) for offline analytics and reporting

### Example Architecture:

```
┌─────────────┐
│   Users     │ → RDBMS (PostgreSQL) - ACID transactions
└─────────────┘
┌─────────────┐
│  Products   │ → Document DB (MongoDB) - Flexible schemas
└─────────────┘
┌─────────────┐
│   Metrics   │ → Time-Series DB (InfluxDB) - Time-based queries
└─────────────┘
┌─────────────┐
│   Search    │ → Search Engine (Elasticsearch) - Full-text search
└─────────────┘
┌─────────────┐
│   Images    │ → Blob Storage (S3) + CDN - Large file storage
└─────────────┘
┌─────────────┐
│   Cache     │ → Redis - Frequently accessed data
└─────────────┘
┌─────────────┐
│  Analytics  │ → Data Warehouse (Hadoop) - Offline processing
└─────────────┘
```

---

## Interview Tips

1. **Start with data characteristics**: Ask about structure, volume, and query patterns
2. **Clarify ACID requirements**: Financial systems need ACID; analytics can be eventual
3. **Consider growth**: Will data volume grow linearly or exponentially?
4. **Query patterns**: Are queries known upfront or ad-hoc?
5. **Mention trade-offs**: No single database is perfect for all use cases
6. **Propose hybrid approach**: Real systems use multiple database types
7. **Discuss NFRs**: Explain how database choice affects scalability, performance, consistency

---

## Related Topics

- [Part 1-A: Decision Tree](./01_Database-Selection-Decision-Framework-Part1-A.md)
- [Additional Storage Types](./02_Additional-Storage-Types-Part1-A.md)
- [Sharding](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#sharding)
- [Replication](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#replication)

