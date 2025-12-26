# Contributing to ArchitectJourney

Thank you for your interest in contributing to ArchitectJourney! This document provides guidelines and instructions for contributing to this educational repository.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Content Contribution Guidelines](#content-contribution-guidelines)
- [Pull Request Process](#pull-request-process)
- [Style Guide](#style-guide)
- [Questions?](#questions)

---

## 📜 Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the maintainers.

---

## 🚀 Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/ArchitectJourney.git
   cd ArchitectJourney
   ```
3. **Set up the upstream remote**:
   ```bash
   git remote add upstream https://github.com/SwamysArchitectJourney-2026/ArchitectJourney.git
   ```

---

## 💡 How to Contribute

### Reporting Issues

- **Bug Reports**: Use the bug report template
- **Content Suggestions**: Use the content suggestion template
- **Documentation Improvements**: Use the documentation template
- **Feature Requests**: Use the feature request template

### Contributing Content

We welcome contributions of:
- Educational content (following our [Educational Content Rules](.cursor/rules/01_educational-content-rules.mdc))
- Documentation improvements
- Code examples (minimal, illustrative)
- Diagrams and visualizations
- Learning path suggestions

---

## 📝 Content Contribution Guidelines

### Critical Rules

**All content must follow these mandatory rules:**

1. **Zero-Copy Policy**: All content must be transformative, not copied verbatim
2. **25-Minute Segments**: Content should be ≤150 lines per file
3. **YAML Frontmatter**: All educational content must include required metadata
4. **File Naming**: Follow semantic naming conventions (see [File Naming Conventions](.cursor/rules/07_file-naming-conventions.mdc))
5. **Transformative Workflow**: Create original explanations, examples, and diagrams

### Content Structure

Every educational content file must include:

```yaml
---
learning_level: "Beginner" | "Intermediate" | "Advanced"
prerequisites: ["required knowledge", "prior concepts"]
estimated_time: "25 minutes"
learning_objectives:
  - "Specific, measurable outcome 1"
  - "Specific, measurable outcome 2"
related_topics:
  prerequisites: ["../prerequisite-content/"]
  builds_upon: ["../foundational-content/"]
  enables: ["../advanced-content/"]
  cross_refs: ["../related-domains/"]
---
```

### File Naming

- ✅ Use semantic names: `fundamentals.md`, `advanced.md`
- ✅ Use numbered prefixes when sequence matters: `01_introduction.md`, `02_concepts.md`
- ❌ Avoid `Part1-A`, `Part1-B` patterns (deprecated)
- ❌ Never use `00_` prefix

### Content Placement

- **Reference Content**: `src/01_Reference/` - Static knowledge base
- **Learning Paths**: `src/02_Learning/` - Sequential learning content
- **Interview Prep**: `src/03_Interview-Prep/` - Interview preparation materials

---

## 🔄 Pull Request Process

### Before Submitting

1. **Read the rules**: Review [Educational Content Rules](.cursor/rules/01_educational-content-rules.mdc) and [File Naming Conventions](.cursor/rules/07_file-naming-conventions.mdc)
2. **Check existing content**: Ensure your contribution doesn't duplicate existing content
3. **Follow the style guide**: See [Style Guide](#style-guide) below
4. **Test your changes**: Run validation scripts if available

### PR Checklist

- [ ] Content follows zero-copy policy (transformative, not copied)
- [ ] File length ≤150 lines (or properly split)
- [ ] YAML frontmatter includes all required fields
- [ ] File naming follows semantic conventions
- [ ] All file references point to existing files
- [ ] Markdown linting passes
- [ ] Content is placed in correct directory
- [ ] Learning objectives are clear and measurable

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Contribution
- [ ] New educational content
- [ ] Documentation improvement
- [ ] Bug fix
- [ ] Content enhancement

## Related Issues
Closes #(issue number)

## Checklist
- [ ] Followed all content rules
- [ ] YAML frontmatter complete
- [ ] File naming compliant
- [ ] No broken references
- [ ] Markdown linting passes
```

---

## 📐 Style Guide

### Markdown Standards

- Use proper heading hierarchy (H1 → H2 → H3)
- Include code fence language specifications
- Follow markdownlint rules
- Use UTF-8 encoding
- Line length ~120 chars (tables/URLs may exceed)

### Diagrams

- **Mermaid-first**: Primary visualization method
- **ASCII fallback**: Include ASCII fallback for compatibility
- **Never embed copyrighted figures**: Create original diagrams

### Code Examples

- Keep examples minimal and illustrative
- Focus on teaching concepts, not complete implementations
- Reference full implementations in separate code repositories
- Include language specification in code fences

### Language and Tone

- Professional yet accessible
- Clear and concise
- Progressive complexity (simple → advanced)
- Inclusive and welcoming

---

## 🛠️ Development Setup

### Required Tools

- Git
- Markdown editor (VS Code recommended)
- Markdownlint (for validation)

### Validation Commands

```bash
# Markdown linting
npx markdownlint-cli2 "**/*.md"

# File reference validation (PowerShell)
.\tools\psscripts\Validate-FileReferences.ps1
```

---

## ❓ Questions?

- **Content Guidelines**: See [Educational Content Rules](.cursor/rules/01_educational-content-rules.mdc)
- **File Naming**: See [File Naming Conventions](.cursor/rules/07_file-naming-conventions.mdc)
- **Repository Structure**: See [Repository Structure](.cursor/rules/02_repository-structure.mdc)
- **General Questions**: Open a discussion or issue

---

## 🙏 Recognition

Contributors will be recognized in:
- Repository README (for significant contributions)
- Commit history
- Release notes

---

## 📚 Additional Resources

- [GitHub Copilot Instructions](.github/copilot-instructions.md) - Comprehensive repository guidelines
- [Repository Structure](.cursor/rules/02_repository-structure.mdc) - Directory organization
- [Quality Assurance](.cursor/rules/03_quality-assurance.mdc) - Quality standards

---

**Thank you for contributing to ArchitectJourney!** 🎉

