# Templates

Templates are the vault's **constitution** — the canonical definitions of how every note type is structured, named, and placed. They encode the conventions described in every other rule file into executable blueprints.

## Philosophy

Reduce friction to near zero (Tiago Forte). Ensure consistency across every note (David Allen). When you create a note from a template, you get the right frontmatter, the right folder placement, the right body structure, and starter tasks — all automatically.

## Template Types

### Folder-Creating Templates (`f-*`)

These templates create a note, rename it, create a folder (if needed), and move the note into it. They are the primary way notes are created.

| Template | Creates | Folder |
|----------|---------|--------|
| `f-daily.md` | 📅 Daily note | `journal/1-daily/` |
| `f-weekly.md` | 📅 Weekly note | `journal/2-weekly/` |
| `f-monthly.md` | 📅 Monthly note | `journal/3-monthly/` |
| `f-quarterly.md` | 📅 Quarterly note | `journal/4-quarterly/` |
| `f-yearly.md` | 📅 Yearly note | `journal/5-yearly/` |
| `f-lit.md` | 📖 Zettelkasten note | `zettelkasten/` |
| `f-question.md` | ❓ Question note | `zettelkasten/` |
| `f-idea.md` | 🌱 Seedling creation | `garden/` |
| `f-fleeting.md` | 🍃 Informal work | `garden/` |
| `f-map.md` | 🗺️ Map of Content | `maps/` |
| `f-project.md` | 🚧 Project | `projects/Name Project/` |
| `f-book-project.md` | 🚧 Book project | `projects/Name/` |
| `f-sales-project.md` | 🚧 Sales project | `projects/Name Sales Project/` |
| `f-career-project.md` | 🚧 Career project | `projects/Name Career Project/` |
| `f-meeting.md` | 👥 Meeting note | `projects/<project>/` |
| `f-session.md` | 🧙 Session note | `projects/<project>/` |
| `f-one-on-one.md` | 👥 One-on-one meeting | `projects/<project>/` |
| `f-prep-session.md` | 🧙 Prep session | `projects/<project>/` |
| `f-person.md` | 🙂 Person | `references/people/` |
| `f-location.md` | 📌 Location | `references/locations/` |
| `f-media.md` | 🎥/🎧/etc. Media | `references/` |
| `f-organization.md` | 🏢 Organization | `references/organizations/` |
| `f-character.md` | Character note | `projects/` (RPG) |

### Property Templates (`p-*`)

These inject frontmatter into an existing note (used by other plugins).

| Template | Used by |
|----------|---------|
| `p-book.md` | Book Search plugin — creates 📕 book references |
| `p-tasks.md` | TaskNotes plugin — task frontmatter |

### Other

| Template | Purpose |
|----------|---------|
| `startup-journal.md` | Runs on vault open to create today's daily note |

## Banners

The `banners/` subfolder contains `.webp` banner images referenced by templates. Each note type has a default banner (e.g., `f-meeting.webp`, `f-idea.webp`).
