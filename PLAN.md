---
title: "Plan — Upgrade Instructions for Existing Adopters"
description: "Living plan to improve discoverability and clarity of the kit upgrade path for repositories that already adopted an earlier version. Emphasizes CHANGELOG as the critical artifact and keeps changes low-churn."
version: "1.0.0"
status: current
audience:
  - maintainers
  - adopters
  - ai-agents
doc_type: other
related:
  - README.md
  - RULES.md
  - CHANGELOG.md
  - SETUP.md
last_updated: "2026-07-26"
---

# Plan — Upgrade Instructions for Existing Adopters

Living plan for a focused enhancement of the Repository Standards Kit. The goal is to make the existing upgrade path clearer and more discoverable for repositories that already have a kit baseline, without adding process weight or changing the core contracts.

**Document version:** 1.0.0  
**Related:** [README.md](./README.md) · [RULES.md](./RULES.md) · [CHANGELOG.md](./CHANGELOG.md) · [SETUP.md](./SETUP.md)

---

## Summary

The kit already has a correct upgrade mechanism:

- Durable **Kit baseline** table in every adopting project’s `RULES.md`
- Clear 7-step **Upgrading the kit (post-initiation)** procedure in `RULES.md`
- `CHANGELOG.md` (under `## repo-kit`) as the single source of truth for kit versions

However, existing adopters often miss the path because:

1. The upgrade procedure is buried deep in RULES.md.
2. Guidance on *how* to use the kit CHANGELOG when upgrading is good but can be one sentence sharper.
3. There is no lightweight, copy-pasteable AI prompt for upgrades (parallel to the adoption prompts).

This plan makes the upgrade path more visible and explicit while remaining low-churn. **CHANGELOG.md remains the critical artifact** — adopters read the entries between their current baseline and the latest version, decide what to merge, update their baseline, and record only a short note in their own project CHANGELOG.

---

## Contents

