---
learning_level: "Intermediate"
prerequisites: ["Understanding of RAG architecture basics", "Vector stores and embeddings"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand query-time retrieval and prompt construction in RAG systems"
  - "Identify design decisions and trade-offs in RAG architecture"
  - "Recognize common failure modes and how to address them"
related_topics:
  prerequisites: ["./03_RAG-Architecture-Fundamentals-Part1-A.md"]
  builds_upon: []
  enables: []
  cross_refs: []
---

# RAG Architecture Fundamentals (Part 2)

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

## 🔗 Related Documents

- [Part 1-A: RAG Architecture Basics](./03_RAG-Architecture-Fundamentals-Part1-A.md) - High-level flow, ingestion, and embeddings
- [Generative AI Systems Overview](./01_Generative-AI-Systems-Overview-Part1-A.md) - Introduction to generative AI pillars

