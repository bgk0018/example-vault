# Property Cheatsheet

Quick-reference mapping every note type to its required and recommended properties. Use this instead of reading full folder rules when you just need to know what frontmatter to set.

## Universal Required Properties

Every content note must have these:

```yaml
tags: [EMOJI]
create-date: "[[YYYY-MM-DD]]"
modified-dates:
  - "[[YYYY-MM-DD]]"
append_modified_update: true
```

## By Note Type

### 📖 Zettelkasten / ❓ Question (`zettelkasten/`)
```yaml
banner: "[[f-lit-20250108173451193.webp]]"
aliases: ["Clean Title"]
tags: [📖]           # or [❓] for questions; add ♣️ if flashcards
create-date: "[[YYYY-MM-DD]]"
parent:
related: ["[[Map of Content]]"]
challenges:
dg-publish: true
referenced-in: ["[[Source Book or Article]]"]
prompted-by:        # ❓ notes: person/note that prompted the question
supersedes:
modified-dates: ["[[YYYY-MM-DD]]"]
append_modified_update: true
maps:
```
- **Naming:** `Title - YYYYMMDDHHmm.md`
- **Template:** `f-lit.md` / `f-question.md`

### 🌱/🌿/🌳 Garden Idea (`garden/`)
```yaml
banner: "[[f-idea.webp]]"
aliases: ["Short Name"]
tags: [🌱]           # or 🌿, 🌳
create-date: "[[YYYY-MM-DD]]"
parent:
related:
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
```
- **Naming:** `Title - YYYYMMDDHHmm.md`
- **Template:** `f-idea.md`

### 🍃 Informal Original Work (`garden/`)
```yaml
banner: "[[f-fleeting-20250108172947397.webp]]"
aliases: ["Short Name"]
tags: [🍃]
create-date: "[[YYYY-MM-DD]]"
parent:
related:
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
```
- **Template:** `f-fleeting.md`

### 🗺️ Map of Content (`maps/`)
```yaml
banner: "[[f-map-20250108173714088.webp]]"
tags: [🗺️]
create-date: "[[YYYY-MM-DD]]"
modified-dates:
append_modified_update: true
description:
dg-publish: true
```
- **Naming:** Plain descriptive name (no date suffix)
- **Template:** `f-map.md`

### 🚧 Project (`projects/Name Project/`)
```yaml
banner: "[[image.webp]]"
tags: [🚧]
create-date: "[[YYYY-MM-DD]]"
start-date: "[[YYYY-MM-DD]]"
end-date:
ended-as:
parent:              # Area map (e.g., [[Technology]])
modified-dates:
append_modified_update: true
related:
```
- **Template:** `f-project.md`

### 👥 Meeting (`projects/Name Project/`)
```yaml
tags: [👥]
banner: "[[f-meeting.webp]]"
create-date: "[[YYYY-MM-DD]]"
parent: "[[ProjectName Project]]"
attendees: ["[[Person Name]]"]
maps:
modified-dates:
append_modified_update: true
```
- **Naming:** `Meeting Name Meeting - YYYYMMDDHHmm.md`
- **Template:** `f-meeting.md`

### 📋 Task (`projects/Name Project/tasks/`)
```yaml
tags: [📋]
status: todo         # todo | in-progress | done
due: YYYY-MM-DD      # plain date, NOT wiki-linked
scheduled: YYYY-MM-DD
priority: normal     # normal | high | low
projects: ["[[ProjectName Project]]"]
create-date: "[[YYYY-MM-DD]]"
append_modified_update: true
```

### 📅 Journal (`journal/`)
```yaml
tags: [📅]
banner: "[[level-banner.webp]]"
create-date: "[[YYYY-MM-DD]]"
before: "[[sibling]]"
after: "[[sibling]]"
parent: "[[parent-level]]"    # not on yearly
children: ["[[child]]"]       # weekly+ only
modified-dates:
append_modified_update: true
```
- **Templates:** `f-daily.md`, `f-weekly.md`, `f-monthly.md`, `f-quarterly.md`, `f-yearly.md`

### 📕 Book (`references/books/`)
```yaml
aliases: [Short Title]
tags: [📕]
title: Full Title
authors: ["[[Author Name]]"]
cover: <URL>
isbn10: "..."
isbn13: "..."
page-count: NNN
publish-date: YYYY-MM-DD
publisher:
recommended-by: ["[[Person]]"]
status: todo         # todo | reading | done
cssclasses: [cards, cards-cols-4]
create-date: "[[YYYY-MM-DD]]"
dg-publish: true
related: ["[[Map]]"]
parent:
modified-dates:
append_modified_update: true
```
- **Template:** (manual creation, no dedicated template)

### ✂️ Highlights (`references/highlights/`)
```yaml
tags: [✂️, 📚]
title: Source Title
cover: <URL>
url:
source: kindle       # kindle | readwise | web
parent: "[[Book or Article]]"
related: "[[Highlights]]"
dg-publish: true
maps: []
create-date: "[[YYYY-MM-DD]]"
modified-dates:
append_modified_update: true
```

### 🙂 Person (`references/people/`)
```yaml
banner: "[[f-person-20250109114009371.webp]]"
tags: [🙂]
name: Full Name
create-date: "[[YYYY-MM-DD]]"
maps: []
modified-dates:
append_modified_update: true
```
- **Template:** `f-person.md`

### 📰 Article (`references/articles/`)
```yaml
tags: [📰]
title: Article Title
url: https://...
authors: ["[[Author]]"]
published: "[[YYYY-MM-DD]]"
cssClasses: [cards, cards-cols-4]
dg-publish: false
create-date: "[[YYYY-MM-DD]]"
maps:
parent:
modified-dates:
append_modified_update: true
```

### 📌 Location (`references/locations/`)
```yaml
tags: [📌]
location: [longitude, latitude]
create-date: "[[YYYY-MM-DD]]"
related: ["[[Trip or Map]]"]
modified-dates:
append_modified_update: true
```
- **Template:** `f-location.md`

### 🥕 Blog Article (`blog/articles/`)
```yaml
tags: [🥕]
title: Article Title
dg-publish: true
dg-path: articles/YYYY-MM-DD - Title
create-date: "[[YYYY-MM-DD]]"
parent:
related:
challenges:
modified-dates:
append_modified_update: true
```

### 🍽️ Recipe (`references/recipes/`)
```yaml
tags: [🍽️]
url: https://...
source: web
create-date: "[[YYYY-MM-DD]]"
modified-dates:
append_modified_update: true
```
