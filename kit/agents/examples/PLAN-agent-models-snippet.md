# Example: PLAN.md Agent models snippet

**Illustrative** — copy into adopter PLAN.md and adapt. Full contract: [PLAN-HOOK.md](../PLAN-HOOK.md).

When using **Agent Instruct**, PLAN.md is **required** and must include this section. Bare kit adopt without agents may omit PLAN and skip BUILD.

```markdown
## Agent models

### Instruct authority

| Doc | Path |
|-----|------|
| Framework | kit/agents/FRAMEWORK.md |
| Params | kit/agents/PARAMS.md |
| Catalog | kit/agents/CATALOG.md |
| PLAN hook | kit/agents/PLAN-HOOK.md |
| Build | kit/agents/BUILD.md |
| Runtime | kit/agents/RUNTIME.md |

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
```
