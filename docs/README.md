# docs/ — AI resource workspace (repo-kit)

This repository’s **AI resource workspace** (outside `kit/`). Live project notes for maintaining **repo-kit** itself.

**Policy:** [kit/rules/ai-docs-workspace.md](../kit/rules/ai-docs-workspace.md)  
**Templates for adopters:** [kit/templates/docs/](../kit/templates/docs/)

---

## Purpose

| Audience | Use |
|----------|-----|
| **Maintainers of this kit** | Research, detailed plans, and build notes for kit evolution |
| **Adopters** | Copy the *pattern* and policy into *their* root `docs/`—do not treat this tree as their product workspace |

Standards and portable law remain under **`kit/`**. Product-style contracts for adopters stay in their packages—not here.

---

## Modules

| Module | Path | Enabled | Purpose |
|--------|------|---------|---------|
| Research | [research/](./research/) | on demand | Kit design investigations, comparisons |
| Workboard | [WORKBOARD.md](./WORKBOARD.md) | **on** | Multi-phase kit execution (dogfood) |
| Plan | [plan/](./plan/) | **on** | Live annex: [density-fixups-2.8.1](./plan/density-fixups-2.8.1/); shipped under [plan/archive/](./plan/archive/) |
| Project build | [project_build/](./project_build/) | on demand | Implementation notes while shipping kit changes |
| Resources | [resources/](./resources/) | on demand | Curated pointers for kit maintainers |

Scaffold a module folder when first needed; keep this index accurate.

---

## How to update

1. Multi-step / research / build work → create or update the relevant module.  
2. Promote durable kit **policy** into `kit/RULES.md` / `kit/rules/*` / CHANGELOG—not only under `docs/`.  
2b. Multi-phase kit work: register [WORKBOARD.md](./WORKBOARD.md) before phase edits ([workboard](../kit/rules/workboard.md)).  
3. Kit version history stays in `kit/CHANGELOG.md` under `## repo-kit`.  
4. Root `PLAN.md` is not required for this upstream kit unless Agent Instruct is used for kit development.

---

## Related

| Doc | Path |
|-----|------|
| Workspace policy | `kit/rules/ai-docs-workspace.md` |
| Maintenance hub | `kit/RULES.md` |
| Operator enforcement | `kit/RULES.md#operator-enforcement` |
| Workboard policy | `kit/rules/workboard.md` |
| Agent Instruct | `kit/agents/README.md` |
