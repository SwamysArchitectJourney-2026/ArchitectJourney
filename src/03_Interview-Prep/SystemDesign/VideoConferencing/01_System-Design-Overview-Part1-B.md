---
learning_level: "Advanced"
prerequisites: ["./01_System-Design-Overview-Part1-A.md"]
estimated_time: "25 minutes"
learning_objectives:
  - "Architect the data and storage layer for video and metadata"
  - "Integrate AI services for real-time translation and transcription"
  - "Design observability with Prometheus and Grafana"
related_topics:
  enables: ["./01_System-Design-Overview-Part1-C.md"]
  builds_upon: ["./01_System-Design-Overview-Part1-A.md"]
---

# System Design: AI-Enhanced Video Conferencing - Part 1-B

## 2. High-Level Architecture Components (Part 2)

### Data & Storage

* **Postgres**: Relational database for structured data.
  * **Use Cases**: User profiles, Meeting metadata (start/end time, participants), Chat logs, Tenant config.
  * **Scaling**: Read replicas for high read traffic (e.g., dashboard views).
* **Blob Storage**: Object storage for unstructured data.
  * **Use Cases**: Video recordings (MP4/WebM), Shared files, Transcripts.
  * **Technology**: Azure Blob Storage / AWS S3.
  * **Lifecycle**: Hot tier for recent meetings, Cool/Archive tier for older recordings.
* **Redis**: In-memory cache.
  * **Use Cases**: Session state, real-time presence (who is online), meeting status.

### AI Services (The "AI Architect" Focus)

* **Azure AI Services**:
  * **Speech-to-Text**: For real-time transcription.
    * **Pattern**: Stream audio chunks -> STT API -> Text stream.
  * **Translation**: For live language translation.
    * **Pattern**: Text stream -> Translation API -> Translated Text -> Broadcast to clients.
  * **Content Safety**: For moderating text/audio.
    * **Use Case**: Detect PII or toxic language in real-time.

### Observability

* **Prometheus**: Metric collection.
  * **Metrics**: QPS, Latency, Error rates, Active meetings, Connected users.
* **Grafana**: Visualization.
  * **Dashboards**: "System Health", "AI Usage Costs", "Tenant Usage".
* **Distributed Tracing**: Jaeger / Azure Monitor.
  * **Goal**: Trace a request from Client -> Gateway -> Meeting Service -> AI Service.

## 3. Architecture Diagram (Mermaid)

```mermaid
graph TD
    subgraph Client
        Web[Web UI / Mobile App]
    end

    subgraph "API Gateway & Security"
        APIG[API Gateway]
        Auth[Identity System]
    end

    subgraph "Application Services"
        MeetSvc[Meeting Service]
        ChatSvc[Chat Service]
        CollabSvc[Collaboration Service]
    end

    subgraph "AI Services"
        AzAI[Azure AI Services]
        Trans[Translation]
        Script[Transcription]
    end

    subgraph "Data Layer"
        SQL[(Postgres DB)]
        Blob[(Blob Storage)]
        Redis[(Redis Cache)]
    end

    subgraph "Observability"
        Prom[Prometheus]
        Graf[Grafana]
    end

    Web --> APIG
    APIG --> Auth
    APIG --> MeetSvc
    APIG --> ChatSvc
    
    MeetSvc --> AzAI
    AzAI --> Trans
    AzAI --> Script
    
    MeetSvc --> SQL
    ChatSvc --> SQL
    MeetSvc --> Redis
    
    MeetSvc --> Blob
    CollabSvc --> Blob
    
    Prom --> MeetSvc
    Prom --> AzAI
    Graf --> Prom
```
