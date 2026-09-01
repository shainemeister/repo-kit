---
title: "{{PROGRAM_ID}} — order of operations"
description: Owns goals, constraints, phased order of operations, verification, and risks for one program. Open while that program is active on the workboard.
version: "1.1.0"
status: draft
audience:
  - ai-agents
  - developers
doc_type: plan
related:
  - ./README.md
  - ../../WORKBOARD.md
  - ../../../PLAN.md
  - ../../../kit/rules/workboard.md
last_updated: "{{ISO_DATE}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{PROGRAM_NAME}} — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)  
**PLAN.md peer:** omit-if the repo has no root `PLAN.md` (keep 3–4 other `related:` peers).

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| G1 | {{GOAL}} |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| {{OUT_OF_SCOPE}} | {{WHY}} |

### Invariants (hard)

```text
{{QUALITY_OR_CONTRACT_INVARIANT}}
```

---

## 2. Constraint map

Facts that **bound** the OOO (current architecture, not a wish list).

| Fact | Implication for the OOO |
|------|-------------------------|
| {{FACT}} | {{IMPLICATION}} |

**Surfaces this program may touch** (name them; leave others alone):

| Surface | Paths (from authority map) |
|---------|----------------------------|
| {{SURFACE}} | {{PATHS}} |

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **{{P0}}** | {{ALLOW_PATHS}} | {{DENY_PATHS}} |

---

## 3. Master order of operations

```text
{{P0}} {{PHASE_NAME}}
   → {{EXIT_CRITERION}}
        │
        ▼
{{P1}} …
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **{{P0}}** | {{THEME}} | {{DEPENDENCY}} | {{EXIT_CRITERION}} |

Defer per-phase implementation detail until that phase is `active` on the board.

### Active phase brief *(omit-if board-only program)*

Fill **only** the phase that is `active` on the board, plus the next `open` if needed to start it. Later phases: omit until activated.

### {{ACTIVE_PHASE_ID}}

{{ACTIVE_PHASE_BRIEF}}

---

## 4. Verification

| Phase | Declared gates / checks |
|-------|-------------------------|
| {{P0}} | {{COMMANDS_FROM_VERIFICATION_TABLE}} |

Do not invent gates that are not in the project inventory / verification table.

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners to update |
|-------|---------------------|
| {{P0}} | {{PATHS_OR_dash}} |

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| {{RISK}} | {{REVERT_OR_GATE}} |

Replace every `{{PLACEHOLDER}}`. Delete commented `keywords` if unused.
