---
title: "PLAN.md Agent models snippet"
description: "Illustrative Agent models section to copy into an adopter PLAN.md."
version: "1.4.0"
status: current
doc_type: other
last_updated: "2026-10-17"
---

# Example: PLAN.md Agent models snippet

Illustrative Agent models section to copy into an adopter PLAN.md. Full contract: [kit-author-plan](../SKILL.md). Utilization: [kit-use-instruct](../../kit-use-instruct/SKILL.md).

Paste this when Instruct is in use. Bare adopt omits it ([dual path](../SKILL.md#plan-dual-path)).

```markdown
## Agent models

### Instruct authority

| Doc | Path |
|-----|------|
| kit-map-layers | docs/library/kit-adopter/skills/kit-map-layers/SKILL.md |
| kit-define-pack | docs/library/kit-adopter/skills/kit-define-pack/SKILL.md |
| kit-author-plan | docs/library/kit-adopter/skills/kit-author-plan/SKILL.md |
| kit-emit-packs | docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md |
| kit-use-instruct | docs/library/kit-adopter/skills/kit-use-instruct/SKILL.md |
| Match index | kit/skills/README.md |

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
- Authority map change
- active_models / disabled / overlays / tuning change
- Kit agents templates upgrade
- New package, public surface, language, or durable task class
- Material change to pack expertise targets
```
