---
trigger: glob
globs: views/**
---
# Views

Display and query configuration files — not content notes. These power Obsidian dashboards and embedded views.

Configuration and display files — not content. Dashboards, queries, and widgets that surface vault data. For philosophical grounding, see `references/ethos.md#views`.

## Do Not
- Add content notes to this folder — only view/query configurations belong here
- Modify `.base` files without understanding the DB Folder plugin's filter/formula syntax
- Remove or rename files that are transcluded elsewhere (check for `![[views/...]]` references first)
- Break formula definitions in `.base` files — they power task tracking, habit views, and dashboards

## Do
- Use this folder exclusively for display/query configuration files
- Embed view files in other notes via `![[views/FileName]]` transclusion syntax
- Check for existing transclusion references before renaming or deleting a view file
- Place new `.base` files here when creating DB Folder dashboards

## File Types
- **`.base` files** — DB Folder plugin configurations (task boards, project lists, relationship trackers, etc.)
- **`.md` files** — Markdown files containing dataview queries or transclusions that are embedded in other notes (e.g., `Habits.md` is embedded in daily journal notes via `![[views/Habits]]`)

## Current Files
| File | Purpose |
|------|---------|
| `Articles.base` | Article collection view (`references/articles/`) |
| `Blog.base` | Digital Garden publishing dashboard (`blog/`) |
| `Books.base` | Book collection view (`references/books/`) |
| `Inbox.base` | Inbox triage queue — all items in `inbox/` sorted by age, supports inbox processing workflow |
| `Garden.base` | **Tending queue** — surfaces notes needing attention: disconnected 📖, unchallenged 📖, seedling/growing/stale 🌱/🌿/🌳, parentless notes. Primary entry point for the `/garden` workflow's tending phase. |
| `Habits.md` | Habit tracking charts (embedded in daily notes) |
| `Highlights.base` | Highlight collection grouped by source (`references/highlights/`) |
| `Journal.base` | Journal views — daily feed, weekly/monthly/quarterly tables (`journal/`) |
| `Locations.base` | Location map and list view (`references/locations/`) |
| `References.base` | Umbrella view across all `references/` subfolders, grouped by type and sorted by recency |
| `Maps.base` | Maps of Content collection with backlink counts (`maps/`) |
| `People.base` | People directory with connectivity ranking (`references/people/`) |
| `Projects.base` | Project dashboard grouped by parent (`projects/`) |
| `Upcoming Maps.md` | Dataview query for upcoming maps |
| `Zettelkasten.base` | Zettelkasten notes grouped by related map (`zettelkasten/`) |
| `agenda-default.base` | Task agenda view |
| `calendar-default.base` | Calendar view |
| `kanban-default.base` | Kanban board |
| `mini-calendar-default.base` | Mini calendar widget |
| `relationships.base` | Task relationship tracker (embedded in task notes) |
| `tasks-default.base` | Full task management view |

## Convention
- These files are configuration/display — they don't contain knowledge content
- `.base` files use a custom format for the DB Folder plugin (filters, formulas, column definitions)
- `.md` files in this folder are meant to be transcluded (`![[views/FileName]]`) not read directly

