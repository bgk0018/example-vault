---
aliases: []
append_modified_update: true
create-date: "[[2026-01-01]]"
dg-pinned: true
dg-publish: true
modified-dates:
  - "[[2026-01-01]]"
related:
tags:
  - 🥕
---
# Articles

Finished pieces — polished, complete, and ready to share.

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Title",
	create-date as "Published"
FROM "blog/articles"
WHERE contains(tags, "🥕") AND dg-publish = true
SORT create-date DESC
```
