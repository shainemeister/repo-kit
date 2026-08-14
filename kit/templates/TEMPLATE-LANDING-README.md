# {{PRODUCT_NAME}}

{{ONE_LINE_PURPOSE}}

## Overview

{{SUMMARY_PARAGRAPH}}

This repository keeps portable standards under `kit/`. Product code and project history stay outside `kit/`. Maintenance hub: [kit/RULES.md](./kit/RULES.md).

| You want to… | Start here |
|--------------|------------|
| Quick start | [Quick start](#quick-start) |
| Maintenance policy | [kit/RULES.md](./kit/RULES.md) |
| {{NEXT_NEED}} | {{NEXT_PATH}} |

### Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| {{USE_CASE}} | {{OUTCOME}} | {{START_PATH}} |

### Quick start

{{ONE_WORKFLOW_OR_LINK_TO_PACKAGE}}

```{{LANG}}
{{QUICKSTART_COMMAND}}
```

### For maintainers

Canonical policy: [kit/RULES.md](./kit/RULES.md). Project history: [CHANGELOG.md](./CHANGELOG.md).

---

## Operator prompts

Session load path for **this** repository. Law stays in [kit/RULES.md](./kit/RULES.md). This section is not a second RULES tree and not a product CLI/API contract.

1. Open `kit/RULES.md` — authority map, inventory, operator checklist.  
2. Use **declared** inventory rows only (empty ⇒ no language gates).  
3. If a coding agent is used: `kit/agents/HABITAT.md` and root `AGENTS.md` (do not clobber a filled file).  
4. If Instruct (PLAN Agent models or `kit/agents/generated/` packs): `kit/agents/OPS.md`.  
5. If multi-phase: `docs/WORKBOARD.md`.

{{SESSION_NOTES}}

Replace every `{{PLACEHOLDER}}`. Do not copy upstream repo-kit adopt/upgrade fences unless this repository *is* that kit.
