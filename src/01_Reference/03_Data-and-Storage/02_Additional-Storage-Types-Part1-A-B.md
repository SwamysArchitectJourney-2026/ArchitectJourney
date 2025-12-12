---
learning_level: "Intermediate"
prerequisites: ["./02_Additional-Storage-Types-Part1-A-A-B.md"]
estimated_time: "10 minutes"
learning_objectives:
  - "Recognize when search engines are appropriate"
  - "Understand full-text search architecture"
related_topics:
  builds_upon: ["./02_Additional-Storage-Types-Part1-A-A-B.md"]
  enables: ["./02_Additional-Storage-Types-Part1-B-A.md"]
---

# Additional Storage Types (Part 1-A-B)

## 3. Full-Text Search Engines

### Purpose

Search engines provide advanced text search capabilities including typo tolerance, relevance ranking, and complex query syntax.

### When Search Engines Are Needed

- **Product catalogs**: Search across item names, descriptions, specifications
- **Content platforms**: Find articles, posts, or media by text content
- **Location services**: Search place names with typo tolerance
- **Log analysis**: Search through application logs and events
- **Documentation systems**: Find help articles and guides

### Technology Foundation

Both Elasticsearch and Solr build on **Apache Lucene**, which provides core text indexing and search algorithms.

### Elasticsearch

- **Distributed architecture**: Scales across multiple nodes
- **REST API**: HTTP-based interface
- **Near real-time indexing**: Documents searchable quickly after indexing
- **Rich query language**: Complex search expressions
- **Analytics capabilities**: Aggregations and statistical queries

### Apache Solr

- **Enterprise features**: Advanced search platform
- **Multiple APIs**: XML, JSON, HTTP interfaces
- **Faceted search**: Built-in filtering and categorization
- **Schema definition**: Structured search configurations
- **Extensibility**: Plugin architecture

### Typo Tolerance (Fuzzy Matching)

Search engines can handle spelling errors using edit distance algorithms:

**Example**: User searches "AIRPROT" but meant "AIRPORT"
- Edit distance: 2 (character transposition)
- Search engine configures tolerance level
- Returns relevant results despite typo

### Critical Architecture Consideration

**Search engines are NOT databases**. They prioritize search performance over data durability guarantees.

**Best Practice**:
- Maintain primary data in a durable database
- Synchronize data into search engine for indexing
- Use search engine for queries, database for writes
- Treat search index as a performance optimization layer

### Use Cases

- **E-commerce search**: Find products by name, description, category
- **Content discovery**: Search articles, videos, posts
- **Log investigation**: Search application logs for errors or events
- **Analytics queries**: Search and analyze business data

---

## Related Topics

- [Part 1-B-A: Time-Series Databases](./02_Additional-Storage-Types-Part1-B-A.md)
- [Database Selection Framework](./01_Database-Selection-Decision-Framework-Part1-A-A.md)
