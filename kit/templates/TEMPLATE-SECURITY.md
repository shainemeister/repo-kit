---
title: "{{PRODUCT_NAME}} Security"
description: "{{DESCRIPTION}}"
version: "{{VERSION}}"
status: draft
audience:
  - security
  - developers
  - it
doc_type: security
related:
  - README.md
  - CLI-GUIDE.md
last_updated: "{{LAST_UPDATED}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{PRODUCT_NAME}} — Security & Execution Notes

{{ONE_LINE_PURPOSE}}

**Package version:** {{VERSION}}  
**Package folder:** `{{FOLDER_NAME}}/`  
**Runtime:** {{RUNTIME}}

**Related docs:** [README.md](./README.md) · [CLI-GUIDE.md](./CLI-GUIDE.md)

> **Modularity:** Omit **this file** when the package has no execution surface, network access, elevated privilege, or secrets/identity handling. Docs-only or pure libraries with no runtime side effects should not create an empty `SECURITY.md` — see [Security documentation modularity](../rules/security.md#security-documentation-modularity).

<!-- Replace {{PLACEHOLDERS}}. Delete commented `keywords` if unused. Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Trust boundary

| Area | Behavior |
|------|----------|
| **Privilege** | {{PRIVILEGE}} |
| **Network** | {{NETWORK}} |
| **Secrets / identity** | {{IDENTITY}} |

---

## Purpose of this document

omit if: the lead plus Trust boundary already state the security posture.

Summarize what the product does from a security perspective. Do not reprint the trust-boundary table.

---

## Unacceptable patterns

omit if: the project has no listed anti-patterns beyond the trust boundary.

| Pattern | Why sensitive | Status here |
|---------|---------------|-------------|
| {{PATTERN}} | {{WHY}} | {{STATUS}} |

---

## Required allowances

omit if: no enterprise or IT allowances beyond normal user privileges.

| Capability | Used for | Typical gate |
|------------|----------|--------------|
| {{CAPABILITY}} | {{USED_FOR}} | {{GATE}} |

---

## Runtime restrictions

omit if: runtime is a single declared host with no allowlists.

| Item | Expectation |
|------|-------------|
| **Version / host** | {{RUNTIME}} |
| **Libraries** | {{LIBRARIES}} |

{{CONTROLS_NOTES}}

---

## Recommended validation

omit if: validation lives only in the project verification table (link that table instead of a second command list).

Keep both OS blocks when multi-platform; drop the unused OS when primary platform is single and declared. Prefer language-specific developer gates from the project [language surface inventory](../rules/security.md#language-surface-inventory) and [Security / SAST gates](../rules/security.md#security--sast-gates-required-when-declared) only for languages this package ships.

**Windows**

```bat
{{VALIDATION_COMMANDS}}
```

**Linux / macOS**

```bash
{{VALIDATION_COMMANDS}}
```

---

## Audit snapshot

omit if: no extra decisions beyond the trust-boundary table.

| Decision | Rationale |
|----------|-----------|
| {{DECISION}} | {{RATIONALE}} |

---

## Statement for reviewers

omit if: reviewers only need the trust-boundary table.

> {{REVIEWER_STATEMENT}}

---

## Related files

omit if: peers are already in Related docs / `related:`.

| Path | Role |
|------|------|
| `{{PATH}}` | {{ROLE}} |

---

## Document history

| Version | Notes |
|---------|--------|
| {{VERSION}} | Initial security notes |
