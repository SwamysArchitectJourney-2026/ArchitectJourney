# File Naming Convention Migration Plan

**Date**: December 24, 2025  
**Status**: Planning Phase  
**New Standard**: [File Naming Conventions](../.cursor/rules/07_file-naming-conventions.mdc)

---

## 🎯 Objective

Migrate from brittle `Part1-A`, `Part1-B` naming patterns to semantic, maintainable file names that represent concepts rather than editorial accidents.

---

## 📊 Current State Analysis

### Problematic Patterns Found

**Pattern 1: Simple Part Suffixes**
- `Part1-A.md`, `Part1-B.md`
- Found in: Multiple interview prep folders

**Pattern 2: Nested Part Suffixes**
- `Part1-A-A.md`, `Part1-A-B.md`
- `Part1-B-A.md`, `Part1-B-B.md`
- Found in: `09_PrincipalConsultant-Data/`, `07_AI-Architect/`, `10_.NET-Architect/`

**Pattern 3: Complex Hierarchies**
- `Part1-C-A-B.md` (3 levels deep)
- Found in: `06_Solution-Architect/`

### Impact Assessment

- **Total files with Part patterns**: ~145 files in `src/03_Interview-Prep/`
- **Broken references risk**: High (many cross-references)
- **Migration complexity**: Medium-High (requires careful planning)

---

## 🚀 Migration Strategy

### Phase 1: New Content Only (Immediate)

**Status**: ✅ **ACTIVE**

- All new content uses semantic names
- Existing content remains unchanged
- No breaking changes
- Low risk

**Action Items**:
- ✅ Created new naming convention document
- ✅ Updated rules to deprecate `Part1-A` pattern
- ✅ New files (e.g., `11_Azure-Architect/`, `12_DevOps-Architect/`) use semantic names

### Phase 2: Gradual Migration (Recommended)

**Timeline**: Ongoing, as files are updated

**Approach**:
- When a file is updated or expanded, migrate to semantic naming
- Update references incrementally
- Test after each migration

**Benefits**:
- Low risk
- No big-bang changes
- Natural evolution

**Example Migration**:
```
Before: 01_Interview-Glossary-Part1-A.md
After:  glossary/core-concepts.md
```

### Phase 3: Systematic Refactoring (Optional)

**Timeline**: Future consideration

**Approach**:
- Folder-by-folder migration
- Comprehensive reference updates
- Full testing

**Considerations**:
- High effort
- Requires careful planning
- All references must be updated
- Risk of breaking links

---

## 📋 Migration Examples

### Example 1: Interview Glossary

**Current Structure**:
```
01_Glossary/
├── 01_Interview-Glossary-Part1-A.md
├── 01_Interview-Glossary-Part1-B.md
```

**Proposed Structure**:
```
01_Glossary/
├── README.md
├── core-concepts.md
├── system-design.md
```

**Migration Steps**:
1. Review content of `Part1-A.md` and `Part1-B.md`
2. Identify semantic boundaries
3. Create new files with semantic names
4. Update all references
5. Remove old files
6. Test all links

### Example 2: Architecture Patterns

**Current Structure**:
```
03_Architecture-Patterns-Part1-A.md
03_Architecture-Patterns-Part1-B.md
03_Architecture-Patterns-Part1-C.md
```

**Proposed Structure**:
```
architecture-patterns/
├── README.md
├── fundamentals.md
├── microservices.md
└── event-driven.md
```

**Or** (if sequence matters):
```
architecture-patterns/
├── README.md
├── 01_fundamentals.md
├── 02_microservices.md
└── 03_event-driven.md
```

### Example 3: Question Banks

**Current Structure**:
```
03_Question-Bank-Part1-A-A.md
03_Question-Bank-Part1-A-B.md
03_Question-Bank-Part1-B-A.md
03_Question-Bank-Part1-B-B.md
```

**Proposed Structure**:
```
question-bank/
├── README.md
├── fundamentals.md
├── intermediate.md
├── advanced.md
└── expert.md
```

---

## 🔍 Reference Update Strategy

### Automated Detection

Use the existing validation script:
```powershell
.\tools\psscripts\Validate-FileReferences.ps1 -Path src
```

### Manual Review

For each migration:
1. Run validation script to find all references
2. Update references in:
   - YAML frontmatter (`prerequisites`, `enables`, `builds_upon`, `cross_refs`)
   - Markdown links
   - README files
3. Test all links
4. Verify no broken references

---

## ✅ Migration Checklist

### Before Migration

- [ ] Review content to identify semantic boundaries
- [ ] Plan new file structure
- [ ] Identify all files that reference the content
- [ ] Create backup or branch

### During Migration

- [ ] Create new files with semantic names
- [ ] Migrate content (preserve all educational content)
- [ ] Update all references
- [ ] Update README files
- [ ] Test all links

### After Migration

- [ ] Run validation script
- [ ] Verify no broken references
- [ ] Update documentation
- [ ] Remove old files
- [ ] Commit changes

---

## 📝 Decision Framework

### When to Migrate

**Migrate Now**:
- File is being updated or expanded
- File has broken references
- File structure is confusing

**Defer Migration**:
- File is stable and rarely updated
- Migration would break many references
- No clear semantic boundaries

### How to Choose Names

**Ask**:
1. What concept does this file represent?
2. Is there a learning sequence?
3. Will this concept be expanded?
4. Does it group with other concepts?

**Examples**:
- Concept: "Core Concepts" → `core-concepts.md`
- Sequence: "Fundamentals before Advanced" → `01_fundamentals.md`, `02_advanced.md`
- Grouping: Multiple related concepts → Create folder structure

---

## 🚨 Risks and Mitigations

### Risk 1: Broken References

**Mitigation**:
- Use validation script before and after migration
- Update all references systematically
- Test thoroughly

### Risk 2: Loss of Learning Sequence

**Mitigation**:
- Use numbered prefixes when sequence matters
- Document sequence in README
- Use `prerequisites` and `enables` in YAML

### Risk 3: Confusion During Transition

**Mitigation**:
- Document migration status
- Keep old files until references updated
- Clear communication in README files

---

## 📚 Resources

- [File Naming Conventions](../.cursor/rules/07_file-naming-conventions.mdc) - New standard
- [Educational Content Rules](../.cursor/rules/01_educational-content-rules.mdc) - Content structure
- [Repository Structure](../.cursor/rules/02_repository-structure.mdc) - Folder organization

---

## 🎯 Success Criteria

Migration is successful when:

- ✅ All new content uses semantic names
- ✅ No new `Part1-A` patterns created
- ✅ Existing content gradually migrates
- ✅ No broken references
- ✅ Clear, maintainable file structure
- ✅ GitHub navigation is intuitive

---

**Last Updated**: December 24, 2025  
**Next Review**: As migration progresses

