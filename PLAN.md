---
title: "Plan — AI-Assisted Commit Disclosure"
description: "Implementation plan to require transparent AI disclosure footers on commits that use AI assistance, aligned with RULES.md git and versioning contracts."
version: "0.1.0"
status: draft
audience:
  - developers
  - maintainers
doc_type: other
related:
  - RULES.md
  - CHANGELOG.md
  - README.md
last_updated: "2026-07-25"
---

# Plan — AI-Assisted Commit Disclosure

Add required, auditable disclosure when AI assists with repository changes, so commit history remains transparent and consistent with the kit’s own contracts.

**Document version:** 0.1.0  
**Related:** [RULES.md](./RULES.md) · [CHANGELOG.md](./CHANGELOG.md) · [README.md](./README.md)

---

## Summary

This plan delivers a small, high-value enhancement to the **Git rules** section of `RULES.md`:

- Require a standardized three-line footer on any commit where AI meaningfully assisted (code, docs, config, or the commit message itself).
- Use the emerging open-source trailer `Assisted-by:` plus explicit `Compliance:` and `Instructed-by:` lines that reference this kit’s `RULES.md`.
- Keep the change inside the existing authority surface, follow the kit’s Conventional Commits voice, and ship with correct version bumps and CHANGELOG entry per the versioning rules in `RULES.md`.

After the work is merged and verified, this `PLAN.md` is deleted or archived (same lifecycle as the previous completed plan).

---

## Contents

