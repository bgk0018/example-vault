# Templates

Templater-powered templates that define the structure, naming, and frontmatter for every note type in the vault. This folder is the **source of truth** for note conventions — when a conflict exists between a template and an existing note, the template wins.

## Philosophy

Templates encode the vault's design decisions into repeatable scaffolding. Each template handles file naming, folder placement, frontmatter, and body structure so you can focus on content. They use the Templater plugin's JavaScript blocks (`<%* %>`) to prompt for input, rename files, and create folder hierarchies automatically.

## Folder Structure

```
templates/
  banners/            # Banner images used in note headers (WebP)
  f-*.md              # Folder-creating templates (main templates)
  p-*.md              # Property/partial templates
  startup-journal.md  # Startup journal template
```

- **`f-` prefix** — Full templates that create and place a note (rename, move, create subfolders)
- **`p-` prefix** — Partial templates that inject properties or content into an existing note
- **`banners/`** — Banner images referenced by `banner:` frontmatter; do not rename or delete without updating templates

## Template Inventory

| Template | Creates | Tag | Destination |
|----------|---------|-----|-------------|
| `f-daily.md` | Daily journal | 📅 | `journal/1-daily/` |
| `f-weekly.md` | Weekly review | 📅 | `journal/2-weekly/` |
| `f-monthly.md` | Monthly review | 📅 | `journal/3-monthly/` |
| `f-quarterly.md` | Quarterly review | 📅 | `journal/4-quarterly/` |
| `f-yearly.md` | Yearly review | 📅 | `journal/5-yearly/` |
| `f-lit.md` | Literature note | 📖 | `zettelkasten/` |
| `f-question.md` | Question note | ❓ | (current folder) |
| `f-map.md` | Map of Content | 🗺️ | `maps/` |
| `f-area.md` | Area of Responsibility | 🛒 | `areas/Name/` |
| `f-area-relationship.md` | Relationship sub-area | 🛒 | `areas/Parent/Name/` |
| `f-project.md` | Project | 🚧 | `projects/Name Project/` |
| `f-book-project.md` | Book project | 🚧 | `projects/Name/` |
| `f-sales-project.md` | Sales project | 🚧 | `projects/Name/` |
| `f-meeting.md` | Meeting note | 👥 | `projects/[selected]/` or `areas/` |
| `f-one-on-one.md` | One-on-one | 👥 | `projects/` or `areas/` |
| `f-session.md` | Session note | 🧙 | `projects/[selected]/` |
| `f-prep-session.md` | Prep session | — | (current folder) |
| `f-person.md` | Person reference | 🙂 | `references/people/` |
| `f-media.md` | Media reference | 🎥 | (current folder) |
| `f-location.md` | Location | 📌 | (current folder) |
| `f-organization.md` | Organization | 🏢 | (current folder) |
| `f-character.md` | RPG character | — | (current folder) |
| `f-fleeting.md` | Fleeting note | 🍃 | (current folder) |
| `f-idea.md` | Idea note | 💡 | (current folder) |

## Template Syntax

- **Templater blocks** — `<%* %>` for JavaScript, `<% %>` for inline expressions
- **User prompts** — `tp.system.prompt()` collects input (names, dates, selections)
- **File operations** — `tp.file.rename()` and `tp.file.move()` handle naming and placement
- **Folder creation** — Many templates create subfolders (e.g., `tasks/`) via `this.app.vault.createFolder()`

## Guidelines

- **Review the relevant template** before creating or modifying notes in any folder
- **Do not modify Templater logic** (`<%* %>` blocks) without understanding downstream effects
- **Do not rename template files** — they may be referenced by Templater hotkeys or commands
- **Update templates first** when adding new frontmatter fields vault-wide
- **Keep banner images** in `templates/banners/`; do not delete or rename without updating references
