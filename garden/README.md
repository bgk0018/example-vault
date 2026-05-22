# Garden

The garden is the vault's **nursery and workshop bench** — a place for original thinking that doesn't yet have a home in a project or a zettelkasten note. It bridges the gap between fleeting inspiration and structured output.

## Philosophy

This folder draws on Tiago Forte's concept of "intermediate packets" — reusable units of creative work that have value on their own, independent of any project. It also reflects the zettelkasten principle of separating **your ideas** from **other people's ideas**: references hold what others said, the zettelkasten holds your distilled understanding, and the garden holds your *original* output.

## Maturity Pipeline

Notes grow through flat maturity tags:

| Tag | Stage | Description |
|-----|-------|-------------|
| 🌱 | Seedling | A rough idea — has a thesis but is undeveloped |
| 🌿 | Growing | Has real substance, cites sources, structured with headings |
| 🌳 | Evergreen | Mature and complete — could be published or kept private |
| 🍃 | Informal | Original work tied to a specific context (not fleeting) |

**🌳 = mature**, not "ready to publish." Publishing is orthogonal (`dg-publish` + move to `blog/`).

## File Naming

`Title - YYYYMMDDHHmm.md` — same as zettelkasten notes.

## Required Frontmatter

```yaml
aliases:
  - Title Without Timestamp
tags: [🌱]  # or 🌿, 🌳, 🍃
create-date: "[[YYYY-MM-DD]]"
parent:
related:          # maps and peer notes
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
```

## Associated Workflows

- **`/garden plant`** — When a gardening session produces an original idea (not just a concept note)
- **`/garden tend`** — Develop seedlings, refine growing notes, check for promotion
- **`/garden harvest`** — Publish a 🌳 evergreen to `blog/articles/` as a 🥕

### Promotion Criteria

- **🌱 → 🌿**: Has a clear thesis, cites at least one 📖 note, structured with headings
- **🌿 → 🌳**: Argument is coherent end-to-end, counterarguments addressed, language polished
- **🌳 → Harvest**: Move to `blog/articles/`, change tag to 🥕, set `dg-publish: true`

## Tending States (visible in `Garden.base`)

| View | What it surfaces |
|------|-----------------|
| Seedling 🌱 | All seedlings, sorted by modification date |
| Growing 🌿 | All growing notes |
| Stale | Seedlings or growing notes not modified in 30+ days |

## Example Notes in This Vault

- **Training Program Design Framework** (🌱) — Stale seedling, undeveloped stub
- **The Case for Sleep as a Performance Enhancer** (🌿) — Growing, has substance, ready for promotion check
- **Why Most Fitness Advice Is Wrong** (🌳) — Mature evergreen, could be harvested to blog
