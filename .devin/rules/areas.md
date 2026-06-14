---
trigger: glob
globs: areas/**
---
# Areas of Responsibility

Ongoing responsibilities with no natural end date — PARA's Areas of Responsibility. Area files are **accountability dashboards** that surface projects, meetings, and tasks. They are NOT knowledge indexes — that role belongs to Maps of Content (`maps/`). For philosophical grounding, see `references/ethos.md#areas`.

GTD + PARA hybrid. Areas represent **commitments you maintain**, not outcomes you complete. The LLM is a **Socratic companion** — surfaces health signals during `/review-projects`, never auto-creates area content.

**Areas vs Maps:** Areas answer "What am I responsible for?" (accountability, action). Maps answer "What's the full picture?" (convergence of all note types). A topic can have BOTH an area and a map — they serve different purposes. Maps show doing (areas), finishing (projects), understanding (zettel), and creating (garden) in one view, making imbalance visible.

**The three-part project test:** Does it have a (1) finite outcome, (2) multiple steps, and (3) foreseeable time horizon? If YES to all three → `projects/`. If it's an ongoing responsibility with no defined end → `areas/`. If it's a single action → daily note task. If it's a concept collection → `zettelkasten/` or `references/`.

## Do Not
- Place finite-outcome work here — that belongs in `projects/`
- Set `end-date:` or `ended-as:` on area files — areas don't end (close the sub-project, not the area)
- Auto-fill area descriptions or responsibilities — the LLM asks questions, the user writes answers
- Create an area for every topic — areas represent responsibilities you are accountable for, not interests
- Nest areas inside other areas for topic grouping — areas are flat; use maps for topic convergence
- Use `🗺️` for area files — areas use `🛒`, maps use `🗺️`

## Do
- Give every area its own subfolder matching the area file name
- Use `🛒` tag on area files
- Set `parent:` on projects and meetings to point to the relevant area file
- Include Dataview query sections so the area file aggregates its action items (projects, meetings, tasks)
- Let maps handle knowledge aggregation — zettelkasten notes use `related:` → maps, not areas
- Use `description:` to capture the area's scope and accountability
- Review areas during `/review-projects` horizon scan — different cadence than project staleness checks
- Co-locate `Areas.base` in the `areas/` folder (vertical slice)

## Folder Structure
```
areas/
  Areas.base                         # Area dashboard
  Weightlifting/
    Weightlifting.md                 # Area file (🛒)
    tasks/                           # Area-level recurring tasks
  Career Development/
    Career Development.md            # Area file (🛒)
    Kevin Berry/                     # Relationship folder (sole valid nesting)
      Kevin Berry Career.md          # Relationship file (🛒)
      Kevin Berry One on One - *.md  # Co-located 1:1 notes
      tasks/
    Mason Steeger/
      ...
```
- Areas are **flat** — each area gets its own top-level subfolder under `areas/`
- Folder name matches the area file name
- **Sole nesting exception:** person-management folders that co-locate a relationship file with its 1:1 notes and tasks (e.g., `Career Development/Kevin Berry/`)
- Meetings, one-on-ones, and session notes live inside the area or relationship folder
- Task notes live in a `tasks/` subfolder, same as projects

## Area File

### Folder-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `description:` | string | Recommended | Short description of the area's scope and what you're accountable for. |

Area files do NOT use `start-date:`, `end-date:`, or `ended-as:` — areas are ongoing by definition.

### Frontmatter Example
```yaml
banner: "[[f-map-20250108173714088.webp]]"
tags: [🛒]
create-date: "[[YYYY-MM-DD]]"
description: 
modified-dates:
append_modified_update: true
related:
```

### Body Structure
Area files are **accountability dashboards** — NOT knowledge indexes. Knowledge aggregation belongs in `maps/`.

```markdown
# Area Name

## Objective
> What does maintaining this responsibility well look like?

## Metrics
> How do you know this area is healthy?

## Projects
> [!example]- Active Projects
[Dataview: #🚧 WHERE contains(parent, this.file.link)]

## Meetings & Notes
> [!note]- Meetings and Notes
[Dataview: #👥 or #🧙 WHERE contains(parent, this.file.link)]

## Related Maps
> [!compass]- Related Maps
[Dataview: FROM "maps" WHERE contains(related, this.file.link)]
```

Maps that are conceptually tied to an area add the area to their `related:` property. The area auto-discovers them via Dataview.

## Relationship Files (Sole Nesting Exception)

For ongoing 1:1 relationships (career management, family members). These are the **only** files that nest under a parent area — justified by the volume of co-located 1:1 meeting notes per person.

### Frontmatter Example
```yaml
banner: "[[pexels-catcaryn-938165.webp]]"
tags: [🛒]
create-date: "[[YYYY-MM-DD]]"
aliases: ["Person Career"]
parent: "[[Career Development]]"
modified-dates:
append_modified_update: true
related:
```

### Body Structure
```markdown
# Person Name

## Objective
[What does success look like for this relationship/responsibility?]

## Metrics
[How do you measure health of this responsibility?]

## Execution
[Tasks query + linked task notes]

## Related
```

## Meeting and One-on-One Notes in Areas

Meeting (`👥`) and one-on-one notes follow the same conventions as in `projects/` — same templates (`f-meeting.md`, `f-one-on-one.md`), same properties. The only difference:
- `parent:` points to the area or sub-area file instead of a project file
- One-on-ones use `project:` pointing to the sub-area file (e.g., `project: "[[Kevin Berry]]"`)

## Task Notes in Areas

Task notes (`📋`) follow the same conventions as in `projects/`:
- Live in a `tasks/` subfolder
- Use `projects:` (plural) to link back to the area or sub-area file
- Same status/priority/due properties

## Templates
- Area file: `templates/f-area.md`
- Relationship sub-area: `templates/f-area-relationship.md`
- Meetings: `templates/f-meeting.md` (existing, unchanged)
- One-on-ones: `templates/f-one-on-one.md` (existing, unchanged)

## CLI Operations (via @obsidian-cli)

### Query area health

```bash
obsidian base:query file="areas/Areas.base" view="All Areas" format=md
obsidian search query="tag:🛒" limit=50
```

### Create area notes from templates

```bash
obsidian templater:create-from-template template="f-area.md" file="areas/New Area/New Area.md" open
obsidian templater:create-from-template template="f-area-relationship.md" file="areas/Career Development/Person Name/Person Name.md" open
```
