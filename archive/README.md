# Archive

The archive is the vault's **cold storage** — the final resting place for completed, abandoned, or paused projects. It implements the archive layer of Tiago Forte's PARA system.

## Philosophy

As David Allen writes in *Getting Things Done*, a trusted system must handle not just what you're doing now, but what you've already done. The archive provides that closure: when a project reaches its natural end, you triage its contents — reusable knowledge moves to `zettelkasten/` or `garden/`, and the rest is preserved here with its original folder structure intact.

## Structure

```
archive/
└── YYYY/
    └── projects/
        └── ProjectName Project/
            ├── ProjectName Project.md
            ├── tasks/
            └── (meeting notes, assets, etc.)
```

The year in `YYYY/` is the year the project ended (from `end-date`), not the current year.

## Key Properties on Archived Projects

| Property | Value |
|----------|-------|
| `end-date:` | `"[[YYYY-MM-DD]]"` — when the project ended |
| `ended-as:` | `completed`, `abandoned`, `paused`, or `merged` |

## Rules

- **Read-only by default** — don't edit archived notes unless correcting an error
- **Structure preserved** — the original folder layout stays intact for future reference
- **Knowledge extracted first** — insights should be moved to `zettelkasten/` or `garden/` *before* archiving

## Associated Workflows

- **`/close-project`** — The closing ceremony that moves a project here. Captures results, extracts knowledge, resolves tasks.

## Example in This Vault

- `archive/2025/projects/Strength Training Research Project/` — A completed book project with filled Result section. The zettelkasten notes it produced (Progressive Overload, Central Governor Theory) now live in `zettelkasten/`.
