---
learning_level: "Intermediate"
prerequisites: ["./01_Database-Selection-Decision-Framework-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Evaluate trade-offs between database technologies"
  - "Design multi-database architectures for complex systems"
  - "Apply selection criteria in practical scenarios"
related_topics:
  builds_upon: ["./01_Database-Selection-Decision-Framework-Part1-A.md"]
  enables: ["./02_Additional-Storage-Types-Part1-A.md"]
---

# Database Selection Decision Framework (Part 1-B)

## Comparative Analysis

### Consistency Models

**RDBMS**: Provides strong consistency with ACID guarantees. All reads reflect the most recent committed writes.

**Document DB**: Typically offers eventual consistency. Updates propagate across replicas over time, with per-document atomicity in many implementations.

**Columnar DB**: Designed for eventual consistency. Optimized for write throughput over immediate read consistency.

### Query Capabilities

**RDBMS**: Supports complex multi-table joins, subqueries, and aggregations. Excellent for ad-hoc analytical queries.

**Document DB**: Optimized for document-based queries and flexible attribute filtering. Limited cross-document joins.

**Columnar DB**: Specialized for time-range queries and aggregations. Efficient for reading many rows across few columns.

### Scaling Strategies

**RDBMS**: Primarily vertical scaling (larger hardware) with read replicas for read scaling. Horizontal scaling requires sharding complexity.

**Document DB**: Native horizontal scaling through sharding. Can distribute documents across multiple nodes.

**Columnar DB**: Built for horizontal scaling. Data partitioned across nodes by key ranges or time windows.

### Schema Evolution

**RDBMS**: Requires explicit schema changes and migrations. Changes must be coordinated across deployments.

**Document DB**: Schema-flexible or schema-less. Documents can have different structures without migration.

**Columnar DB**: Flexible column families. Can add new columns without restructuring existing data.

---

## Multi-Database Architecture Patterns

Modern systems rarely rely on a single database type. Different data patterns and access requirements often necessitate combining multiple storage technologies.

### Pattern: Transactional + Analytical Split

**Scenario**: A retail platform needs both real-time transaction processing and historical analytics.

**Architecture**:
- **RDBMS**: Handles active transactions, inventory updates, payment processing
- **Columnar DB**: Stores completed transactions for historical analysis
- **Migration Strategy**: Move completed transactions from RDBMS to columnar storage after fulfillment

**Benefits**: Maintains transactional integrity while enabling efficient analytics on historical data.

### Pattern: Flexible Querying Layer

**Scenario**: A content platform needs to support diverse queries across user-generated content with varying structures.

**Architecture**:
- **RDBMS**: Stores core user accounts and authentication data
- **Document DB**: Stores content items with flexible metadata
- **Query Flow**: Use document DB for flexible content queries, join with RDBMS for user context

**Benefits**: Combines structured user data with flexible content storage.

### Pattern: Real-Time + Historical Analytics

**Scenario**: A logistics platform tracks vehicle locations in real-time and analyzes historical route patterns.

**Architecture**:
- **Columnar DB**: Stores continuous location updates (high write volume, time-series pattern)
- **Document DB**: Stores route summaries and metadata for flexible querying
- **RDBMS**: Manages vehicle registration and driver accounts

**Benefits**: Each database type handles its optimal use case.

---

## Practical Example: Online Learning Platform

### System Requirements

An educational platform needs to:
1. Manage course enrollments with transactional integrity
2. Store course content with varying structures
3. Track student progress over time
4. Support flexible search across courses

### Database Selection

**Enrollment Management → RDBMS (PostgreSQL)**
- Requirement: Prevent double-booking when course capacity is limited
- Solution: ACID transactions ensure only one student can claim the last available seat
- Schema: Fixed structure (student_id, course_id, enrollment_date, status)

**Course Content → Document DB (MongoDB)**
- Requirement: Courses have different metadata (video courses vs. text-based vs. interactive)
- Solution: Flexible schema accommodates varying course structures
- Example: Video courses have duration/tags, text courses have page counts, interactive courses have exercise counts

**Progress Tracking → Columnar DB (Cassandra)**
- Requirement: Continuous logging of student activity (clicks, views, completions)
- Solution: High write throughput for time-series activity data
- Pattern: Ever-increasing data as students interact with courses

**Search Functionality → Search Engine (Elasticsearch)**
- Requirement: Full-text search across course titles, descriptions, tags
- Solution: Specialized search engine for text queries
- Note: Data synced from primary stores, not primary source of truth

### Complete Architecture

```
┌──────────────────────┐
│ Enrollment System    │ → RDBMS (PostgreSQL) - ACID transactions
└──────────────────────┘
┌──────────────────────┐
│ Course Content       │ → Document DB (MongoDB) - Flexible schemas
└──────────────────────┘
┌──────────────────────┐
│ Activity Logs        │ → Columnar DB (Cassandra) - Time-series data
└──────────────────────┘
┌──────────────────────┐
│ Search Index         │ → Elasticsearch - Full-text search
└──────────────────────┘
```

---

## Selection Guidelines

1. **Start with data patterns**: Analyze structure, relationships, and growth trajectory
2. **Identify transaction needs**: Determine if ACID guarantees are required
3. **Evaluate query patterns**: Understand access patterns and query complexity
4. **Consider scale requirements**: Project data volume and growth rate
5. **Plan for combination**: Most systems benefit from multiple database types
6. **Factor in operational complexity**: Consider team expertise and infrastructure

---

## Related Topics

- [Part 1-A: Selection Framework](./01_Database-Selection-Decision-Framework-Part1-A.md)
- [Additional Storage Types](./02_Additional-Storage-Types-Part1-A.md)
- [Sharding](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#sharding)
- [Replication](../../03_Interview-Prep/01_Glossary/01_Interview-Glossary-Part1-A.md#replication)
