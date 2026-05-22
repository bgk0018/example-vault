---
trigger: glob
globs: maps/**
---
# Maps of Content (MOCs)

Navigational index notes that aggregate related notes via dataview queries. Emergent (not imposed), entry points (not containers), published by default. For philosophical grounding, see `references/ethos.md#maps-of-content`.

## Do Not
- Remove or restructure the standardized sections without asking
- Place content notes inside `maps/` — maps are index/navigation notes only
- Break the dataview query patterns — they rely on the `related` and `parent` field conventions
- Manually list notes in the body — use dataview queries instead

## Do
- Use a plain descriptive name without a date suffix for the filename
- Follow the standardized body structure (Summary → Exploration → Projects → Concepts → Notes → References → Other)
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
- Notes link to a map by including the map in their `related:` or `parent:` frontmatter field
- The map's dataview queries automatically pick up notes that reference it via either field
- Notes do NOT need to live inside a `maps/` subfolder — they stay in their own folders

## Template
- `templates/f-map.md`

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

