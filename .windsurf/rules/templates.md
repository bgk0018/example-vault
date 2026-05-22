---
trigger: glob
globs: templates/**
---
# Templates

Templater-powered templates that define the structure, naming, and frontmatter for every note type in the vault. This folder is the source of truth for note conventions.

Source of truth for note structure. Templates are authoritative — when a conflict exists between a template and an existing note, the template wins. For philosophical grounding, see `references/ethos.md#templates`.

## Do Not
- Modify Templater logic (`<%* %>` blocks) without understanding downstream effects on folder structure, file naming, and frontmatter
- Rename template files — they may be referenced by Templater hotkeys or commands
- Add/remove frontmatter fields without considering that existing notes rely on them for dataview queries
- Delete or rename banner images in `banners/` without updating templates that reference them

## Do
- Treat templates as the **canonical definition** of each note type's structure
- Review the relevant template before creating or modifying notes in any folder
- Update templates when adding new frontmatter fields vault-wide
- Keep banner images in `templates/banners/`

## Folder Structure
```
templates/
  banners/          # Banner images used in note headers
  web-clipper/      # Web clipper templates
  f-*.md            # Folder-creating templates (main templates)
  p-*.md            # Property/partial templates
  startup-journal.md
```

## Template Inventory
| Template | Creates | Tag | Destination |
|----------|---------|-----|-------------|
| `f-daily.md` | Daily journal | 📅 | `journal/1-daily/` |
| `f-weekly.md` | Weekly review | 📅 | `journal/2-weekly/` |
| `f-monthly.md` | Monthly review | 📅 | `journal/3-monthly/` |
| `f-quarterly.md` | Quarterly review | 📅 | `journal/4-quarterly/` |
| `f-yearly.md` | Yearly review | 📅 | `journal/5-yearly/` |
| `f-lit.md` | Literature note | 📖 | `zettelkasten/` |
| `f-map.md` | Map of Content | 🗺️ | `maps/` |
| `f-project.md` | Project | 🚧 | `projects/Name Project/` |
| `f-book-project.md` | Book project | 🚧 | `projects/Name/` |
| `f-career-project.md` | Career project | 🚧 | `projects/Name Career/` |
| `f-meeting.md` | Meeting note | 👥 | `projects/[selected]/` |
| `f-session.md` | Session note | 🧙 | `projects/[selected]/` |
| `f-one-on-one.md` | One-on-one | 👥 | `projects/Name Career Project/` |
| `f-person.md` | Person reference | 🙂 | `references/people/` |
| `f-media.md` | Media reference | 🎥 | (current folder) |
| `f-fleeting.md` | Fleeting note | 🍃 | (current folder) |
| `f-idea.md` | Idea note | 💡 | (current folder) |
| `f-question.md` | Question note | ❓ | (current folder) |
| `f-location.md` | Location | 📌 | (current folder) |
| `f-organization.md` | Organization | — | (current folder) |
| `f-character.md` | RPG character | — | (current folder) |
| `f-prep-session.md` | Prep session | — | (current folder) |

## Template Syntax
- Templates use Templater plugin syntax: `<%* %>` for JS blocks, `<% %>` for expressions
- Many templates use `tp.system.prompt()` for user input and `tp.file.rename()` / `tp.file.move()` for file placement
- `f-project.md` also creates a `tasks/` subfolder and seeds starter task notes

