# Garden

The garden is the vault's **creative ground** — a place for original thinking that grows through maturity stages. It is where *your* ideas live, develop, and eventually reach publication or remain as private evergreens.

## Philosophy

This folder draws on **Mike Caufield's** [garden-vs-stream](https://hapgood.us/2015/10/17/the-garden-and-the-stream-a-technopastoral/) distinction and **Maggie Appleton's** [digital garden ethos](https://maggieappleton.com/garden-history). Where streams (feeds, timelines, chat) are fleeting and chronological, a garden accumulates knowledge over time in an explorable, richly linked space. Appleton identifies six defining patterns:

1. **Topography over Timelines** — notes are connected by theme, not sorted by date
2. **Continuous Growth** — nothing is ever "done"; notes evolve alongside your thinking
3. **Imperfection & Learning in Public** — ideas are shared as seedlings, with maturity indicators signaling epistemic status
4. **Playful, Personal, Experimental** — gardens are idiosyncratic, not cookie-cutter
5. **Intercropping & Content Diversity** — mix of formats, not just linear prose
6. **Independent Ownership** — you own the space, built on portable formats (markdown)

The garden and the zettelkasten have a symbiotic relationship: **zettelkasten = soil, garden = plants**. Garden notes draw from zettelkasten concepts as supporting evidence (promotion from 🌱 to 🌿 requires citing at least one 📖 note). References hold what others said, the zettelkasten holds your distilled understanding, and the garden holds your *original* output.

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
