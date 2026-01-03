# PowerShell Scripts for ArchitectJourney

**Location**: `tools/psscripts/`  
**Purpose**: Automation scripts for content validation, health checks, and repository maintenance

---

## 📋 Available Scripts

### Health Check & Validation

#### `Quick-HealthCheck.ps1`
Fast workspace health check - validates basic structure, file counts, and compliance.

**Usage:**
```powershell
.\tools\psscripts\Quick-HealthCheck.ps1
```

**Checks:**
- File structure (01_Reference, 02_Learning, 03_Interview-Prep)
- Markdown file counts
- Basic naming conventions
- YAML frontmatter presence

---

#### `Validate-FileReferences.ps1`
Validates all file references in markdown files to ensure they point to existing files.

**Usage:**
```powershell
.\tools\psscripts\Validate-FileReferences.ps1
.\tools\psscripts\Validate-FileReferences.ps1 -Path "src\03_Interview-Prep"
```

**Features:**
- Scans all markdown files for references
- Validates relative paths
- Reports broken references
- Supports path filtering

---

#### `Review-EducationalContent.ps1`
General compliance review for educational content rules.

**Usage:**
```powershell
.\tools\psscripts\Review-EducationalContent.ps1
.\tools\psscripts\Review-EducationalContent.ps1 -Path "src\01_Reference"
```

**Checks:**
- YAML frontmatter compliance
- Line count (≤150 lines)
- File naming conventions
- Cross-reference validation

---

### Analysis & Statistics

#### `Get-FileStats.ps1`
File statistics analysis - provides detailed statistics about files in the repository.

**Usage:**
```powershell
.\tools\psscripts\Get-FileStats.ps1
.\tools\psscripts\Get-FileStats.ps1 -Path "src\03_Interview-Prep"
```

---

#### `Get-MarkdownSummary.ps1`
Markdown file analysis - summarizes markdown files with key metrics.

**Usage:**
```powershell
.\tools\psscripts\Get-MarkdownSummary.ps1
```

---

#### `Get-RepoStats.ps1`
Repository overview - provides high-level repository statistics.

**Usage:**
```powershell
.\tools\psscripts\Get-RepoStats.ps1
```

---

### Comparison & Duplication

#### `Compare-DocFiles.ps1`
Compare multiple files for similarities and differences.

**Usage:**
```powershell
.\tools\psscripts\Compare-DocFiles.ps1 -File1 "path1.md" -File2 "path2.md"
```

---

#### `Find-DuplicateContent.ps1`
Find duplicate headings and content patterns across files.

**Usage:**
```powershell
.\tools\psscripts\Find-DuplicateContent.ps1
```

---

### Comprehensive Reviews

#### `Comprehensive-ReferenceReview.ps1`
Deep dive review with CoT/ReAct methodology for file references.

**Usage:**
```powershell
.\tools\psscripts\Comprehensive-ReferenceReview.ps1
```

---

#### `Comprehensive-WorkspaceReview.ps1`
Full workspace validation - comprehensive review of all content.

**Usage:**
```powershell
.\tools\psscripts\Comprehensive-WorkspaceReview.ps1
```

---

### Fix & Repair

#### `Fix-BrokenFileReferences.ps1`
# PowerShell Scripts

**Location**: `tools/psscripts/`

**Purpose**: Automation scripts for validation and repository maintenance (Windows 11 + PowerShell).

---

## 📋 Script Set (Standardized)

### Health Check & Validation

#### `RepoConfig.psd1`

Per-repo settings consumed by shared scripts (keeps behavior consistent across repos while allowing repo-specific structure/policy).

---

#### `Quick-HealthCheck.ps1`

Fast workspace health check. Reads expected folders from `RepoConfig.psd1`.

**Usage:**

```powershell
.\tools\psscripts\Quick-HealthCheck.ps1
```

---

#### `Validate-FileReferences.ps1`

Validates markdown file references point to existing files.

**Usage:**

```powershell
.\tools\psscripts\Validate-FileReferences.ps1
.\tools\psscripts\Validate-FileReferences.ps1 -Path "src"
```

---

#### `Test-ContentCompliance.ps1`

Repository content-policy checks (rules vary by repo via `RepoConfig.psd1`).

**Usage:**

```powershell
.\tools\psscripts\Test-ContentCompliance.ps1
```

---

#### `Verify-ZeroCopy.ps1`

Helps detect accidental verbatim copying from `source-material/` into `src/`.

**Usage:**

```powershell
.\tools\psscripts\Verify-ZeroCopy.ps1
.\tools\psscripts\Verify-ZeroCopy.ps1 -Strict
```

---

### Linting & Link Checking

#### `Run-MarkdownLintAndLychee.ps1`

Runs Markdown lint (`markdownlint-cli2`) and link checking (Lychee) using repo `lychee.toml`.

**Usage:**

```powershell
.\tools\psscripts\Run-MarkdownLintAndLychee.ps1
.\tools\psscripts\Run-MarkdownLintAndLychee.ps1 -IncludeSourceMaterials
```

---

### Repo Stats / Utilities

- `Get-RepoStats.ps1`
- `Get-FileStats.ps1`
- `Get-MarkdownSummary.ps1`
- `Compare-DocFiles.ps1`
- `Find-DuplicateContent.ps1`

---

### One-off Maintenance

#### `reorder-url-shortener.ps1`

Legacy helper preserved for history; no longer performs renames/reorders.

---

## 🚀 Quick Start

```powershell
.\tools\psscripts\Quick-HealthCheck.ps1
.\tools\psscripts\Validate-FileReferences.ps1
.\tools\psscripts\Run-MarkdownLintAndLychee.ps1
```

---

## 🔗 Related Documentation

- [Educational Content Rules](../../.cursor/rules/01_educational-content-rules.mdc)
- [Repository Structure](../../.cursor/rules/02_repository-structure.mdc)
- [Quality Assurance](../../.cursor/rules/03_quality-assurance.mdc)

