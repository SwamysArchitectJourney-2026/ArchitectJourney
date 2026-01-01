# Source Content Directory

This directory contains the **organized educational content** for ArchitectJourney, structured into three main categories:

- **`01_Reference/`** — Static knowledge and reference materials
- **`02_Learning/`** — Progressive learning paths and courses
- **`03_Interview-Prep/`** — Preparation materials organized by role

---

## 📁 Directory Structure

```
src/
├── 01_Reference/          # Static knowledge and reference materials
│   ├── 01_Development/    # Programming languages and development tools
│   ├── 02_AI-and-ML/      # AI, ML, and data engineering
│   └── 05_DevOps/         # DevOps, GitOps, MLOps, LLMOps
│
├── 02_Learning/           # Progressive learning paths (coming soon)
│
├── 03_Interview-Prep/     # Preparation by role
│   ├── Common/            # Shared preparation content (STAR method, etc.)
│   ├── TPM/               # Technical Project Manager prep
│   ├── Architect/         # Software Architect prep
│   ├── Solution-Architect/ # Solution Architect prep
│   └── Engineering-Manager/ # Engineering Manager prep
│
```
```

---

## 📚 01_Reference — Static Knowledge

**Purpose**: Curated reference materials for quick lookup and deep dives.

### 01_Development

Programming languages and development tools:

- **Python**: Execution model, best practices
- **C#**: Code analysis rules (CA1001, CA1308, CA2007)
- **JavaScript**: Node.js learning guides

### 02_AI-and-ML

AI, machine learning, and data engineering:

- Generative AI systems overview
- RAG architecture fundamentals

### 05_DevOps

DevOps practices and tools:

- Containerization tools (Docker, Podman, Rancher)
- DevOps, GitOps, MLOps, LLMOps guide

---

## 🎓 02_Learning — Progressive Learning Paths

**Purpose**: Structured learning paths and courses (coming soon).

This directory will contain progressive learning materials organized by:
- Skill level (beginner → advanced)
- Learning tracks
- Hands-on projects
- Assessment materials

---

## 💼 03_Interview-Prep — Preparation

**Purpose**: Role-specific preparation materials.

### Common

Shared preparation content:
- STAR method guide
- Common evaluation frameworks

### TPM (Technical Project Manager)

Complete TPM preparation:
- Overview and rounds
- Question banks (Easy → Expert)
- Model answers
- System design questions
- Agile scenarios
- Technical topics
- Mock evaluation questions
- Additional system designs
- Preparation cheatsheet
- STAR stories

### Solution-Architect

Comprehensive solution architect prep:
- Azure Data Engineering preparation
- ML Platform design answers
- Principal Consultant question bank
- Complete preparation pack
- Architecture diagrams & mock evaluations
- Enterprise ML platform design

### Architect

Software architect preparation materials (coming soon).

### Engineering-Manager

Engineering manager preparation materials (coming soon).

---

## 🔄 Content Migration Workflow

1. **Raw Content** → Place in `source-material/` (at repository root)
2. **Review & Categorize** → Determine appropriate destination
3. **Transform & Organize** → Structure according to rules
4. **Migrate** → Move to appropriate folder in `01_Reference/`, `02_Learning/`, or `03_Interview-Prep/`

---

## 📋 Content Organization Rules

All content follows these principles:

- **Zero-copy policy**: Transform, don't duplicate
- **25-minute segments**: Max 150 lines per file, split when needed
- **YAML frontmatter**: Required metadata for all documents
- **Naming conventions**: Zero-padded numeric prefixes (`01_`, `02_`, etc.)
- **Cross-references**: Links to related documents

---

## 🔗 Quick Links

- [Main README](../README.md) — Repository overview and roadmap
- [Reference Materials](./01_Reference/) — Static knowledge base
- [Learning Paths](./02_Learning/) — Progressive courses
- [Preparation](./03_Interview-Prep/) — Role-specific prep

---

## 📝 Status

- ✅ **01_Reference/**: Active with content
- ✅ **03_Interview-Prep/**: Active with TPM and Solution-Architect content
- 🚧 **02_Learning/**: Coming soon

---

**Last Updated**: November 24, 2025

