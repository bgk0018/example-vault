---
trigger: glob
globs: garden/**
---
# Garden

Original work — ideas, drafts, talks, personal writings — that doesn't belong in an active project. Notes grow through maturity stages (🌱→🌿→🌳). For philosophical grounding, see `references/ethos.md#garden`.

## Do Not
- Place external reference material here — that belongs in `references/`
- Create active project files here — use `projects/` for active work
- Assume files here are unimportant — they are intentionally kept
- Publish garden notes directly — move them to `blog/articles/` first via the Harvest path

## Do
- Use this folder for original work that doesn't belong in an active project
- Set `dg-publish: false` by default — move to `blog/` when ready to publish
- Link to Maps of Content via `related:` so creations are discoverable
- Use `challenges:` to link to notes that question or contradict the idea
- Keep notes free-form — there is no rigid body structure for creations

## File Naming
- `Title - YYYYMMDDHHmm.md` (e.g., `Software Data Contracts Are Important - 202504061038.md`)
- Excalidraw files: `Title - YYYYMMDDHHmm.excalidraw.md`
- Some older files may lack the timestamp suffix

## Maturity System

Garden ideas use flat emoji tags to encode maturity. The stage names and philosophy come from **Maggie Appleton's** digital garden taxonomy; the promotion criteria are adapted from **Gwern's** epistemic disclosure model.

| Tag | Meaning | Tending action |
|-----|---------|---------------|
| `🌱` | **Seedling** — rough idea, early draft | Develop: add substance, cite 📖 notes |
| `🌿` | **Growing** — has substance, still developing | Refine: polish argument, fill gaps |
| `🌳` | **Evergreen** — mature and complete | Harvest (publish) or Keep (private) |

### Promotion Criteria

**🌱 → 🌿 (Seedling to Growing)** — the idea has real substance now:

- Has a **clear thesis or argument** — not just a title and a few sentences
- Cites at least one 📖 zettelkasten note as supporting evidence (drawing from the soil)
- Has a `related:` link to at least one map (discoverable)
- Body is **structured** — has headings, not just a stream of text

**🌿 → 🌳 (Growing to Evergreen)** — the piece is mature and complete:

- Argument is **coherent end-to-end** — a reader could follow it without context
- Has considered **counterarguments** (`challenges:` populated, or addressed inline)
- Language is **cleaned up and clarified** (Appleton: "work I've cleaned up and clarified")
- Has `related:` links to all relevant maps

**🌳 — What next?** When a note reaches evergreen, ask: *"Is this for publication or for keeps?"*

- **Harvest** → move to `blog/articles/`, change tag to `🥕`, set `dg-publish: true`. The note becomes a published blog article.
- **Keep** → stays as `🌳` in `garden/` with `dg-publish: false`. A finished personal piece — eulogies, private essays, personal letters, mature ideas not meant for the public.

These criteria are **guidelines, not gates**. Maturity is a judgment call made during tending, not a checklist to satisfy mechanically. The LLM may suggest promotion; the user decides.

## 🍃 Definition

🍃 means **"informal original work tied to a specific context"** — not temporary or fleeting in the Ahrens sense. These are project working documents, personal correspondence, creative fiction, and other context-bound writing. Classical fleeting capture (quick thoughts, raw ideas) is served by `inbox/` and daily journal entries.

## Frontmatter Examples

Ideas (seedling):
```yaml
banner: "[[f-idea.webp]]"
aliases: ["Short Name"]
tags: [🌱]
create-date: "[[YYYY-MM-DD]]"
parent:
related:
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
```

Informal original work:
```yaml
banner: "[[f-fleeting-20250108172947397.webp]]"
aliases: ["Short Name"]
tags: [🍃]
create-date: "[[YYYY-MM-DD]]"
parent:
related:
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
```

Speaking/publishing content adds `📫` to tags.

## Body Structure
```markdown
# Title

[Content — free-form]

## References
[Optional links to source material]
```

## Co-located Views
- `Garden.base` — the tending queue. Lives in `garden/`.

## Templates
- Ideas (seedling): `templates/f-idea.md` — creates a `🌱` note
- Informal original work: `templates/f-fleeting.md`

## CLI Operations (via @obsidian-cli)

Use the Obsidian CLI for garden operations — it understands the link graph, tags, and Bases that Windsurf's built-in tools can't see.

### Promote maturity

Tag promotion (e.g., 🌱 → 🌿) is a single `property:set` call — it replaces the tag list:

```bash
obsidian property:set name="tags" value="🌿" file="Note Name"
```

### Discover and map connections

When tending a note, use CLI link analysis to understand its place in the vault:

1. **Map incoming links:** `obsidian backlinks file="Note Name"` — who references this note?
2. **Map outgoing links:** `obsidian links file="Note Name"` — what does this note reference?
3. **Find gaps:** `obsidian unresolved counts` — concepts mentioned but lacking their own page

### Vault health (gardening tools)

These commands surface structural issues — disconnected notes, broken links, and items needing attention:

| Need | Command |
|------|---------|
| **Orphan notes** (no incoming links) | `obsidian orphans` |
| **Dead-end notes** (no outgoing links) | `obsidian deadends` |
| **Unresolved links** (mentioned but no page) | `obsidian unresolved counts` |
| **Tag distribution** | `obsidian tags sort=count counts` |
| **Note structure** | `obsidian outline file="Note Name"` |

### Gardening session startup sequence

1. `obsidian read file="YYYY-MM-DD"` — read today's daily note (compute date from current date)
2. `obsidian base:query file="garden/Garden.base" view="Seedling 🌱" format=paths` — check tending queue
3. `obsidian unresolved counts` — surface gaps worth filling
4. `obsidian orphans` — find disconnected notes worth linking

### Create a garden note from template

Use `templater:create-from-template` — it processes Templater syntax (dates, prompts). Use `create` with `content=` only for simple notes without template needs.

```bash
obsidian templater:create-from-template template="f-idea.md" file="garden/Note Title - YYYYMMDDHHmm.md" open
```

