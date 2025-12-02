# Source Materials Migration Status

**Date**: December 2, 2025  
**Purpose**: Track migration of all content from `source-materials/` to educational content structure

---

## ✅ Already Migrated

The following content has already been migrated and is compliant:

1. **C# Code Analysis Rules**
   - `CA1001_Disposable_Fixes.md` → `src/01_Reference/01_Development/02_CSharp/01_Code-Analysis-CA1001-Disposable.md`
   - `CA1308_ToUpperInvariant_Analysis.md` → `src/01_Reference/01_Development/02_CSharp/02_Code-Analysis-CA1308-ToUpperInvariant.md`
   - `CA2007_ConfigureAwait_Fixes.md` → `src/01_Reference/01_Development/02_CSharp/03_Code-Analysis-CA2007-ConfigureAwait-Part1-A.md` and `Part1-B.md`

2. **Node.js Learning Guide**
   - `Learn-Node.js.md` → `src/01_Reference/01_Development/03_JavaScript/01_Node.js-Learning-Guide.md`

3. **Containerization Tools**
   - `Docker_Podman_Rancher.md` → `src/01_Reference/05_DevOps/01_Containerization-Tools.md`

4. **DevOps/GitOps/MLOps/LLMOps**
   - `DevOps-GitOps-LLMOps-MLOps-AgenticAIOps-1.md` → `src/01_Reference/05_DevOps/02_DevOps-GitOps-MLOps-LLMOps-Guide-Part1-A-1.md`, `Part1-A-2.md`, `Part1-B.md`

5. **TPM Content**
   - `Tell-Me-About-Yourself.md` → `src/03_Interview-Prep/04_TPM/12_Tell-Me-About-Yourself.md`

6. **Solution Architect Content**
   - `Sr_PSE_ML_Platform_Design_Answer.md` → `src/03_Interview-Prep/06_Solution-Architect/02_ML-Platform-Design-Answer.md`

7. **Video Conferencing System Design**
   - `VideoConferencing/Content.md`, `Research-Topic1.md`, `Research-Topic2.md` → Migrated to `src/03_Interview-Prep/03_System-Design-Scenarios/VideoConferencing/` (15 files total)

---

## 🔄 Needs Migration

The following content needs to be migrated following Zero-Copy Policy and content rules:

### 1. AI-.NET-Architect Content
- **Source**: `source-materials/AI-.NET-Architect/Content-1.md`
- **Source**: `source-materials/AI-.NET-Architect/Content-2.md`
- **Target**: `src/03_Interview-Prep/10_.NET-Architect/`
- **Status**: ✅ **IN PROGRESS** - Core files created
- **Migrated Files**:
  - `01_Interview-Overview.md` ✅
  - `02_Study-Roadmap.md` ✅
  - `03_Architecture-Patterns-Part1-A.md` ✅
  - `03_Architecture-Patterns-Part1-B.md` ✅
  - `04_Interview-Questions-Part1-A.md` ✅
  - `README.md` ✅
- **Remaining**: Additional interview questions, whiteboard scenarios, cheat sheets
- **Notes**: Content transformed following Zero-Copy Policy. Core structure in place.

### 2. Principal Consultant - Data Engineering Content
- **Source**: `source-materials/Data_AI_1.md`
- **Source**: `source-materials/Data_AI_2.md`
- **Source**: `source-materials/Principal-Consultant.md`
- **Source**: `source-materials/Principal-Consultant-2.md`
- **Target**: `src/03_Interview-Prep/09_PrincipalConsultant-Data/` or `src/03_Interview-Prep/06_Solution-Architect/`
- **Status**: ⏳ Pending
- **Notes**: Comprehensive Principal Consultant interview prep covering Azure Data Engineering, Databricks, Fabric, PySpark, AI. Need to transform and organize.

### 3. TPM Interview Content
- **Source**: `source-materials/TPM-Behavioral-1.md`
- **Target**: `src/03_Interview-Prep/04_TPM/` (e.g., `11_Behavioral-Questions-and-Answers-Part1-D.md` or new file)
- **Status**: ⏳ Pending
- **Notes**: Behavioral questions for TPM interviews. Check if content overlaps with existing files.

- **Source**: `source-materials/TPM-MockInterview1.md`
- **Target**: `src/03_Interview-Prep/04_TPM/` (e.g., `07_Mock-Interview-Questions-Part1-E.md` or new file)
- **Status**: ⏳ Pending
- **Notes**: Mock interview questions with answers. Check if content overlaps with existing files.

- **Source**: `source-materials/TPM-SD-1.md`
- **Target**: `src/03_Interview-Prep/04_TPM/` (e.g., `04_System-Design-Questions-Part1-D.md` or new file)
- **Status**: ⏳ Pending
- **Notes**: System design questions for TPM. Check if content overlaps with existing files.

---

## 📋 Migration Checklist

- [ ] Review AI-.NET-Architect content and transform following Zero-Copy Policy
- [ ] Split AI-.NET-Architect content into 25-minute segments (150 lines max per file)
- [ ] Add YAML frontmatter to all migrated files
- [ ] Review Principal Consultant content and transform following Zero-Copy Policy
- [ ] Organize Principal Consultant content into appropriate folders
- [ ] Review TPM content and check for overlaps with existing files
- [ ] Transform and migrate TPM content following Zero-Copy Policy
- [ ] Update all cross-references after migration
- [ ] Run validation script to check file references
- [ ] Verify all migrated content follows content rules

---

## 🎯 Migration Strategy

1. **Review First**: Read each source file to understand content
2. **Transform**: Apply Zero-Copy Policy - create original structure, examples, and phrasing
3. **Split**: Break into 25-minute segments (150 lines max per file)
4. **Add Metadata**: Include required YAML frontmatter
5. **Cross-Reference**: Link to related content in ArchitectJourney
6. **Validate**: Run validation scripts and check for broken references

---

## 📝 Notes

- All migrations must follow the **Zero-Copy Policy** - no verbatim copying
- All content must be split into **25-minute learning segments** (150 lines max)
- All files must include **required YAML frontmatter**
- All content must be **transformative, not reformative**
- After migration, source files remain in `source-materials/` for user to delete manually

---

**Last Updated**: December 2, 2025

