---
title: "Write the session block"
description: "Make the agents paste the short session file for adopt and upgrade."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-19"
---

# Write the session block

Make the agents paste the short session file for adopt and upgrade.

`docs/library/kit-adopter/skills/kit-discover-host/template/agents.md` is the file under review. The block cites owners. It does not paste their procedures.

How to use:

- No root `AGENTS.md`: write the block. Remove the fence.
- A root `AGENTS.md` exists: replace the body with the block. Keep that repository's directory paths in `{{PROJECT_NOTE}}`. Do not keep the old sections.
- The block is already the whole file: do not add a second copy.

The block points at `ADOPTER.md` for the one-time adopt, `kit/UPGRADE.md` for a later upgrade, and `kit/skills/` for a procedure whose action matches the task. The order, the workboard, the notepad, and the completion sentence stay. Do not paste `kit/rules/*` into the block.
