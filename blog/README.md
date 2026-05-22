# Blog / Digital Garden

The blog folder implements a **digital garden** — a public workspace where ideas grow over time. Unlike a traditional blog (reverse-chronological, polished, finished), a digital garden publishes notes at varying stages of maturity, interlinked and revisited as understanding deepens.

## Philosophy

Inspired by Maggie Appleton, Andy Matuschak, and Mike Caulfield. The garden grows from the vault — it's not a parallel effort. Notes are selectively published using the `dg-publish` property, and the Digital Garden plugin handles rendering.

## Structure

```
blog/
├── Home.md                     # Landing page (dg-home: true)
├── Articles.md                 # Index of published articles
├── Highlights.md               # Published highlights index
├── Maps of Content.md          # Published maps index
└── articles/
    └── YYYY-MM-DD - Title/     # Article folder with assets
        └── Article.md
```

## Publishing Properties

| Property | Purpose |
|----------|---------|
| `dg-publish: true` | Note is published to the Digital Garden |
| `dg-home: true` | Marks the home page (only `Home.md`) |
| `dg-pinned: true` | Pins the note in the sidebar navigation |
| `dg-path:` | Custom URL path (overrides default) |

## How Notes Get Here

The `/garden harvest` workflow moves a mature 🌳 creation from `garden/` to `blog/articles/`:

1. Clean up private shorthand and vault-internal references
2. Move the file to `blog/articles/`
3. Change tag from 🌳 to 🥕
4. Set `dg-publish: true`
5. Optionally set `dg-pinned: true`

## Example Notes in This Vault

- **Home.md** — Landing page (`dg-home: true`, `dg-pinned: true`)
- **Articles.md** — Index page with Dataview query listing all published 🥕 articles
- **Highlights.md** — Index page listing published highlights
- **Maps of Content.md** — Index page with Dataview query listing all published 🗺️ maps
- **The Central Governor Theory Changed How I Think About Training** — Published article in `articles/` subfolder with co-located image asset, `dg-path:`, and footnote citations back to highlights

## Associated Workflows

- **`/garden harvest`** — Publishes an evergreen creation to the blog
