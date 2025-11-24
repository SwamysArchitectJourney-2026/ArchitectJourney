---
learning_level: "Intermediate"
prerequisites: ["Basic machine learning concepts", "Understanding of language models"]
estimated_time: "25 minutes"
learning_objectives:
  - "Explain the core components of a retrieval-augmented generation (RAG) system."
  - "Describe the end-to-end data ingestion pipeline for building a vector store."
  - "Identify common design decisions and failure modes in RAG architectures."
related_topics:
  prerequisites: ["./01_Generative-AI-Systems-Overview-Part1-A.md"]
  builds_upon: ["./01_Generative-AI-Systems-Overview-Part1-A.md"]
  enables: ["./04_RAG-Architecture-Fundamentals-Part1-B.md", "./04_Agentic-Systems-Design-Part1-A.md"]
  cross_refs: ["../01_Development/01_Python/01_Python-Execution-Model-Part1-A.md"]
---

# RAG Architecture Fundamentals (Part 1)

Retrieval-Augmented Generation (RAG) combines **language models** with **external knowledge sources** so that responses can be grounded in up-to-date, domain-specific information. Instead of relying solely on what a model learned during pre-training, a RAG system retrieves relevant context at query time and injects it into the model's prompt.

This lesson focuses on the **core architecture** and **data pipeline** behind RAG so that later modules can explore optimization, evaluation, and production concerns.

## 1. High-Level RAG Flow

At a high level, a RAG system has two major phases:

1. **Offline (or background) phase** – Build and maintain a **vector store** from your documents.
2. **Online (query-time) phase** – For each user query, retrieve relevant information and generate a grounded response.

```mermaid
graph LR
    subgraph Offline[Indexing]
        A[Raw Data Sources] --> B[Ingestion & Preprocessing]
        B --> C[Chunking]
        C --> D[Embedding Model]
        D --> E[Vector Store]
    end

    subgraph Online[Query-Time]
        F[User Query] --> G[Query Embedding]
        G --> H[Similarity Search]
        E --> H
        H --> I[LLM Prompt Builder]
        I --> J[LLM]
        J --> K[Grounded Answer]
    end
```

```text
ASCII Fallback:

Offline (Indexing):
  [Raw Data] -> [Ingest/Preprocess] -> [Chunk] -> [Embed] -> [Vector Store]

Online (Query-Time):
  [User Query] -> [Embed Query] -> [Similarity Search over Vector Store]
                 -> [Build Prompt with Retrieved Chunks] -> [LLM] -> [Answer]
```

The key idea is simple: **retrieve first, then generate**.

## 2. Data Ingestion and Preprocessing

The offline phase turns raw data into a structure that is easy to search at query time.

Typical data sources include:

- Markdown documents, PDFs, slide decks, or HTML pages.
- Code repositories and configuration files.
- Databases, data warehouses, or analytics platforms.
- Ticketing systems, knowledge bases, or internal wikis.

A robust ingestion pipeline usually performs:

1. **Loading** – Connect to each data source and read content.
2. **Normalization** – Convert to a common format (e.g., plain text + metadata).
3. **Cleaning** – Remove boilerplate, navigation menus, repeated headers/footers, or irrelevant sections.
4. **Segmentation / Chunking** – Split long documents into manageable chunks.
5. **Metadata enrichment** – Attach useful fields (e.g., source, section heading, timestamp, tags).

### Why Chunking Matters

Language models have a **context window limit**. Sending entire documents is:

- Expensive (more tokens).
- Noisy (irrelevant sections compete with useful ones).

Chunking strategies often consider:

- **Chunk size** – number of tokens or characters per chunk.
- **Overlap** – how much neighboring text overlaps so that concepts spanning boundaries are preserved.
- **Semantic boundaries** – splitting at headings, paragraphs, or logical sections instead of fixed sizes only.

Thoughtful chunking dramatically improves retrieval quality.

## 3. Embeddings and Vector Stores

Once you have chunks, each chunk is converted into a **vector representation** using an **embedding model**.

Characteristics of embeddings:

