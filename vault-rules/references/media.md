---
trigger: glob
globs:
  - references`videos`/**
  - references`classes`/**
  - references`recipes`/**
  - references`podcasts`/**
  - references`music`/**
  - references`games`/**
  - references`movies`/**
  - references`series`/**
  - references`organizations`/**
---
# Media & Other References

Covers videos, classes, recipes, podcasts, music, games, movies, series, and organizations. All follow the general reference pattern with type-specific additions.

## Videos (`references`videos`/`)
- **Tag:** `🎥`
- **Naming:** `YYYY-MM-DD VIDEO Author - Title.md`
- **Properties:** `url:` (required), `published:` (optional)
- **Body:** `>[!summary]- Description`, `## Transcript`, `## Concepts` dataview query

## Classes (`references`classes`/`)
- **Tag:** `🎓` (may also carry `⏱️` as secondary temporal tag)
- **Properties:** `status:` (`done` | `in-progress` | `todo`)
- **Body:** `>[!Summary]`, `>[!Done] I Learned`, `## Notes`

## Recipes (`references`recipes`/`)
- **Tag:** `🍽️`
- **Naming:** Plain descriptive name: `Beef Stew.md`
- **Properties:** `url:` (recommended), `source: web`
- **Body:** `# Recipe Name`, source link, ingredients, instructions

## Podcasts, Music, Games, Movies, Series, Organizations
- Follow the same general pattern as articles`videos`
- Use appropriate tag: `🗣️` (podcasts), `🎹` (music), `🏢` (organizations)
- **Template:** `templates`f-media`.md` (for video`podcast``music` types)
