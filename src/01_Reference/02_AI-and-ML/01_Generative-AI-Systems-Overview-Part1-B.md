---
learning_level: "Intermediate"
prerequisites: ["Understanding of language models and RAG basics"]
estimated_time: "25 minutes"
learning_objectives:
  - "Understand agentic systems and tool-using models"
  - "Explain how the three pillars of generative AI fit together"
  - "Identify next steps for deeper learning in each domain"
related_topics:
  prerequisites: ["./01_Generative-AI-Systems-Overview-Part1-A.md"]
  builds_upon: []
  enables: ["./03_RAG-Architecture-Fundamentals-Part1-A.md"]
  cross_refs: []
---

# Generative AI Systems Overview (Part 2)

## 3. Agentic Systems and Tool-Using Models

While RAG enriches a **single model call**, many real-world tasks require **multi-step workflows**, **tool usage**, and **coordination** between different components. This is where **agentic systems** come in.

An **agentic system** typically involves one or more agents that:

- Receive goals or tasks expressed in natural language.
- Decide which tools, APIs, or services to call.
- Plan and execute multi-step workflows.
- Maintain state or memory over longer interactions.

Examples of tools an agent might use include:

- Web search or internal knowledge APIs.
- Code execution environments (e.g., Python sandboxes).
- Databases or vector stores.
- Enterprise systems (ticketing, CRM, monitoring).

Popular frameworks provide structure for building such systems, including:

- Orchestrating **single-agent** flows (one model coordinating tools).
- Configuring **multi-agent** systems where specialized agents collaborate.
- Managing **tool schemas**, **policies**, and **safety constraints**.

As the field evolves, new frameworks and orchestration runtimes appear frequently. Instead of focusing on specific brand names, it is useful to understand the common capabilities:

- **Planning**: breaking a high-level goal into sub-tasks.
- **Tool selection**: choosing appropriate tools for each sub-task.
- **Execution**: calling tools, handling errors, and retrying when needed.
- **Coordination**: passing intermediate results between agents or steps.

## 4. How the Pillars Fit Together

The three pillars complement each other rather than compete:

- **Language models** provide the core reasoning and generation ability.
- **RAG + vector databases** ground the model in your **current, private, or specialized data**.
- **Agentic systems** orchestrate multi-step workflows and tool usage to solve richer tasks.

Conceptually:

```text
          +--------------------------+
          |      Agentic Systems     |
          |  (planning, tools, flow) |
          +------------+-------------+
                       |
                       v
           +-----------+-----------+
           |    RAG & Retrieval    |
           |  (vector DB, context)  |
           +-----------+-----------+
                       |
                       v
                 [Language Model]
```

A mature generative AI platform typically combines all three:

- A catalog of models exposed via APIs.
- A retrieval layer that knows about internal documents and data.
- An orchestration/agent layer that turns user intents into reliable workflows.

## 5. What Comes Next

This overview is intentionally high-level. Follow-up content dives deeper into each pillar:

- **Language Models** – architectures, prompt design patterns, evaluation, and safety.
- **RAG Systems** – data pipelines, chunking strategies, ranking, evaluation, and failure modes.
- **Agentic Systems** – single vs multi-agent designs, tool integration, and governance.

As you work through those modules, use this mental map to see **where each concept fits in the larger generative AI ecosystem**.

## 🔗 Related Documents

- [Part 1-A: Language Models and RAG](./01_Generative-AI-Systems-Overview-Part1-A.md) - Introduction to language models and RAG
- [RAG Architecture Fundamentals](./03_RAG-Architecture-Fundamentals-Part1-A.md) - Deep dive into RAG systems