1. [Summary](#summary)
2. [Goal and success criteria](#goal-and-success-criteria)
3. [Scope](#scope)
4. [Design decisions](#design-decisions)
5. [File and content changes](#file-and-content-changes)
6. [Versioning impact (per RULES.md)](#versioning-impact-per-rulesmd)
7. [Implementation steps](#implementation-steps)
8. [Verification](#verification)
9. [Acceptance criteria](#acceptance-criteria)
10. [Post-completion](#post-completion)
11. [Document history](#document-history)

---

## Goal and success criteria

**Goal**  
Make AI participation in any change visible, attributable, and explicitly tied to the maintenance contracts in `RULES.md`, without cluttering subject lines or inventing non-standard free-form text.

**Success criteria**

| Criterion | Measure |
|-----------|---------|
| Disclosure is required | Footer appears on every AI-assisted commit |
| Format is stable | Three fixed trailers; copy-paste ready |
| Human remains accountable | `Instructed-by:` always names the directing human |
| Machine-scannable | Starts with the community trailer `Assisted-by:` |
| Authority preserved | Change lives only in `RULES.md` Git rules + supporting version/CHANGELOG surfaces |
| Versioning correct | Kit version, RULES document version, and CHANGELOG entry updated in the same change set |
| Plan is ephemeral | `PLAN.md` removed after the enhancement ships |

---

## Scope

### In scope

- New subsection under **Commit message format** in `RULES.md`.
- Updates to the existing Optional footers table, pre-commit message check list, and Contributor checklist.
- One good and one bad example that demonstrate the new footer.
- Document version bump + Document history row in `RULES.md`.
- Matching kit release entry in `CHANGELOG.md` under `## repo-kit`.
- This `PLAN.md` itself (created, executed, then deleted).

### Out of scope

- Changes to `MARKDOWN-STANDARD.md`, templates, or examples (unless a one-line cross-reference is later desired).
- Git hooks, CI enforcement, or tooling that auto-appends the footer.
- Changing the Conventional Commits type/scope rules already present.
- Retroactive rewriting of existing commit history.
- Any product-code or pylint changes.

---

## Design decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Trailer style | `Assisted-by:` + `Compliance:` + `Instructed-by:` | Aligns with Linux Kernel / Fedora / Apache guidance while satisfying the explicit “compliance with RULES.md + signed by AI as instructed by User” requirement |
| Placement | End of commit message (after body / other footers) | Keeps subject focused on the change; matches existing optional-footer pattern |
| When required | Meaningful AI assistance on the change or the message itself | Avoids noise on pure human work; still captures the common case |
| Subject line | Never put AI disclosure in the subject | Preserves long-term readability and Conventional Commits scannability |
| Kit version impact | Patch release (`1.1.2`) | Additive policy clarification on top of the stronger commit guidance already shipped in 1.1.0 / 1.1.1 |
| RULES document version | `1.2.2` | Parallel patch on the document that owns the contract |
| Plan lifecycle | Create → execute → delete | Matches prior completed PLAN.md pattern recorded in kit CHANGELOG |

**Canonical footer form (final target)**

```text
Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Shaine Meister
```

---

## File and content changes

| File | Change |
|------|--------|
| `RULES.md` | Insert new `#### AI-assisted commits (required disclosure)` subsection after the Optional footers table. Update Optional footers table, pre-commit checklist, Contributor checklist, Document history, frontmatter version + last_updated. |
| `CHANGELOG.md` | Under `## repo-kit` add `### [1.1.2] - 2026-07-25` (or current date) with `#### Added` / `#### Changed` entries describing the disclosure rule. |
| `PLAN.md` | This file (status: draft → completed, then removed). |
| Other files | None required for the minimal viable enhancement. |

**Exact content to add to RULES.md** (already reviewed and agreed in prior discussion):

```markdown
#### AI-assisted commits (required disclosure)

When an AI system meaningfully assists with the **change itself** (code, docs, configuration, or the commit message), the commit **must** include the following footer block. Pure human-only commits omit it.

| Trailer | Required content |
|---------|------------------|
| `Assisted-by:` | AI make / model (and optional tool) |
| `Compliance:` | Explicit reference to this file |
| `Instructed-by:` | Human who directed the AI |

**Canonical form** (copy-paste ready):

```text
Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Shaine Meister
```

**Rules**

1. Place the three lines at the end of the commit message (after any body or other footers).
2. Use the real AI make/model that performed the work (e.g. `Grok (xAI)`, `Claude 4 Sonnet`, `GitHub Copilot`).
3. `Instructed-by` is the human who requested or reviewed the AI work; never omit it.
4. The presence of this block asserts that the human reviewed the result and that the change follows the contracts in this RULES.md.
5. Do **not** put the AI disclosure in the subject line. Keep the subject focused on the change.

**When it is required**

| Situation | Disclosure |
|-----------|------------|
| AI wrote or substantially edited product code, docs, or config | **Required** |
| AI drafted the commit message itself | **Required** |
| AI only suggested a one-line fix that the human rewrote | Optional (prefer to include) |
| Pure human work | Omit |

**Good example**

```text
docs(rules): require AI disclosure footer on assisted commits

Add Assisted-by / Compliance / Instructed-by trailers so AI
participation is transparent and auditable years later.

Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Shaine Meister
```
```

Supporting micro-edits inside the same RULES.md change set:

- Optional footers table: note that the AI block is required when applicable.
- Pre-commit message check: add “If AI assisted, are the three disclosure trailers present?”
- Contributor checklist: add the same item.
- Document history table: new row for 1.2.2.

---

## Versioning impact (per RULES.md)

Follow the three version surfaces and “same change set” rules exactly.

| Surface | Current | Target after this work | Action |
|---------|---------|------------------------|--------|
| **Kit version** | 1.1.1 (latest under `## repo-kit`) | **1.1.2** | Add dated `### [1.1.2] - YYYY-MM-DD` section in `CHANGELOG.md` |
| **RULES.md document version** | 1.2.1 | **1.2.2** | Update YAML frontmatter `version` + `last_updated`; add Document history row |
| **Project / package version** | N/A (this is the kit) | — | Not applicable |
| **This PLAN.md** | 0.1.0 (draft) | Completed then removed | No kit version impact; lifecycle note in CHANGELOG |

**CHANGELOG entry shape (required)**

```markdown
### [1.1.2] - 2026-07-25

#### Added

- Required AI-assisted commit disclosure footers (`Assisted-by`, `Compliance`, `Instructed-by`) in RULES.md Git rules.

#### Changed

- RULES.md document version 1.2.1 → 1.2.2; strengthened pre-commit and contributor checklists for AI transparency.
```

No Unreleased section. The entry is written in the same change set that lands the RULES.md edits.

---

## Implementation steps

Execute in this order so every intermediate state stays coherent with the authority map and versioning rules.

1. **Confirm design** (this PLAN) — already done; freeze the three-trailer form.
2. **Edit RULES.md**
   - Insert the new `#### AI-assisted commits…` subsection.
   - Update Optional footers, pre-commit check, Contributor checklist.
   - Bump frontmatter to `version: "1.2.2"`, `last_updated: "2026-07-25"`.
   - Append Document history row for 1.2.2.
3. **Edit CHANGELOG.md**
   - Append the `### [1.1.2] - 2026-07-25` section under `## repo-kit` with the Added/Changed bullets above.
4. **Self-commit the enhancement** using the new rule:
   ```text
   docs(rules): require AI disclosure footer on assisted commits

   Add Assisted-by / Compliance / Instructed-by trailers and supporting
   checklist updates. Ship as kit 1.1.2 / RULES 1.2.2.

   Assisted-by: Grok (xAI)
   Compliance: RULES.md
   Instructed-by: Shaine Meister
   ```
5. **Verify** (see next section).
6. **Close the plan** — delete or archive `PLAN.md` in a follow-up commit (`docs: remove completed AI-disclosure PLAN.md`) that itself carries the disclosure footer.

---

## Verification

| Check | Command / method |
|-------|------------------|
| Markdown structure | Author checklist in MARKDOWN-STANDARD.md (frontmatter, Summary, Contents, relative links) |
| Version consistency | Frontmatter `version` == Document history table == status line |
| CHANGELOG hierarchy | `## repo-kit` → `### [1.1.2]` → `####` categories; no Unreleased |
| Disclosure present on the shipping commit | `git log -1 --pretty=%B` shows the three trailers |
| Authority map still accurate | No new paths that would require an inventory update |
| No secrets / regenerable artifacts | Standard pre-commit review |

No pylint or product-test gate applies (docs-only change).

---

## Acceptance criteria

- [ ] `RULES.md` contains the full AI-assisted commits subsection with the exact three-trailer form.
- [ ] Optional footers, pre-commit check, and Contributor checklist reference the new requirement.
- [ ] RULES.md frontmatter and Document history show version **1.2.2** and today’s date.
- [ ] `CHANGELOG.md` contains a complete `### [1.1.2] - …` section under `## repo-kit`.
- [ ] The commit that lands the above uses the new disclosure footer.
- [ ] `PLAN.md` is removed (or clearly archived) after the enhancement is live.
- [ ] A future reader can locate the rule by searching “Assisted-by” or “AI-assisted commits” and immediately understands the compliance obligation.

---

## Post-completion

1. Delete this `PLAN.md` (or move to an archive location if the maintainer prefers a historical record).
2. Record the removal in the next kit CHANGELOG entry if desired (optional; pure housekeeping).
3. Future AI-assisted work on the kit itself must carry the disclosure footer from that point forward.
4. Adopters who upgrade to kit ≥ 1.1.2 inherit the rule automatically via the updated `RULES.md`.

---

## Document history

| Version | Notes |
|---------|--------|
| 0.1.0 | Initial comprehensive plan for AI-assisted commit disclosure; targets kit 1.1.2 / RULES 1.2.2 |
