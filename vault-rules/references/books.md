---
trigger: glob
globs: references`books`/**
---
# Books (`references`books`/`)

### Book-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `authors:` | YAML list of `"[[Author Name]]"` | **Yes** | Wiki-links to author person notes in `references`people`/`. |
| `cover:` | URL string | Optional | Cover image URL (typically from Google Books). |
| `isbn10:` | string | Optional | 10-digit ISBN. |
| `isbn13:` | string | Optional | 13-digit ISBN. |
| `page-count:` | integer | Optional | Number of pages in the book. |
| `publish-date:` | `YYYY-MM-DD` | Optional | Publication date (plain date, not wiki-linked). |
| `publisher:` | string | Optional | Publisher name. |
| `recommended-by:` | YAML list of `"[[Person]]"` | Optional | Who recommended the book. Links to person notes. |
| `status:` | `todo` \| `reading` \| `done` | Recommended | Current reading status. |

### Frontmatter Example
```yaml
aliases: [Short Title]
append_modified_update: true
authors: ["[[Author Name]]"]
banner: <Google Books cover URL>
cover: <cover image URL>
create-date: "[[YYYY-MM-DD]]"
cssclasses: [cards, cards-cols-4]
dg-publish: true
isbn10: "..."
isbn13: "..."
modified-dates:
page-count: NNN
publish-date: YYYY-MM-DD
publisher:
recommended-by: ["[[Person]]"]
related: ["[[Map of Content]]"]
status: todo | reading | done
tags: [📕]
title: Full Title
parent:
```

### Body
- Cover image embed: `![cover|150](URL)`
- `>[!Summary]` callout with book description
- `# Concepts` — dataview query for `#📖` notes referencing this book
