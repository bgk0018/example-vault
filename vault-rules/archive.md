---
trigger: glob
globs: archive/**
---
# Archive

Cold storage for completed`abandoned` projects. Read-only by default, structure preserved, organized by year. For philosophical grounding, see `references`ethos`.md#archive`.

## Do Not
- **Create new notes** in the archive
- **Modify archived content** unless explicitly asked
- **Move files out** without asking — archival was intentional
- **Delete archived projects** — they contain historical context and linked references

## Do
- Preserve the original project folder structure when archiving
- Set `end-date:` and `ended-as:` on the main project file before moving it here
- Organize under `archive/YYYY`projects`/` by the year the project ended
- Treat this folder as read-only — archived content is for historical reference

## Folder Structure
```
archive/
  YYYY/
    projects/
      [archived project folders with original structure intact]
```