1. [Summary](#summary)
2. [Goals](#goals)
3. [Non-goals](#non-goals)
4. [Current state](#current-state)
5. [Target state](#target-state)
6. [Implementation steps](#implementation-steps)
7. [Recommended AI upgrade prompt](#recommended-ai-upgrade-prompt)
8. [Success criteria](#success-criteria)
9. [Verification](#verification)
10. [Related files & ownership](#related-files--ownership)
11. [Document history](#document-history)

---

## Goals

| # | Goal | Why it matters |
|---|------|----------------|
| 1 | Make the upgrade path discoverable from the root README | Existing adopters should not have to dig through RULES.md to find how to upgrade |
| 2 | Strengthen CHANGELOG guidance inside the upgrade steps | Adopters must read only the relevant kit CHANGELOG entries and must never copy the full kit history into their project CHANGELOG |
| 3 | Provide a short, copy-pasteable AI prompt for upgrades | Parallel to the adoption prompts; helps agents upgrade safely while preserving project-specific authority maps and verification tables |
| 4 | Keep the change set small | No structural redesign; only clarity and discoverability |

---

## Non-goals

- Changing the Kit baseline table structure or the 7-step upgrade sequence itself.
- Adding automation, scripts, or GitHub Actions for upgrades.
- Altering how kit versions are recorded in CHANGELOG.md.
- Creating a new top-level “UPGRADE.md” file (prefer linking into existing RULES.md).
- Expanding the security or style-gate content in this cycle.

---

## Current state

- `RULES.md` § Upgrading the kit (post-initiation) is accurate and complete.
- Kit baseline is required and correctly documented.
- CHANGELOG.md is the authoritative history under `## repo-kit`.
- Anti-pattern guidance already says “do not put kit release history into a project CHANGELOG”.
- Root README has no dedicated “Upgrading an existing adoption” entry point.
- No AI-oriented upgrade prompt exists yet.

---

## Target state

After this enhancement:

1. Root README contains a short, visible pointer (or small subsection) for existing adopters that links to the RULES upgrade procedure and stresses the role of the kit CHANGELOG.
2. The upgrade steps in RULES.md include one explicit sentence:

   > Read only the kit CHANGELOG entries since your current Adopted kit version; merge only what you need; never copy the full kit history into the project CHANGELOG.

3. A recommended AI upgrade prompt is available (in README or RULES) so agents can help with the process while preserving project-specific content.
4. The change is recorded in the kit CHANGELOG under a new version section.
5. No other contracts or file structures are altered.

---

## Implementation steps

| Step | Action | Notes |
|------|--------|-------|
| 1 | Add a short “Upgrading an existing adoption” entry to the root README | Preferred location: under “Where to go next” or a small new subsection near Quick start / Purpose. Keep it to 3–5 lines + link to RULES.md § Upgrading the kit. |
| 2 | Strengthen the upgrade procedure in RULES.md | Insert the explicit CHANGELOG sentence into the existing 7-step list (after step 3 or as part of step 3). Do not renumber or rewrite the whole section. |
| 3 | Add the recommended AI upgrade prompt | Place it near the new README pointer or inside the RULES upgrade section. Keep it short and parallel in style to the existing adoption prompts. |
| 4 | (Optional) Add one reinforcing line to the anti-patterns table if needed | Only if the existing anti-pattern wording is not already clear enough. |
| 5 | Record the enhancement in CHANGELOG.md | New kit version section (e.g. `### [1.1.6] - YYYY-MM-DD`) under `## repo-kit`. |
| 6 | After implementation, this PLAN.md may be archived or kept as the living plan for the cycle | Follow the same pattern used for prior completed cycles. |

---

## Recommended AI upgrade prompt

Use (or closely paraphrase) the following as the canonical prompt example:

```text
I have an existing repository that already adopted repo-kit.
Current Adopted kit version is recorded in my RULES.md Kit baseline table.

Please:
1. Read the kit CHANGELOG.md at https://github.com/shainemeister/repo-kit (or the local clone) and show me only the entries since my current baseline version.
2. Help me decide which pieces to merge (RULES policy sections, MARKDOWN-STANDARD, templates, configs/pylintrc, etc.) while preserving my project-specific authority map and verification commands.
3. Update my Kit baseline (version + date) and add a short note to my project CHANGELOG.md.
Do not copy the full kit CHANGELOG history into my project CHANGELOG.
```

---

## Success criteria

- [ ] Root README has a visible, short pointer for existing adopters that links to the RULES upgrade procedure.
- [ ] RULES.md upgrade steps explicitly instruct readers to use only the relevant CHANGELOG entries and never to copy the full kit history.
- [ ] A short, copy-pasteable AI upgrade prompt is present.
- [ ] No structural changes to Kit baseline, CHANGELOG format, or the overall upgrade sequence.
- [ ] CHANGELOG.md records the enhancement under a new kit version section.
- [ ] The change set remains small and focused on clarity/discoverability.

---

## Verification

| Check | Method |
|-------|--------|
| README pointer is easy to find and links correctly | Manual review |
| RULES upgrade steps contain the strengthened CHANGELOG sentence | Read the section |
| AI prompt is clear and preserves project-specific content | Review wording |
| Relative links and anchors still resolve | Visual check |
| No unresolved placeholders introduced | Visual scan |
| Kit CHANGELOG receives a new dated version section | Confirm after commit |

---

## Related files & ownership

| File | Role in this plan |
|------|-------------------|
| [README.md](./README.md) | Primary discoverability target — short upgrade pointer + optional AI prompt |
| [RULES.md](./RULES.md) | Strengthen the existing Upgrading the kit section; keep structure intact |
| [CHANGELOG.md](./CHANGELOG.md) | Records the completed enhancement; remains the critical artifact for upgraders |
| [SETUP.md](./SETUP.md) | No change required (initiation path already correct) |
| This PLAN.md | Living plan for the cycle; high-quality context for the implementing AI |

---

## Document history

| Version | Date | Notes |
|---------|------|-------|
| 1.0.0 | 2026-07-26 | Initial plan created for upgrade-instructions enhancement focused on existing adopters and CHANGELOG clarity. |
