# Journal

The journal is the vault's **time axis** — a structured record of what happened, what you did, and how your habits are tracking. While the zettelkasten captures ideas and projects capture goals, the journal captures *the lived experience of your days*.

## Philosophy

This system draws on periodic review (David Allen's GTD), habit tracking (James Clear's *Atomic Habits*), and reflective practice (Cal Newport's *Deep Work*). The journal hierarchy provides natural checkpoints for reflection at every scale.

## Structure

```
journal/
├── 1-daily/      YYYY-MM-DD.md
├── 2-weekly/     YYYY-Www.md
├── 3-monthly/    YYYY-MM.md
├── 4-quarterly/  YYYY-Qn.md
└── 5-yearly/     YYYY.md
```

Each level links to its parent via the `parent:` property: day → week → month → quarter → year.

## Required Frontmatter

All journal notes share:
- `tags: [📅]`
- `create-date: "[[YYYY-MM-DD]]"`
- `before:` / `after:` — navigation links to previous/next period
- `parent:` — link up the hierarchy
- `append_modified_update: true`

Weekly+ notes also have `children:` listing the periods they contain.

## Key Sections

- **Daily notes** — Habits callout (tracking table), `# Journal` for free writing, `## Gardening:` for session logs
- **Weekly notes** — `## Notes From the Week` (Dataview query), `## Tasks` (per-day callouts), `## Attention` (time tracking)

## Example Notes in This Vault

- **2026-05-20** (daily) — Habits tracking, journal entry, gardening plant session log
- **2026-W21** (weekly) — Dataview notes query, per-day task callouts, attention summary
- **2026-05** (monthly) — Monthly Dataview query, attention summary, garden check-in

## Associated Workflows

- **`/garden`** — Gardening sessions are logged in daily notes under `## Gardening:`
- **`/review-projects`** — Review summaries are appended to weekly notes
- **`/open-project`**, **`/close-project`** — Session logs go in daily notes
