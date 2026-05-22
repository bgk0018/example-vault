# Maps of Content

Maps of Content (MOCs) are the vault's **navigational layer** — topic indexes that gather related notes in one place so you can see patterns, spot gaps, and decide what to explore next. Drawn from Nick Milo's *Linking Your Thinking* (LYT) framework.

## Philosophy

A MOC is not a folder, a tag, or a table of contents. It is a **thinking tool** — a note that lets related ideas talk to each other. MOCs emerge naturally when you notice a cluster of notes orbiting the same topic. They are created *after* you have enough notes to warrant one, not before.

## How Maps Work

Maps use Dataview queries to automatically aggregate notes that link to them via the `related:` or `parent:` property. When you set `related: [[Exercise Science]]` on a zettelkasten note, it automatically appears in the Exercise Science map.

### Standard Sections

Every map follows this structure (from the `f-map.md` template):

| Section | What it collects | Source tags |
|---------|-----------------|------------|
| `## Summary` | Your written overview of the topic | (manual) |
| `## Exploration` | Ideas and questions | 🌱, 🌿, 🌳, ❓ |
| `## Projects` | Hands-on work | 🚧 |
| `## Concepts` | Distilled knowledge | 📖 |
| `## Notes` | Temporal notes | ⏱️, 👥, 🧙 |
| `## References` | Source material | 📰, 🎥, 🎓, 📕 |
| `## Other` | Catch-all for untagged items | everything else |

## File Naming

Plain descriptive names — `Exercise Science.md`, `Nutrition.md`. No date suffix.

## Required Frontmatter

```yaml
tags: [🗺️]
create-date: "[[YYYY-MM-DD]]"
description:        # one-line topic description
dg-publish: true
modified-dates:
append_modified_update: true
```

## Associated Workflows

- **`/garden tend`** — When tending disconnected notes, suggest maps to link via `related:`
- **`/garden plant`** — When creating new notes, recommend relevant maps
- **`/review-projects`** — Area horizon scan groups projects by their `parent:` map

## Example Maps in This Vault

- **Exercise Science** — Primary map with a filled summary. Aggregates books, zettelkasten notes, projects, and creations.
- **Nutrition** — Smaller secondary map connected to protein/recovery notes.
