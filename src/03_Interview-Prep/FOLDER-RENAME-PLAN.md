# Folder Rename Plan - Progressive Structure

**Date**: November 29, 2025  
**Purpose**: Rename folders in `03_Interview-Prep/` to progressive numbering for logical learning flow

---

## 🎯 Proposed Progressive Structure

### Learning Flow Logic

1. **Foundation** → Start with reference materials
2. **Common Skills** → Shared interview skills
3. **Practice Scenarios** → System design practice
4. **Role-Specific** → Apply to specific roles

---

## 📋 Proposed Renaming

### Current → Proposed

| Current Name | Proposed Name | Rationale |
|--------------|---------------|-----------|
| `01_Glossary/` | `01_Glossary/` | ✅ **Keep** - Foundation reference (already numbered) |
| `02_Common/` | `02_Common/` | ✅ **Keep** - Shared skills (already numbered) |
| `SystemDesign/` | `03_System-Design-Scenarios/` | 📝 **Rename** - Practice scenarios (per proposal) |
| `TPM/` | `04_TPM/` | 📝 **Rename** - Role-specific prep |
| `Software-Architect/` | `05_Software-Architect/` | 📝 **Rename** - Role-specific prep |
| `Solution-Architect/` | `06_Solution-Architect/` | 📝 **Rename** - Role-specific prep |
| `AI-Architect/` | `07_AI-Architect/` | 📝 **Rename** - Role-specific prep |
| `Engineering-Manager/` | `08_Engineering-Manager/` | 📝 **Rename** - Role-specific prep |
| `PrincipalConsultant-Data/` | `09_PrincipalConsultant-Data/` | 📝 **Rename** - Role-specific prep |

---

## 📁 Final Structure

```
03_Interview-Prep/
├── 01_Glossary/                    # Foundation: Terminology reference
│   ├── 01_Interview-Glossary-Part1-A.md
│   ├── 01_Interview-Glossary-Part1-B.md
│   └── README.md
│
├── 02_Common/                      # Shared: Common interview skills
│   ├── 01_STAR-Method/
│   ├── 02_SystemDesign/
│   ├── 03_DesignPatterns/          # (Empty - to move to Reference)
│   └── 04_SOLIDPrinciples/        # (Empty - to move to Reference)
│
├── 03_System-Design-Scenarios/     # Practice: Deep-dive scenarios
│   ├── VideoConferencing/
│   └── LiveStreaming/
│
├── 04_TPM/                         # Role: Technical Project Manager
│   └── [TPM content]
│
├── 05_Software-Architect/          # Role: Software Architect
│   └── [Software Architect content]
│
├── 06_Solution-Architect/          # Role: Solution Architect
│   └── [Solution Architect content]
│
├── 07_AI-Architect/                # Role: AI Architect
│   └── [AI Architect content]
│
├── 08_Engineering-Manager/        # Role: Engineering Manager
│   └── [Engineering Manager content]
│
└── 09_PrincipalConsultant-Data/    # Role: Principal Consultant - Data
    └── [Data Consultant content]
```

---

## 🔄 Files That Need Reference Updates

### Files with folder references to update:

1. **`01_Glossary/01_Interview-Glossary-Part1-A.md`**
   - References: `../02_Common/`, `../SystemDesign/`
   - Update to: `../02_Common/`, `../03_System-Design-Scenarios/`

2. **`01_Glossary/01_Interview-Glossary-Part1-B.md`**
   - References: `../AI-Architect/`, `../TPM/`, `../SystemDesign/`
   - Update to: `../07_AI-Architect/`, `../04_TPM/`, `../03_System-Design-Scenarios/`

3. **`01_Glossary/README.md`**
   - References: `../SystemDesign/`
   - Update to: `../03_System-Design-Scenarios/`

4. **`02_Common/README.md`**
   - References: `../TPM/`, `../Software-Architect/`, etc.
   - Update to: `../04_TPM/`, `../05_Software-Architect/`, etc.

5. **`README.md`** (main Interview-Prep README)
   - References: `Common/`, `TPM/`, `Software-Architect/`, etc.
   - Update to: `02_Common/`, `04_TPM/`, `05_Software-Architect/`, etc.

6. **Any other files** that reference these folders

---

## ✅ Benefits of Progressive Structure

1. **Logical Learning Flow**: Numbered sequence guides users through preparation
2. **Easy Navigation**: Clear progression from foundation → practice → role-specific
3. **Consistent Naming**: All folders follow `NN_Name` pattern
4. **Aligned with Proposal**: Matches Reference-First structure proposal

---

## 🚨 Action Plan

### Step 1: Rename Folders
- [ ] Rename `SystemDesign/` → `03_System-Design-Scenarios/`
- [ ] Rename `TPM/` → `04_TPM/`
- [ ] Rename `Software-Architect/` → `05_Software-Architect/`
- [ ] Rename `Solution-Architect/` → `06_Solution-Architect/`
- [ ] Rename `AI-Architect/` → `07_AI-Architect/`
- [ ] Rename `Engineering-Manager/` → `08_Engineering-Manager/`
- [ ] Rename `PrincipalConsultant-Data/` → `09_PrincipalConsultant-Data/`

### Step 2: Update References
- [ ] Update `01_Glossary/` files
- [ ] Update `02_Common/README.md`
- [ ] Update main `README.md`
- [ ] Search and update any other references

### Step 3: Verify
- [ ] Check all file references are valid
- [ ] Verify folder structure
- [ ] Test navigation links

---

## 📝 Notes

- **Git-friendly**: Folder renames in Git preserve history
- **Reference updates**: All markdown links need updating
- **Backward compatibility**: Consider if any external references exist

---

**Status**: ⏳ **PENDING APPROVAL**

