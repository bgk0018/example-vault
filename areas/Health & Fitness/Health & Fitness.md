---
banner: "[[f-map-20250108173714088.webp]]"
tags:
  - 🛒
create-date: "[[2026-05-23]]"
description: Physical health, exercise, and nutrition — maintaining fitness as an ongoing lifestyle commitment
modified-dates:
  - "[[2026-05-23]]"
append_modified_update: true
related:
---

# Health & Fitness

## Summary

Ongoing commitment to physical health through regular exercise, proper nutrition, and recovery. This area encompasses all fitness-related projects (marathon training, gym setup, etc.) and the knowledge systems that support them.

## Sub-areas

> [!folder]- Sub-areas

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Name",
	description as "Description"
FROM #🛒
WHERE contains(parent, this.file.link)
SORT file.name ASC
```

## Projects

> [!example]- Active Projects

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name"
FROM #🚧
WHERE contains(parent, this.file.link)
SORT create-date DESC
```

## Meetings & Notes

> [!note]- Meetings and Notes

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name",
	create-date as "Date"
FROM #👥 or #🧙
WHERE contains(parent, this.file.link)
SORT create-date DESC
```

## Related Maps

> [!compass]- Related Maps

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Map"
FROM "maps"
WHERE contains(related, this.file.link)
SORT file.name ASC
```
