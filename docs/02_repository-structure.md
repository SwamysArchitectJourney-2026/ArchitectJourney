# Repository Structure (Single Source of Truth)

This document is the authoritative reference for the current folder structure of **ArchitectJourney**.

---

## Current Structure (As of December 26, 2025)

```text
ArchitectJourney/
├── .copilot/                              # Copilot configuration
├── .cursor/                               # Cursor AI configuration and rules
├── .github/                               # GitHub configuration (Copilot instructions, prompts)
├── docs/                                  # Documentation hub
├── source-material/                       # Staging area (git-ignored, non-compliant raw inputs)
├── src/                                   # Organized, compliant content (reference/learning/interview prep)
├── tools/                                 # Automation and utilities
├── LICENSE
├── README.md
└── .gitignore
```

---

## Key Folders

### `source-material/`

- **Purpose**: Raw source inputs (transcripts/notes/etc.) before transformation.
- **Compliance**: Not required (staging area).
- **Policy**: Read-only for migration; do not edit/format files here.

### `src/`

- **Purpose**: The curated, organized learning content.
- **Compliance**: Must follow the repository’s educational content rules.

---

## Related References

- Cursor rule: `./../.cursor/rules/02_repository-structure.mdc`
- Cursor rule: `./../.cursor/rules/01_educational-content-rules.mdc`
- Source content map: `./../src/README.md`
