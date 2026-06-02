---
trigger: glob
globs: references`highlights`/**
---
# Highlights (`references`highlights`/`)

### Highlight-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `source:` | `kindle` \| `readwise` \| `web` | Recommended | Where the highlights were captured from. |
| `url:` | URL string | Optional | Source URL for web-based highlights. |
| `cover:` | URL string | Optional | Cover image URL for the source material. |

Note: Highlights use `✂️` as primary tag and `📚` as secondary tag.

### Frontmatter Example
```yaml
tags: [✂️, 📚]
create-date: "[[YYYY-MM-DD]]"
title: Source Title
cover: <cover URL>
url:
source: kindle | readwise | web
parent: "[[Book or Article]]"
related: "[[Highlights]]"
dg-publish: true
```

### Body
- Cover image embed
- `## Metadata`, `## Highlights`
- Each highlight as: `>[!QUOTE]` callout with source location link and `^ref-NNNNNN` block ID
- Highlights are separated by `---` horizontal rules

### Critical
- **Never remove `^ref-` block IDs** — zettelkasten notes cite them via `[[Highlights#^ref-NNNN]]`