- They map text into a high-dimensional space where **semantic similarity** corresponds to **distance**.
- Similar pieces of text (e.g., about the same concept) end up near each other in that space.

The resulting vectors and their metadata are stored in a **vector store** (or vector database). This component usually provides:

- Fast similarity search (e.g., k-nearest neighbors, approximate nearest neighbors).
- Filtering by metadata (e.g., by user, document type, date range).
- APIs to insert, update, and delete vectorized documents.

Embedding details to consider:

- **Model choice** – multilingual vs monolingual, general-purpose vs domain-specific.
- **Embedding granularity** – per sentence, per paragraph, or per section.
- **Index configuration** – trade-offs between recall, latency, and memory.

## 4. Query-Time Retrieval and Prompt Construction

At query time, the system needs to find the most relevant chunks and feed them into the model.

The standard process is:

1. **Encode the query** – Apply the same embedding model (or a compatible one) to the user query.
2. **Similarity search** – Use the query vector to search the vector store.
3. **Rank and filter results** – Optionally rerank results with more precise scoring or apply metadata filters.
4. **Build a prompt** – Compose a prompt that includes:
   - The original user question.
   - Instructions for how the model should use retrieved context.
   - The retrieved chunks themselves (often formatted with clear separators and citations).
5. **Generate the answer** – Send the prompt to the language model and return the response.

Prompt construction is critical. Clear instructions such as **"use only the provided context"**, **"cite which source you are using"**, or **"say 'I don't know' if the answer is not in the context"** can reduce hallucinations.

## 5. Design Decisions and Trade-Offs

Building an effective RAG system involves many architectural choices:

- **Where to run retrieval** – In the same service as the model call, or as a separate microservice.
- **Which embedding/model pair to use** – Higher-quality embeddings may improve retrieval, but increase cost.
- **Index refresh cadence** – Real-time updates vs periodic batch ingestion.
- **Result count (top-k)** – Too few results risk missing key information; too many lead to noisy prompts.
- **Latency budget** – Each retrieval, reranking, and model call step adds latency.

Common patterns include:

- A **two-stage retrieval**: fast vector search, then a slower but more accurate reranker.
- **Hybrid search**: combining keyword search (BM25) with vector search to handle exact matches and semantics.
- **Multi-vector or hierarchical retrieval**: retrieving at document, section, and paragraph levels.

## 6. Typical Failure Modes

RAG systems fail in characteristic ways. Recognizing these patterns helps you debug and improve them.

1. **Irrelevant retrieval**
   - Symptoms: responses mentioning the wrong product, version, or domain.
   - Causes: poor embeddings, incorrect chunking, or missing metadata filters.

2. **Partial context**
   - Symptoms: the model answers only part of the question or misses key constraints.
   - Causes: chunk size too small, aggressive filtering, or low top-k.

3. **Context overflow**
   - Symptoms: important information is truncated from the prompt.
   - Causes: too many chunks, large documents, or verbose formatting.

4. **Hallucinations despite context**
   - Symptoms: the model invents details that contradict retrieved text.
   - Causes: weak instructions, no requirement to stay within context, or ambiguous prompts.

5. **Stale data**
   - Symptoms: answers refer to outdated policies, APIs, or products.
   - Causes: vector store not refreshed, ingestion pipeline failing silently.

Each of these can be addressed with targeted fixes: better preprocessing, improved retrieval configuration, clearer prompts, or improved monitoring.

## 7. Where RAG Fits in the Larger System

RAG is a **building block**, not an end state. In a complete generative AI platform:

- RAG provides **grounded access to knowledge**.
- Agentic or orchestration layers use RAG as one of several tools.
- Evaluation components measure answer quality, latency, and robustness.

As you move into advanced topics, you will see RAG combined with:

- **Workflow engines** for multi-step reasoning.
- **Tool-using agents** that call RAG selectively.
- **Feedback loops** that log queries, outcomes, and corrections to improve the system over time.

This foundational understanding of RAG architecture prepares you to design, implement, and improve retrieval-enhanced applications in real-world systems.
