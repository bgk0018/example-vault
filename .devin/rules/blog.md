---
trigger: glob
globs: blog/**
---
# Blog / Digital Garden

Public-facing content published via the Obsidian Digital Garden plugin. `dg-publish: true` controls what's public. Drafts live in `garden/` until ready. For philosophical grounding, see `references/ethos.md#blog--digital-garden`.

## Do Not
- Remove `dg-publish`, `dg-pinned`, or `dg-home` properties — they control the public site
- Place draft/private content in `blog/` — drafts should live in `garden/` until ready
- Break the article folder naming convention (`YYYY-MM-DD - Title/`)
- Set `dg-home: true` on any note other than `blog/Home.md`

## Do
- Set `dg-publish: true` on any note intended for the public Digital Garden
- Use `dg-pinned: true` on index pages so they appear in the navigation sidebar
- Follow the `YYYY-MM-DD - Title/` subfolder convention for articles
- Keep draft content in `garden/` until ready to publish, then move to `blog/articles/`
- Set `dg-path:` on articles to control their public URL path

## Folder Structure
```
blog/
  Home.md               # Landing page (dg-home: true)
  Articles.md           # Article index
  Highlights.md         # Highlights index
  Maps of Content.md    # MOC index
  articles/             # Published articles in date-prefixed folders
    YYYY-MM-DD - Title/
      article.md
      [supporting assets]
```

## Folder-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `dg-home:` | `true` | Home.md only | Marks the Digital Garden home page. Only used on `blog/Home.md`. |
| `dg-pinned:` | `true` | Index pages | Pins the page in the Digital Garden navigation sidebar. Used on `Home.md`, `Articles.md`, `Highlights.md`, `Maps of Content.md`. |
| `dg-path:` | string path | Articles | Custom URL path in the Digital Garden. Overrides the default vault-path-based URL. Example: `articles/2024-11-29 - Title`. |
| `title:` | string | Articles | Display title used by the Digital Garden for the article page. |

## Index Pages
### Frontmatter Example
```yaml
aliases: []
append_modified_update: true
create-date: "[[YYYY-MM-DD]]"
dg-pinned: true
dg-publish: true
modified-dates:
related:
tags: [🥕]
```

### Body
- Index pages use dataview queries to list content from their respective sources
- `Home.md` provides navigation table with links to Articles, Maps of Content, and Highlights

## Articles
- Live in `blog/articles/` in date-prefixed subfolders: `YYYY-MM-DD - Title/`
- Each article folder contains the article `.md` and any supporting assets

## Co-located Views
- `Blog.base` — Digital Garden publishing dashboard. Lives in `blog/`.

## Publishing Control
- `dg-publish: true` — note is published to the Digital Garden
- `dg-publish: false` — note is private (default for most vault notes)
- Notes outside `blog/` can also be published by setting `dg-publish: true` (e.g., maps, zettelkasten notes, highlights)

