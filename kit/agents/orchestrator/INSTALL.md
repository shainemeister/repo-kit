# Orchestrator crew — optional install

Surgical adopt of the Master Orchestrator packs into a repo that already has RepoKit (`kit/RULES.md` present). Manual only — no scripts.

## Procedure

1. **Copy packs** — Copy this `orchestrator/` directory into the target repo as `kit/agents/orchestrator/` (include `router.md`, `scout.md`, `builder.md`, `reviewer.md`, `README.md`, and this file). Do not overwrite unrelated `kit/agents/` files.

2. **Register in CATALOG** — In the target repo, edit `kit/agents/CATALOG.md` (create a minimal one if absent). Add four entries, **enabled-by-default: false**:

   | id | role | enabled-by-default |
   |----|------|--------------------|
   | `orchestrator-router` | Decompose and dispatch | false |
   | `orchestrator-scout` | Read-only exploration | false |
   | `orchestrator-builder` | Execute authorized changes | false |
   | `orchestrator-reviewer` | Validate against kit law | false |

   Point each entry at `kit/agents/orchestrator/<name>.md`. Do not turn them on in PLAN unless you want Instruct match to load them.

3. **Verify runtime law** — Open the target repo’s `kit/RULES.md`. Confirm inventory and verify table are readable. Packs adopt **that** law at runtime; they must not hard-code another project’s rules.

## Done when

- `kit/agents/orchestrator/` exists with the four packs.
- CATALOG lists all four ids with `enabled-by-default: false`.
- Target `kit/RULES.md` opens cleanly for the crew to follow.
