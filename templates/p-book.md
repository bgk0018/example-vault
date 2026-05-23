---
banner: "[[p-book-20250109115424464.webp]]"
banner-display: auto
tags:
  - 📕
aliases:
  - "{{title}}"
create-date: "[[{{date}}]]"
title: "{{title}}"
publisher: "{{publisher}}"
publish-date: "{{publishDate}}"
page-count: {{totalPage}}
isbn10: "{{isbn10}}"
isbn13: "{{isbn13}}"
cover: "{{coverUrl}}"
cssclasses:
  - cards
  - cards-cols-4
recommended-by:
status: todo
related:
parent:
dg-publish: false
append_modified_update: true
modified-dates:
maps: []
authors:
  - "{{authors}}"
---
![cover|150]({{coverUrl}})

>[!Summary]  
> {{description}}

# Concepts
```dataview
TABLE WITHOUT ID link(file.link, aliases[0]) as "Name", "Weight: "+ length(file.inlinks) as "Weight" FROM #📖 WHERE contains(referenced-in, link("{{title}} - {{author}}")) SORT length(file.inlinks) DESC
```
