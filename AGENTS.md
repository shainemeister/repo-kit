# AGENTS.md

Instructions for **coding agents** working in **repo-kit**. Humans use the root [README.md](./README.md).

This repository **is** the Repository Standards Kit. Portable law lives under `kit/`. This file is a **pointer** (L0). It is not a second RULES tree.

## Open first

1. [kit/RULES.md](./kit/RULES.md) — authority map, Must / Must not, operator checklist.  
2. Language inventory: this tree is **docs-only**. No pylint, rustfmt, clang-format, Bandit, cargo-audit, or cppcheck gates.  
3. [kit/rules/contracts.md](./kit/rules/contracts.md) — one canonical owner; same change set.

## Working memory

- Multi-phase: [docs/WORKBOARD.md](./docs/WORKBOARD.md).  
- Habitat / host discovery: [kit/agents/HABITAT.md](./kit/agents/HABITAT.md).

## Agent Instruct

There is **no** root `PLAN.md` Agent models section and `kit/agents/generated/` has no packs. **Skip Instruct / O3.** Use `kit/RULES.md` only.

## Do not

- Invent product languages, host folder trees (`.claude/`, `.cursor/`, Copilot instruction matrices), or Domain A/B gates.  
- Paste `kit/rules/*` into this file.  
- Claim complete if a **declared** gate failed (none are declared here except the author checklist).
