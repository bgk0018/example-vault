---
trigger: glob
globs: maps/**
---
# Maps of Content (MOCs)

Navigational index notes that aggregate related notes via dataview queries. Maps are the **canonical knowledge navigation layer** — zettelkasten notes, ideas, and references link here via `related:`. Maps are NOT containers for ongoing responsibilities (that's `areas/`). Emergent (not imposed), entry points (not containers), published by default. For philosophical grounding, see `references`ethos`.md#maps-of-content`.

## Do Not
- Remove or restructure the standardized sections without asking
- Place content notes inside `maps/` — maps are index`navigation` notes only
- Break the dataview query patterns — they rely on the `related` and `parent` field conventions
- Create maps for Areas of Responsibility — ongoing responsibilities (career, family, health) belong in `areas/` with the `🛒` tag, not here
- Put action items (projects, meetings, tasks) on maps — those belong on area files
- Manually list notes in the body — use dataview queries instead

## Do
- Use a plain descriptive name without a date suffix for the filename
- Follow the standardized body structure (Summary → Areas → Exploration → Projects → Concepts → Notes → References → Other)
- Set `dg-publish: true` — maps are published by default
- Add `aliases` and `related` manually after creation if applicable
- Let dataview queries do the aggregation — notes connect to maps via their own `related:` or `parent:` fields

## File Naming
- Plain descriptive name, no date suffix: `Learning.md`, `Psychology.md`, `Apache Kafka.md`

## Folder-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `description:` | string | Optional | Short description of the map's scope. Displayed in some Dataview queries and Digital Garden listings. |

### Frontmatter Example
```yaml
banner: "[[f-map-20250108173714088.webp]]"
tags: [🗺️]
create-date: "[[YYYY-MM-DD]]"
modified-dates:
append_modified_update: true
description:
dg-publish: true
```

## Body Structure
Every map follows this standardized layout:

```markdown
# Map Name

## Summary
[Brief overview of the topic]

## Areas
> [!target]- Areas of Responsibility
> Ongoing responsibilities related to this topic.
[Dataview: #🛒 WHERE contains(related, this.file.link)]

## Exploration
> [!bulb]- Ideas and Questions I've Captured
> [description]
[Dataview: #💡 or #❓ WHERE contains(related, this.file.link) or contains(parent, this.file.link)]

## Projects
> [!example]- Projects I've Attempted
> [description]
[Dataview: #🚧 WHERE contains(related, this.file.link) or contains(parent, this.file.link)]

## Concepts
> [!info]- Concepts I've Broken Out
> [description]
[Dataview: #📖 WHERE contains(related, this.file.link) or contains(parent, this.file.link), sorted by inlink weight]

## Notes
> [!note]- Notes I've Taken
> [description]
[Dataview: #⏱️ or #👥 or #🧙 WHERE contains(related, this.file.link) or contains(parent, this.file.link)]

## References
> [!quote]- References I've used
> [description]
[Dataview: #📰 or #🎥 or #🎓 or #📕 or #🗣️ WHERE contains(related, this.file.link) or contains(parent, this.file.link)]

## Other
> [!QUESTION]- Other Files
> [catch-all for uncategorized related files]
```

## How Notes Connect to Maps
- Zettelkasten notes (`📖`), ideas (`🌱`), and references link to maps via `related:` — maps are the canonical target for knowledge connections
- Projects and meetings link to areas via `parent:` — NOT to maps
- The map's dataview queries automatically pick up notes that reference it via `related:` or `parent:`
- Notes do NOT need to live inside a `maps/` subfolder — they stay in their own folders

## How Maps Connect to Areas

Maps are the **convergence point** — they show what you're doing (areas), finishing (projects), understanding (zettel), and creating (garden) in one view. This makes imbalance visible: all area activity + no zettel notes = "grinding but not learning"; all zettel + no area = "studying but not applying."

- If a map is conceptually tied to an area of responsibility, add the area to the map's `related:` property (e.g., `related: "[[Politics]]"` on `Trump Presidency.md`)
- The area's "Related Maps" Dataview query auto-discovers maps that reference it — no manual linking needed on the area side
- A topic can have BOTH an area and a map — they serve different purposes (accountability vs. knowledge convergence)

## Template
- `templates`f-map`.md`

## When to Create a New Map

Maps are emergent — they crystallize when you notice a cluster of notes forming around a topic. Use these signals:

- **3+ zettelkasten notes** reference the same theme or concept and don't already belong to an existing map → consider creating a map
- **You keep searching for the same topic** and wish there was a landing page for it → that's a map wanting to exist
- **A project is generating reusable knowledge** that will outlive the project → a map can hold the concepts together after the project is archived
- **An existing map is too broad** and a subtopic has enough notes to stand on its own → split into a child map and link them via `related:`

**Don't create a map** if:
- There are fewer than 3 related notes — use `related:` links between notes directly until the cluster grows
- The topic is covered by an existing map — add notes to it via `related:` instead of creating a duplicate
- It's really a project (has a defined outcome and end date) — use `projects/` instead
- It's really an area of responsibility (ongoing, no end date) — use `areas/` instead

