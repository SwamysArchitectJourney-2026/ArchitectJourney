---
content_type: "interview_prep"
learning_level: "Beginner"
prerequisites: []
estimated_time: "25 minutes"
learning_objectives:
  - "Understand common acronyms and terms used in technical interviews"
  - "Master key terminology for system design interviews"
  - "Learn essential DevOps and cloud computing terms"
related_topics:
  prerequisites: []
  builds_upon: []
  enables: ["./01_Interview-Glossary-Part1-B.md"]
  cross_refs: ["../02_Common/01_STAR-Method/", "../02_Common/02_SystemDesign/"]
---

# Interview Glossary - Part 1-A

> **Fast reference for acronyms and terms** used across technical interviews. Organized by category for easy lookup.

---

## 📋 Table of Contents

1. [System Design & Architecture](#system-design--architecture)
2. [Cloud & Infrastructure](#cloud--infrastructure)
3. [DevOps & CI/CD](#devops--cicd)
4. [Performance & Scalability](#performance--scalability)

---

## System Design & Architecture

### Core Concepts

- **API (Application Programming Interface)** – Contract defining how software components interact.
- **REST (Representational State Transfer)** – Architectural style for HTTP APIs using resources and standard verbs (GET, POST, PUT, DELETE).
- **gRPC (gRPC Remote Procedure Calls)** – High-performance, binary RPC framework over HTTP/2, ideal for microservices.
- **GraphQL** – Query language and runtime for APIs that allows clients to request exactly the data they need.
- **Microservices** – Architecture pattern where applications are built as independent, loosely coupled services.
- **Monolith** – Traditional architecture where all application components are tightly coupled in a single unit.
- **Service Mesh** – Infrastructure layer for managing service-to-service communication (e.g., Istio, Linkerd).

### Data & Storage

- **ACID (Atomicity, Consistency, Isolation, Durability)** – Properties that guarantee reliable database transactions.
- **BASE (Basically Available, Soft state, Eventual consistency)** – Alternative to ACID for distributed systems.
- **CAP Theorem** – States that a distributed system can only guarantee two of: Consistency, Availability, Partition tolerance.
- **NoSQL** – Non-relational database systems (document, key-value, graph, column-family).
- **SQL** – Structured Query Language for relational databases.
- **OLTP (Online Transaction Processing)** – Database systems optimized for transaction processing.
- **OLAP (Online Analytical Processing)** – Database systems optimized for analytical queries and reporting.
- **Sharding** – Horizontal partitioning of data across multiple databases or servers.
- **Replication** – Copying data across multiple nodes for availability and performance.

> 💡 **Database Selection**: For a decision framework on choosing between RDBMS, Document DB, and Columnar DB, see [Database Selection Decision Framework](../../../01_Reference/03_Data-and-Storage/01_Database-Selection-Decision-Framework.md).

### Messaging & Communication

- **Message Queue** – Asynchronous communication pattern using queues (e.g., RabbitMQ, Azure Service Bus).
- **Pub/Sub (Publish/Subscribe)** – Messaging pattern where publishers send messages to topics, subscribers receive them.
- **Event Sourcing** – Pattern where state changes are stored as a sequence of events.
- **CQRS (Command Query Responsibility Segregation)** – Pattern separating read and write operations.

---

## Cloud & Infrastructure

### Cloud Services

- **IaaS (Infrastructure as a Service)** – Cloud service providing virtualized computing resources.
- **PaaS (Platform as a Service)** – Cloud service providing platform for application development and deployment.
- **SaaS (Software as a Service)** – Cloud service providing complete software applications.
- **Serverless** – Cloud execution model where cloud provider manages infrastructure automatically.

### Azure-Specific

- **AKS (Azure Kubernetes Service)** – Managed Kubernetes service on Azure.
- **VNet (Virtual Network)** – Isolated, software-defined network boundary in Azure.
- **App Service** – Platform-as-a-Service for hosting web applications on Azure.
- **Function App** – Serverless compute service for running event-driven code.
- **Blob Storage** – Object storage service for unstructured data.
- **Cosmos DB** – Globally distributed, multi-model database service.
- **Key Vault** – Service for securely storing and accessing secrets, keys, and certificates.

### Networking

- **DNS (Domain Name System)** – Service that resolves human-readable names to IP addresses.
- **CDN (Content Delivery Network)** – Distributed network of servers for delivering content with low latency.
- **Load Balancer** – Device that distributes network traffic across multiple servers.
- **API Gateway** – Single entry point for multiple APIs, handling routing, authentication, rate limiting.
- **WAF (Web Application Firewall)** – Firewall that protects web apps from common web attacks.

---

## DevOps & CI/CD

### Core Practices

- **CI (Continuous Integration)** – Practice of frequently integrating and validating code changes.
- **CD (Continuous Delivery)** – Automating release of changes into test environments.
- **CD (Continuous Deployment)** – Automating deployment of changes into production.
- **GitOps** – Operating model where desired state is stored in Git and reconciled to clusters.
- **Infrastructure as Code (IaC)** – Managing infrastructure through code and version control.

### Containerization

- **Docker** – Platform for containerizing applications.
- **Container** – Lightweight, portable unit that packages application and dependencies.
- **Image** – Read-only template for creating containers.
- **Kubernetes (K8s)** – Container orchestration platform for managing containerized applications.
- **Pod** – Smallest deployable unit in Kubernetes, containing one or more containers.
- **Deployment** – Kubernetes resource that manages replica sets of pods.
- **Service** – Kubernetes abstraction for exposing pods as network services.

### Scaling & Orchestration

- **HPA (Horizontal Pod Autoscaler)** – Kubernetes controller that scales pods based on metrics (CPU, memory, custom).
- **KEDA (Kubernetes Event-Driven Autoscaling)** – Kubernetes component for event/queue-based scaling.
- **VPA (Vertical Pod Autoscaler)** – Kubernetes component that adjusts pod resource requests/limits.
- **Auto-scaling** – Automatic adjustment of resources based on demand.

---

## Performance & Scalability

### Metrics

- **QPS (Queries Per Second)** – Throughput metric for how many requests a system handles per second.
- **RPS (Requests Per Second)** – Number of requests processed per second.
- **TPS (Transactions Per Second)** – Number of database transactions per second.
- **P50 (50th Percentile / Median)** – Latency below which 50% of requests complete.
- **P95 (95th Percentile Latency)** – Latency below which 95% of requests complete.
- **P99 (99th Percentile Latency)** – Latency below which 99% of requests complete.
- **Throughput** – Rate at which a system processes requests or data.
- **Latency** – Time delay between request and response.

### Scalability Patterns

- **Horizontal Scaling** – Adding more machines/nodes to handle increased load.
- **Vertical Scaling** – Adding more resources (CPU, memory) to existing machines.
- **Caching** – Storing frequently accessed data in fast storage for quick retrieval.
- **CDN (Content Delivery Network)** – Distributed network for delivering content with low latency.
- **Database Indexing** – Data structure that improves query performance.

---

## Next Steps

Continue to [Part 1-B](./01_Interview-Glossary-Part1-B.md) for:
- Security & Compliance terms
- AI/ML terminology
- Monitoring & Observability
- Additional interview-specific terms

---

**Related Content**:
- [STAR Method](../02_Common/01_STAR-Method/01_STAR-Method.md) – Behavioral interview framework
- [System Design Fundamentals](../02_Common/02_SystemDesign/) – System design concepts

