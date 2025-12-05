---
learning_level: "Intermediate"
prerequisites: ["./02_Additional-Storage-Types-Part1-A-B.md"]
estimated_time: "10 minutes"
learning_objectives:
  - "Understand time-series database characteristics"
  - "Identify use cases for time-series data"
related_topics:
  builds_upon: ["./02_Additional-Storage-Types-Part1-A-B.md"]
  enables: ["./02_Additional-Storage-Types-Part1-B-B.md"]
---

# Additional Storage Types (Part 1-B-A)

## 4. Time-Series Databases

### Purpose

Time-series databases specialize in storing and querying data points indexed by time. They optimize for sequential writes and time-range queries rather than random access patterns.

### When Time-Series Databases Fit

- **Application monitoring**: Track CPU usage, memory consumption, request rates
- **IoT sensor networks**: Collect temperature, pressure, location data
- **Financial market data**: Store price movements, trading volumes
- **Infrastructure metrics**: Monitor server health, network performance
- **User activity tracking**: Log user actions and system events with timestamps

### Key Design Characteristics

**Write Pattern**: Append-only sequential writes
- New data points always have later timestamps than previous points
- No updates to historical records
- No random writes to arbitrary time points

**Read Pattern**: Time-range bulk queries
- Queries typically request data for time windows (last hour, last day, last week)
- Rarely query individual data points
- Focus on aggregations over time ranges

**Optimizations**:
- Efficient compression of time-sequential data
- Fast time-range scans
- Automatic data retention and archival policies
- Downsampling of old data to reduce storage

### Technology Options

#### InfluxDB

- **Purpose-built**: Designed specifically for time-series workloads
- **Query language**: SQL-like syntax (InfluxQL)
- **Performance**: Handles millions of data points per second
- **Data lifecycle**: Automatic retention and downsampling
- **Real-time processing**: Continuous queries for streaming aggregations

#### OpenTSDB

- **Storage foundation**: Built on HBase for scalability
- **Scale**: Handles billions of data points
- **Tagging system**: Flexible metadata organization
- **Interface**: HTTP REST API
- **Integration**: Works with visualization tools like Grafana

### Example Query Pattern

```sql
-- Calculate average response time per hour for last 24 hours
SELECT mean("response_time") 
FROM "api_metrics" 
WHERE time > now() - 24h 
GROUP BY time(1h), "endpoint"
```

---

**Next**: [Data Warehouses and Architecture](./02_Additional-Storage-Types-Part1-B-B.md)
