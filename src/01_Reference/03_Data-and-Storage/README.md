# Data and Storage Reference

This section contains fundamental knowledge about data storage, database selection, and persistence strategies.

## Contents

### Database Selection Framework
- **[Part 1-A: Decision Tree](./01_Database-Selection-Decision-Framework-Part1-A.md)** - Decision tree for choosing between RDBMS, Document DB, and Columnar DB based on data characteristics and requirements. Covers impact on non-functional requirements.
- **[Part 1-B: Considerations & Hybrid Approaches](./01_Database-Selection-Decision-Framework-Part1-B.md)** - Trade-offs, scalability considerations, and polyglot persistence patterns.

### Additional Storage Types
- **[Part 1-A: Caching, File Storage, Search](./02_Additional-Storage-Types-Part1-A.md)** - Redis for caching, S3/CDN for file storage, Elasticsearch/Solr for text search.
- **[Part 1-B: Time-Series & Data Warehouses](./02_Additional-Storage-Types-Part1-B.md)** - InfluxDB/OpenTSDB for time-series data, Hadoop ecosystem for data warehouses and offline analytics.

## Learning Path

1. Start with **Database Selection Framework (Part 1-A)** to understand the decision tree
2. Read **Part 1-B** to learn about trade-offs and hybrid approaches
3. Explore **Additional Storage Types** to understand specialized storage solutions
4. Apply this knowledge in system design scenarios
5. Reference this material when making architectural decisions

## Key Insights

- **Database choice affects NFRs**: While databases don't change functional requirements, they significantly impact scalability, query patterns, and performance.
- **Polyglot persistence is essential**: Real-world systems use multiple database types to meet different needs.
- **Specialized storage for specialized needs**: Caching, file storage, search, time-series, and data warehouses each solve specific problems.

## Related Sections

- **[Glossary](../../03_Interview-Prep/01_Glossary/README.md)** - Database-related terms and definitions
- **[System Design Scenarios](../../03_Interview-Prep/SystemDesign/)** - Apply database selection in real scenarios
