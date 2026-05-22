---
trigger: glob
globs: references/**
---
# Reference Notes

External source material organized by type. These are notes *about* things that exist outside the vault — people, books, articles, locations, etc.

External source material — not original work. Bibliographic anchors for provenance. Highlights (`✂️`) preserve author's words; zettelkasten (`📖`) distills them. For philosophical grounding, see `references/ethos.md#references`.

## Do Not
- Place original work here — your ideas go in `garden/` or `zettelkasten/`
- Remove `^ref-` block IDs from highlights — zettelkasten notes cite them
- Mix reference subtypes in the wrong subfolder (books in articles, etc.)
- Delete person notes that have backlinks — they connect meetings, recommendations, and projects

## Do
- Use the correct subfolder and tag for each reference type
- Link highlights to their source via `parent:`
- Use `maps:` to associate references with Maps of Content
- Preserve `>[!QUOTE]` callout format with `^ref-` block IDs in highlights
- Link `authors:` and `attendees:` to person notes in `references/people/`

## Subfolder Structure
```
references/
  articles/       # Web articles, blog posts (📰)
  books/          # Books (📕)
  classes/        # Courses, classes (🎓)
  games/          # Games
  highlights/     # Readwise/Kindle highlights (✂️)
  locations/      # Places with coordinates (📌)
  movies/         # Movies (🎥)
  music/          # Music
  organizations/  # Organizations
  people/         # People (🙂)
  podcasts/       # Podcasts (🗣️)
  series/         # TV series
  recipes/        # Recipes (🍽️)
  tosort/         # Unsorted references awaiting filing
  videos/         # Videos (🎥)
```

## Type-Specific Rules

Each major reference type has its own focused rule file loaded by glob:

- `references-books.md` — `references/books/**`
- `references-people.md` — `references/people/**`
- `references-highlights.md` — `references/highlights/**`
- `references-articles.md` — `references/articles/**`
- `references-locations.md` — `references/locations/**`
- `references-media.md` — videos, classes, recipes, podcasts, music, games, movies, series, organizations

For property details per type, see `references/property-cheatsheet.md`.

## `references/tosort/`
Flag all files here — they need to be sorted into proper subfolders.

