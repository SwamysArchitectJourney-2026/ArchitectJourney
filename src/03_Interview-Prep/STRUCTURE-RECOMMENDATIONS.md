# Interview Prep Structure & Rename Plan

**Date**: December 1, 2025
**Status**: Final Plan for Execution

---

## 🎯 Core Philosophy: Reference-First & Progressive Learning

We are restructuring the repository to clearly separate **Static Knowledge (Learning)** from **Applied Practice (Interview Prep)**.

### 1. The "Reference-First" Shift
**Fundamentals** (Design Patterns, SOLID, Architecture Principles) are static knowledge. They belong in the Reference library, not in Interview Prep.

*   **Move From**: `src/03_Interview-Prep/02_Common/`
*   **Move To**: `src/01_Reference/01_Development/04_Software-Design/`

### 2. The "Progressive" Interview Prep Structure
The `03_Interview-Prep` folder will be organized logically from foundation to role-specific practice.

*   **01_Glossary**: Terminology
*   **02_Common**: Shared skills (STAR method, General Q&A)
*   **03_System-Design-Scenarios**: Deep-dive practice scenarios (VideoConf, LiveStreaming)
*   **04+**: Role-specific folders (TPM, Architect, etc.)

---

## 📋 Execution Plan

### Phase 1: Move Fundamentals to Reference

Create `src/01_Reference/01_Development/04_Software-Design/` and move content:

| Source | Destination |
| :--- | :--- |
| `03_Interview-Prep/02_Common/03_DesignPatterns/` | `01_Reference/01_Development/04_Software-Design/02_Design-Patterns/` |
| `03_Interview-Prep/02_Common/04_SOLIDPrinciples/` | `01_Reference/01_Development/04_Software-Design/01_SOLID-Principles/` |

### Phase 2: Rename Interview-Prep Folders

Rename folders in `src/03_Interview-Prep/` to enforce the progressive order:

| Current Name | New Name |
| :--- | :--- |
| `SystemDesign/` | `03_System-Design-Scenarios/` |
| `TPM/` | `04_TPM/` |
| `Software-Architect/` | `05_Software-Architect/` |
| `Solution-Architect/` | `06_Solution-Architect/` |
| `AI-Architect/` | `07_AI-Architect/` |
| `Engineering-Manager/` | `08_Engineering-Manager/` |
| `PrincipalConsultant-Data/` | `09_PrincipalConsultant-Data/` |

### Phase 3: Update References

1.  Update `01_Glossary` files to point to new folder names.
2.  Update `README.md` files in `03_Interview-Prep` and subfolders.
3.  Update `copilot-instructions.md` to reflect the new structure.

---

## 📁 Final Target Structure

```text
src/
├── 01_Reference/
│   └── 01_Development/
│       └── 04_Software-Design/       <-- NEW HOME for Fundamentals
│           ├── 01_SOLID-Principles/
│           ├── 02_Design-Patterns/
│           └── 03_Architecture-Patterns/
│
└── 03_Interview-Prep/
    ├── 01_Glossary/
    ├── 02_Common/                    # STAR Method, General Q&A
    ├── 03_System-Design-Scenarios/   # VideoConf, LiveStreaming
    ├── 04_TPM/
    ├── 05_Software-Architect/
    ├── 06_Solution-Architect/
    ├── 07_AI-Architect/
    ├── 08_Engineering-Manager/
    └── 09_PrincipalConsultant-Data/
```
