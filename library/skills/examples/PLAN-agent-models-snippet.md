# Example: PLAN.md Agent models snippet

**Illustrative** — copy into adopter PLAN.md and adapt. Full contract: [PLAN-HOOK.md](../PLAN-HOOK.md). Utilization: [OPS.md](../OPS.md).

When using **Agent Instruct**, PLAN.md is **required** and must include this section. Bare kit adopt without agents may omit PLAN and skip BUILD.

```markdown
## Agent models

### Instruct authority

| Doc | Path |
|-----|------|
| Framework | library/skills/FRAMEWORK.md |
| Params | library/skills/PARAMS.md |
| Catalog | library/skills/CATALOG.md |
| PLAN hook | library/skills/PLAN-HOOK.md |
| Build | library/skills/BUILD.md |
| Runtime | library/skills/RUNTIME.md |
| Order of operations | library/skills/OPS.md |

### Active models

- maintainer
- implementer
- docs-author
- security
- plan-author
- reviewer

<!-- Empty active set (emit nothing — not "all catalog defaults"):
### Active models

*(none)*
-->

### Disabled

- adopter

### Overlays

<!-- Repo-relative paths only — never http(s) URLs -->
(none)

### Tuning

- emphasize: []
- must_not_extra: []
- always_on_extra: []
- notes: ""

### Regenerate when

- PLAN mission / stages / non-goals change
- Authority map or language inventory change
- active_models / disabled / overlays / tuning change
- Kit agents templates upgrade
- New package, public surface, language, or durable task class
- Material change to pack expertise targets
```
