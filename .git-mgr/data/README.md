> This file is written by Git Manager. The app may refresh it. It stores no tokens and no GitHub cache.

# Repository icon

**Repository:** repo-kit
**Icon file:** .git-mgr/data/icon.svg
**GitHub:** shainemeister/repo-kit

Git Manager can show a custom icon for a **cloned** repository in **Open Repository** (Ctrl+O), in **Repository Center** / catalog details, and on **Repository Management**.

## File

Place a single SVG at:

```text
.git-mgr/data/icon.svg
```

That path is under the open worktree root. The name is fixed. When the file is present and valid, it replaces the default Git Manager or GitHub mark in those places. It does **not** change the Local / Pull marks on a merge conflict.

## Rules

- SVG only.
- Keep the file small (about 64 KiB or less).
- No network or external image links inside the SVG.
- Invalid or oversize files are ignored; the themed icon stays.

## Change icon

Click the logo (**Change icon**), or choose **Change icon** in the **⋯** menu beside it. That copies an SVG you pick into the icon file above. It does not change any other file.

**Icon info** in that menu writes this page to `.git-mgr/data/README.md` and opens it on the Files tab in Markdown Preview. Opening the repository may refresh this file when it carries the Git Manager banner. A copy you wrote yourself is left alone. **Icon AI Prompt** copies the prompt below.

You can also open `.git-mgr` in Files, then `data`, and edit `icon.svg` there. Files does not create, rename, or delete the `.git-mgr` or `data` folders, and it does not list `github`, `worklist`, or `library.json`.

You can still create `icon.svg` yourself, or ask an AI using the prompt below.

## AI prompt

Copy this block into an AI assistant that can edit the open repository:

````text
You design the mark for repo-kit.

Before drawing, answer in one short line: what single silhouette means (describe the repository purpose) at 16px — let the repo’s purpose set metaphor, proportions, and accent character.

Then write only that SVG to .git-mgr/data/icon.svg (create dirs if needed; touch no other files):
plain <svg viewBox="0 0 64 64"> — no xmlns or URL attributes, no external refs.
Transparent canvas; mid-light fill-first shapes (not a near-black mass) plus one accent if needed so planes stay distinct (value steps or a thin light cut if they overlap).
No plate, outer border, edge halo, or text. Clear at 16px, 32px, and 128px (resvg). Under 64 KiB.
````
