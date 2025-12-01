---
learning_level: "Intermediate"
prerequisites: ["./02_Additional-Storage-Types-Part1-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Understand when to use time-series databases"
  - "Learn about data warehouses for offline analytics"
  - "Recognize the role of specialized storage in system design"
related_topics:
  builds_upon: ["./02_Additional-Storage-Types-Part1-A.md"]
  enables: []
---

# Additional Storage Types (Part 1-B)

## 4. Time-Series Databases

### Purpose

Specialized databases for tracking metrics, events, and data points over time. Think of time-series databases as an extension of relational databases with specific optimizations for time-based data patterns.

**Use Cases**: Building systems like Graphite, Grafana, or Prometheus for application metrics tracking (throughput, CPU utilization, latencies).

### When to Use

- **Metrics collection**: Application metrics, system performance data
- **IoT sensor data**: Temperature, pressure, location tracking
- **Financial data**: Stock prices, trading volumes over time
- **Monitoring**: Server health, network traffic, user activity
- **Event tracking**: User actions, system events with timestamps
- **Real-time analytics**: Dashboards showing trends over time

### Key Characteristics

- **Time-indexed**: Data is organized by timestamp
- **Append-only write mode**: Sequential writes only (T1, T2, T3... where T3 > T2 > T1)
  - **No random updates**: You never update old records
  - **No random reads**: Queries are time-range based, not point lookups
- **Bulk read queries**: Read queries are for time ranges (last few minutes/hours/days), not individual records
- **High write throughput**: Optimized for continuous data ingestion
- **Efficient compression**: Time-series data compresses well
- **Time-based queries**: Efficient range queries, aggregations by time
- **Retention policies**: Automatic data expiration/archival
- **Downsampling**: Aggregate old data to reduce storage

### Technologies

#### InfluxDB

- **Purpose-built**: Designed specifically for time-series data
- **SQL-like query language**: InfluxQL for familiar querying
- **High performance**: Handles millions of data points per second
- **Retention policies**: Automatic data lifecycle management
- **Continuous queries**: Real-time aggregations and transformations
- **Tag-based indexing**: Efficient filtering by tags (metadata)

#### OpenTSDB

- **Built on HBase**: Leverages HBase for storage
- **Scalable**: Handles billions of data points
- **Tag-based**: Flexible tagging system for metadata
- **HTTP API**: RESTful interface for data ingestion and queries
- **Grafana integration**: Works well with visualization tools

### Use Cases

- **Application monitoring**: CPU, memory, request rates
- **Infrastructure metrics**: Server health, network performance
- **Business metrics**: Sales, user growth, conversion rates
- **IoT applications**: Sensor data from devices
- **Financial trading**: Price and volume data

### Example Query Pattern

```sql
-- InfluxDB example: Average CPU usage per hour
SELECT mean("cpu_usage") 
FROM "server_metrics" 
WHERE time > now() - 24h 
GROUP BY time(1h), "server_id"
```

---

## 5. Data Warehouses

### Purpose

Large-scale storage and processing systems for offline analytics, reporting, and business intelligence. Store all company information for various analytics requirements.

**Use Cases**: 
- Amazon/Uber - Analytics on all transactions (orders, revenues, geographies, most popular items)
- Company-wide analytics and reporting
- **Not for transactional systems** - Used for **offline reporting**

### When to Use

- **Company-wide analytics**: Store all company data for analytics
- **Offline reporting**: Generate reports on historical data (not real-time transactions)
- **Business intelligence**: How many orders, revenue by geography, most popular items
- **Historical analysis**: Long-term trend analysis
- **Data mining**: Discovering patterns in large datasets
- **ETL pipelines**: Extract data from transactional systems, Transform, Load into warehouse
- **Batch processing**: Processing large volumes of data offline
- **Data lake**: Storing raw, unstructured data for future analysis

### Key Characteristics

- **Columnar storage**: Optimized for analytical queries
- **Massively parallel processing**: Process data across many nodes
- **Batch-oriented**: Designed for large batch jobs, not real-time
- **Schema-on-read**: Flexible schema for diverse data types
- **Cost-effective**: Store large volumes at low cost
- **Scalable**: Handle petabytes of data

### Technology: Hadoop Ecosystem

**Apache Hadoop** is a framework for distributed storage and processing:

#### Core Components

- **HDFS (Hadoop Distributed File System)**: Distributed file storage
- **MapReduce**: Batch processing framework
- **YARN**: Resource management and job scheduling

#### Related Technologies

- **Hive**: SQL-like interface for Hadoop (data warehouse)
- **Spark**: Fast, in-memory processing engine
- **HBase**: NoSQL database on top of HDFS
- **Pig**: High-level scripting for data processing
- **Impala**: Fast SQL queries on Hadoop

### Modern Alternatives

- **Snowflake**: Cloud-native data warehouse
- **BigQuery** (Google): Serverless data warehouse
- **Redshift** (AWS): Managed data warehouse
- **Azure Synapse**: Analytics service with data warehouse
- **Databricks**: Unified analytics platform

### Use Cases

- **Business reporting**: Monthly sales reports, financial analysis
- **Customer analytics**: User behavior analysis, segmentation
- **Product analytics**: Feature usage, A/B test results
- **Data science**: Training machine learning models
- **Compliance**: Long-term data retention for regulatory requirements

### Architecture Pattern

```
┌──────────┐     ┌──────────┐     ┌──────────┐     ┌──────────┐
│  OLTP    │────▶│   ETL   │────▶│ Data     │────▶│  BI      │
│ Database │     │ Process │     │ Warehouse│     │ Tools    │
└──────────┘     └──────────┘     └──────────┘     └──────────┘
(Real-time)      (Batch)          (Analytics)      (Reports)
```

**Flow**: Extract from operational databases → Transform and clean → Load into warehouse → Query for analytics

---

## Summary: Complete Storage Stack

A production system typically uses multiple storage types:

1. **RDBMS**: Transactional data (users, orders)
2. **Document DB**: Flexible content (products, profiles)
3. **Columnar DB**: High-volume analytics (logs, events)
4. **Cache (Redis)**: Frequently accessed data
5. **Blob Storage (S3)**: Images, videos, files
6. **CDN**: Fast content delivery
7. **Search (Elasticsearch)**: Full-text search
8. **Time-Series (InfluxDB)**: Metrics and monitoring
9. **Data Warehouse (Hadoop)**: Offline analytics

**Key Principle**: Use the right tool for each job. No single database solves all problems.

---

## Interview Tips

1. **Start with primary database**: Choose RDBMS/Document/Columnar based on data structure
2. **Add caching**: Mention Redis for performance optimization
3. **Consider file storage**: S3 + CDN for media files
4. **Add search**: Elasticsearch if full-text search is needed
5. **Time-series for metrics**: InfluxDB for monitoring and metrics
6. **Data warehouse for analytics**: Hadoop/Snowflake for offline analysis
7. **Explain trade-offs**: Each storage type has specific use cases

---

## Related Topics

- [Part 1-A: Caching, File Storage, Search](./02_Additional-Storage-Types-Part1-A.md)
- [Database Selection Framework](./01_Database-Selection-Decision-Framework-Part1-A.md)
- [Polyglot Persistence](./01_Database-Selection-Decision-Framework-Part1-B.md#hybrid-approaches-combining-database-types)

