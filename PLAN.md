---
title: "Plan — README Enhancement & AI-Context Guidance"
description: "Living plan for improving the root README, clarifying purpose and usage, and establishing user-supplied PLAN.md as the recommended dependency for efficient repo-kit adoption."
version: "1.0.0"
status: current
audience:
  - maintainers
  - adopters
  - ai-agents
doc_type: other
related:
  - README.md
  - SETUP.md
  - RULES.md
  - MARKDOWN-STANDARD.md
  - CHANGELOG.md
last_updated: "2026-07-26"
---

# Plan — README Enhancement & AI-Context Guidance

Living plan for the current enhancement cycle of the Repository Standards Kit. This document guides the improvement of the root landing page so that both humans and AI agents immediately understand the purpose of the kit and the recommended path to adopt it.

**Document version:** 1.0.0  
**Related:** [README.md](./README.md) · [SETUP.md](./SETUP.md) · [RULES.md](./RULES.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [CHANGELOG.md](./CHANGELOG.md)

---

## Summary

The kit already provides excellent portable standards (markdown structure, authority maps, templates, pylint gate, root hygiene). The root `README.md`, however, does not yet surface the strongest differentiator: the kit is deliberately structured so that **AI agents can dynamically build reliable context** for any repository that adopts it.

This plan defines the enhancement that closes that gap:

1. Rewrite the top of the root README so the first screen answers “What is this?” and “How do I start?” for both humans and agents.
2. Explicitly recommend that adopters create a comprehensive **project `PLAN.md`** (using any AI chat) before or during initiation. The quality of that plan directly determines the quality of the resulting authority map and documentation.
3. Keep the heavy procedural checklist inside the existing ephemeral `SETUP.md`; the README stays a light, scannable landing page.
4. Treat this `PLAN.md` itself as the living plan for the kit during the enhancement cycle.

**Key dependency for adopters:** a user-supplied `PLAN.md`. The kit does not ship one. Without a clear plan the kit still works, but results are less precise.

**Dependency for using the kit:** `git`.

---

## Contents

1. [Summary](#summary)
2. [Goals](#goals)
3. [Non-goals](#non-goals)
4. [Current state](#current-state)
5. [Target state](#target-state)
6. [Implementation steps](#implementation-steps)
7. [Recommended user workflow (for README)](#recommended-user-workflow-for-readme)
8. [Success criteria](#success-criteria)
9. [Verification](#verification)
10. [Related files & ownership](#related-files--ownership)
11. [Document history](#document-history)

---

## Goals

| # | Goal | Why it matters |
|---|------|----------------|
| 1 | Make the dual human + AI-agent value visible in the first screen of the root README | The GitHub description already claims the AI-context purpose; the landing page must match |
| 2 | Give adopters a clear, copy-pasteable “how to start” path that includes creating their own `PLAN.md` | Reduces cognitive load and improves the quality of authority-map fills |
| 3 | Keep the root README under the landing-page length guidance in MARKDOWN-STANDARD | Scannable for humans; low token cost for agents |
| 4 | Preserve SETUP.md as the single source of the full one-time checklist | Avoid duplication and root-hygiene violations |
| 5 | Establish this PLAN.md as the living plan for the current enhancement cycle | Provides high-quality context for future AI-assisted work on the kit itself |

---

## Non-goals

- Replacing or rewriting SETUP.md, RULES.md, or MARKDOWN-STANDARD.md in this cycle.
- Shipping a template PLAN.md inside the kit (adopters create their own).
- Changing the authority-map, verification, or pylint contracts.
- Adding automation or GitHub Actions in this cycle.

---

## Current state

- Root README correctly follows the landing pattern (no frontmatter, use-cases first).
- Strong tables exist (“You want to…”, “Use cases”, “What’s included”).
- The AI-context / dynamic-context benefit is present only in the GitHub repository description; it is invisible in the README.
- Quick-start is accurate but process-heavy (9 steps that largely belong in SETUP.md).
- No living PLAN.md currently exists in the kit (previous cycle’s PLAN.md was completed and removed).

---

## Target state

After this enhancement the root README will:

1. Open with a concise **Purpose** statement that names both human consistency and AI-agent context efficiency.
2. Explicitly recommend creating a comprehensive project `PLAN.md` (via any AI chat) as the highest-leverage input for adoption.
3. Provide a short, copy-pasteable **How to use** section that includes:
   - `git clone https://github.com/shainemeister/repo-kit`
   - Instructions to review / build context from the user’s PLAN.md + the kit’s SETUP.md (local or remote).
4. Point to SETUP.md for the full checklist.
5. Remain a light landing page; deep contracts stay in RULES / MARKDOWN-STANDARD / package docs.

This PLAN.md will remain as the kit’s living plan until the enhancement is complete and a new cycle begins.

---

## Implementation steps

| Step | Action | Owner / notes |
|------|--------|---------------|
| 1 | Draft the new Purpose + How-to block (already reviewed and approved in conversation) | Maintainers |
| 2 | Insert the block into README.md immediately after the H1 + short lead; soften the existing 9-step Quick start into a pointer to SETUP.md | Same change set as this PLAN.md or immediate follow-up |
| 3 | Add this PLAN.md at repository root | This commit |
| 4 | Update the “You want to…” or “Where to go next” tables if a direct link to PLAN.md improves discoverability | Optional, low priority |
| 5 | After the README change lands, record the enhancement under the next kit version section in CHANGELOG.md | When the README PR/commit ships |
| 6 | Once the enhancement is stable, consider whether this PLAN.md should be archived or kept as the ongoing kit plan | Future decision |

---

## Recommended user workflow (for README)

The following text is the canonical guidance that should appear (or be closely paraphrased) in the root README:

> **Best results come from a good project plan.**  
> Create a comprehensive `PLAN.md` for *your* target repository (goals, packages, platforms, constraints, desired outcomes) using an AI chat such as Grok, Gemini, ChatGPT, or others. The more specific the plan, the better the kit’s authority-map and templates can be applied. A dedicated prompt persona for generating high-quality PLAN.md files is planned for a future release.
>
> **Dependency:** `git`
>
> **How to use (quick path)**
>
> 1. Clone the kit (or keep it as a reference):
>
>    ```text
>    git clone https://github.com/shainemeister/repo-kit
>    ```
>
> 2. Give an AI agent (or yourself) the context it needs:
>
>    ```text
>    Review and build context from PLAN.md (your project plan)
>    and SETUP.md from ./repo-kit
>    ```
>
>    **Alternative (no local clone):**
>
>    ```text
>    Review and build context from PLAN.md (your project plan)
>    and SETUP.md at https://github.com/shainemeister/repo-kit
>    ```
>
> 3. Follow the full one-time checklist in SETUP.md, fill the authority map and verification table, then delete or archive SETUP.md.
>
> `PLAN.md` is a **user-provided dependency**. The kit does not ship one. Without a clear plan the adoption still works, but results are less precise.

---

## Success criteria

- [ ] Root README Purpose section explicitly mentions both human consistency and AI-agent context efficiency.
- [ ] Root README contains a short, copy-pasteable How-to section that references a user-supplied PLAN.md and SETUP.md.
- [ ] The full 9-step procedural checklist is no longer the primary Quick-start content; SETUP.md remains the authority.
- [ ] This PLAN.md exists at the repository root and is linked from the README or “Where to go next” if useful.
- [ ] CHANGELOG.md records the enhancement under the next kit version section when the README change ships.
- [ ] Landing-page length and tone still satisfy MARKDOWN-STANDARD guidance (scannable, under ~120 lines preferred for the top sections).

---

## Verification

| Check | Command / method |
|-------|------------------|
| README still validates as a landing page | Manual review against MARKDOWN-STANDARD.md § Landing / root README |
| Links resolve | Relative links from root to SETUP.md, RULES.md, etc. |
| No unresolved placeholders | Visual scan |
| PLAN.md follows substantial-doc pattern | Frontmatter present, Summary → Contents → body, history table |
| Kit baseline / versioning rules still hold | No change to RULES.md required for this step |

---

## Related files & ownership

| File | Role in this plan |
|------|-------------------|
| [README.md](./README.md) | Primary deliverable of the enhancement |
| [SETUP.md](./SETUP.md) | Unchanged source of the full adoption checklist |
| [RULES.md](./RULES.md) | Unchanged; authority map and kit baseline remain the long-term contracts |
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Unchanged; defines the landing-page pattern this plan respects |
| [CHANGELOG.md](./CHANGELOG.md) | Will record the completed enhancement under the next `### [X.Y.Z]` section |
| This PLAN.md | Living plan for the current cycle; high-quality context for AI agents working on the kit |

---

## Document history

| Version | Date | Notes |
|---------|------|-------|
| 1.0.0 | 2026-07-26 | Initial plan created for the README purpose/how-to enhancement and introduction of user-supplied PLAN.md guidance. |
