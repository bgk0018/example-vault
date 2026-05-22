# Views

The views folder is the vault's **control room** — a collection of dashboards, queries, and widgets that surface information from across the vault without duplicating it.

## Philosophy

Your trusted system must give you the *right view at the right time* (David Allen, Tiago Forte). Views are configuration, not content — they query the vault's data and present it in filterable, sortable formats.

## File Types

### Bases (`.base` files)

Bases are Obsidian's built-in database views. Each `.base` file defines filters, formulas, computed properties, and multiple named views (tables, task lists, etc.).

| File | What it shows |
|------|--------------|
| `Garden.base` | Tending queue — Disconnected 📖, Unchallenged 📖, Seedling 🌱, Growing 🌿, Stale, Parentless |
| `Projects.base` | Project health — Category, Age, Stale, Open Tasks by Project, Ready to Close |
| `Tasks.base` | Task management — Today/Overdue with computed urgency scores |
| `Books.base` | Book library — filterable by status, author |
| `Journal.base` | Journal entries |
| `Zettelkasten.base` | All zettelkasten notes |
| `People.base` | All people |
| `Highlights.base` | All highlights |
| `Articles.base` | All articles |
| `Locations.base` | All locations |
| `Maps.base` | All maps |
| `References.base` | All references |
| `Inbox.base` | Inbox items awaiting processing |

### Task Views (`tasks/` subfolder)

Advanced task dashboard views with different layouts:

| File | Layout |
|------|--------|
| `Agenda.base` | Agenda-style task view |
| `Calendar.base` | Calendar layout |
| `Kanban.base` | Kanban board by status |
| `Pomodoro.base` | Pomodoro timer integration |
| `Tasks.base` | Full task list with all computed fields |
| `Widget.base` | Compact widget for embedding |
| `Mini Calendar.base` | Small calendar view |

### Query Files (`.md`)

| File | Purpose |
|------|---------|
| `Habits.md` | Dataview query for habit tracking (embedded in daily notes) |
| `Upcoming Maps.md` | Shows maps that are emerging (phantom links) |

## Key Formulas (in `.base` files)

- **`days_since_modified`** — `(now() - file.mtime).days.round(0)` — used for staleness detection
- **`status`** (Projects) — Computed: 🟢 Active / 🟡 Stale (30+ days) / 🔴 Closing (has end-date)
- **`priorityWeight`**, **`daysUntilDue`**, **`urgencyScore`** (Tasks) — Computed priority and urgency for sorting

## How Views Are Used

- **Embedded in notes** — e.g., `![[views/Habits]]` in daily notes
- **Opened directly** — Click a `.base` file to open the dashboard
- **Used by workflows** — `/garden tend` reads `Garden.base`, `/review-projects` reads `Projects.base`
