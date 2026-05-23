# Areas of Responsibility

Ongoing responsibilities with no natural end date — PARA's Areas of Responsibility. Area files are **accountability dashboards** that surface projects, sub-areas, meetings, and tasks. They are NOT knowledge indexes — that role belongs to Maps of Content (`maps/`).

## Philosophy

Areas represent **commitments you maintain**, not outcomes you complete. From Tiago Forte's PARA: if it's an ongoing responsibility you're accountable for (health, career, family), it's an area. If it has a defined outcome and end date, it's a project.

**The three-part project test:** Does it have a (1) finite outcome, (2) multiple steps, and (3) foreseeable time horizon? If YES → `projects/`. If it's an ongoing responsibility with no defined end → `areas/`.

## Folder Structure

```
areas/
  Areas.base                         # Area dashboard (filterable view)
  AreaName/
    AreaName.md                      # Area file (🛒)
    tasks/                           # Area-level recurring tasks
  Career Development/
    Career Development.md            # Parent area
    Kevin Berry/
      Kevin Berry.md                 # Sub-area (ongoing relationship)
      Kevin Berry One on One - *.md  # One-on-one notes
      tasks/
```

- Folder name matches the area file name
- Sub-areas nest one level deep (e.g., `Career Development/Kevin Berry/`)
- Meetings, one-on-ones, and session notes live inside the area or sub-area folder
- Task notes live in a `tasks/` subfolder, same as projects
- Do not nest deeper than two levels (area → sub-area)

## Area File Sections

| Section | Purpose |
|---------|---------|
| `## Summary` | Scope of responsibility — what you're accountable for |
| `## Sub-areas` | Dataview: `#🛒 WHERE contains(parent, this.file.link)` |
| `## Projects` | Dataview: `#🚧 WHERE contains(parent, this.file.link)` |
| `## Meetings & Notes` | Dataview: `#👥 or #🧙 WHERE contains(parent, this.file.link)` |
| `## Related Maps` | Dataview: `FROM "maps" WHERE contains(related, this.file.link)` |

## Required Frontmatter

```yaml
banner: "[[f-map-20250108173714088.webp]]"
tags: [🛒]
create-date: "[[YYYY-MM-DD]]"
description:          # short scope of responsibility
modified-dates:
append_modified_update: true
related:
```

Area files do NOT use `start-date:`, `end-date:`, or `ended-as:` — areas are ongoing by definition.

## Sub-Area / Relationship Files

For ongoing 1:1 relationships (career management, family members). Nested under a parent area. Created with `f-area-relationship.md`.

```yaml
tags: [🛒]
create-date: "[[YYYY-MM-DD]]"
aliases: ["Person Name"]
parent: "[[Parent Area]]"
```

Sub-area body sections: Objective, Metrics, Execution (tasks query), Related.

## Note Types Inside Areas

| Tag | Type | Key Properties |
|-----|------|----------------|
| 🛒 | Area / Sub-area | `description:`, `parent:` (sub-areas only) |
| 👥 | Meeting / One-on-one | `parent:` → area or sub-area file |
| 🧙 | Session | `parent:` → area file |
| 📋 | Task | `projects:` → area or sub-area file, `status`, `due` |

## Templates

- **Area file** — `templates/f-area.md`
- **Relationship sub-area** — `templates/f-area-relationship.md`
- **Meetings** — `templates/f-meeting.md`
- **One-on-ones** — `templates/f-one-on-one.md`

## Associated Workflows

- **`/review-projects`** — Area horizon scan. Surfaces areas with no active projects and checks sub-area health.
- **`/open-project`** — New projects set `parent:` to the relevant area, connecting them automatically via Dataview.
- **`/close-project`** — Closing a project under an area leaves the area intact; areas don't end.

## Dashboard

`Areas.base` provides a filterable table view of all areas with columns for description, project count, sub-area count, and creation date.

## Example Areas in This Vault

- **Health & Fitness** — Ongoing commitment to physical health. Parent area for Marathon Training and Home Gym Setup projects. Connected to the Exercise Science and Nutrition maps.
