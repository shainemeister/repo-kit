---
title: Agent skills
description: "Index of the orchestrator, execute, and check packs in this directory."
version: "1.1.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
last_updated: "2026-10-17"
---

# Agent skills

Index of the orchestrator, execute, and check packs in this directory.

| Directory | Function |
|-----------|----------|
| [agent-orchestrator/](agent-orchestrator/SKILL.md) | Plan phases on the root workboard, or run one phase by spawning the pack that step needs |
| [execute/](execute/SKILL.md) | Implement the approved plan in a private worktree |
| [check-code/](check-code/SKILL.md) | Pass or fail the plan's edge cases from the files read |
| [check-ui/](check-ui/SKILL.md) | Pass or fail placement, feedback, narrow width, and focus order |

One task loads one pack. `agent-orchestrator` spawns the other three for the current step. These packs are project agents. They are not rows in the kit match index.
