---
trigger: glob
globs: references/articles/**
---
# Articles (`references/articles/`)

### Article-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `url:` | URL string | **Yes** | Source URL of the article. |
| `authors:` | YAML list of `"[[Author Name]]"` | Recommended | Wiki-links to author person notes. Note: some older notes use `author:` (singular) — prefer `authors:` (plural). |
| `published:` | `"[[YYYY-MM-DD]]"` | Optional | Publication date of the article. |

### Frontmatter Example
```yaml
tags: [📰]
create-date: "[[YYYY-MM-DD]]"
title: Article Title
url: https://...
authors:
published: "[[YYYY-MM-DD]]"
cssClasses: [cards, cards-cols-4]
dg-publish: false
modified-dates:
related:
parent:
```

### Body
- `# Article Title`
- `## Concepts` — dataview query for related `#📖` notes
- `>[!summary]- Description`
- `## Content` — article content or notes
