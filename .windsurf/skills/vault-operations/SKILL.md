---
description: Decision trees and checklists for common vault operations — creating notes, moving between folders, connecting notes, and promoting maturity. Use when the user asks to create, move, file, connect, or promote a note.
---
# Vault Operations Skill

Consolidates decision logic for common vault operations. Use this when you need to decide *what type* of note to create, *where* to put it, *what properties* to set, or *how* to connect it.

## Create a Note

Walk the **Note Placement Decision Tree** (Global Conventions) to determine type and destination:

| If the content is... | Create as | Tag | Destination | Template |
|---|---|---|---|---|
| Unprocessed/unsorted material | Inbox item | — | `inbox/` | — |
| External source (book, article, person, video) | Reference | type-specific | `references/[subtype]/` | `f-media.md`, `f-person.md`, `f-location.md` |
| Highlights/clippings from a source | Highlights | ✂️ | `references/highlights/` | — |
| A single concept in your own words | Zettelkasten | 📖 | `zettelkasten/` | `f-lit.md` |
| An open question or inquiry | Question | ❓ | `zettelkasten/` | `f-question.md` |
| Tied to an active project (meeting, task, doc) | Project note | 👥/📋/🍃 | `projects/[project]/` | `f-meeting.md`, `f-session.md` |
| Original work, no active project | Garden idea | 🌱 | `garden/` | `f-idea.md` |
| Informal original work (context-bound) | Informal | 🍃 | `garden/` | `f-fleeting.md` |
| Topic index aggregating notes | Map of Content | 🗺️ | `maps/` | `f-map.md` |
| Periodic time entry | Journal | 📅 | `journal/[level]/` | `f-daily.md` etc. |
| Polished for publication | Blog article | 🥕 | `blog/articles/` | — |

**After creating**, always set:
1. Required properties: `tags`, `create-date`, `modified-dates`, `append_modified_update: true`
2. Recommended: `parent:`, `related:`
3. Type-specific properties per `references/property-cheatsheet.md`

## Move a Note Between Folders

When a note changes type or location, update these properties:

| Move | Property changes needed |
|---|---|
| `inbox/` → `references/[type]/` | Add correct `tags`, `title`, type-specific properties |
| `inbox/` → `zettelkasten/` | Add `tags: [📖]`, `referenced-in`, rename to `Title - YYYYMMDDHHmm.md` |
| `inbox/` → `garden/` | Add `tags: [🌱]`, rename to `Title - YYYYMMDDHHmm.md` |
| `garden/` → `blog/articles/` | Change `tags` to `[🥕]`, set `dg-publish: true`, add `dg-path`, `title` |
| `projects/` → `archive/YYYY/projects/` | Set `end-date`, `ended-as` on project file first |
| `projects/` → `garden/` | Change `tags` to `[🌱]` or `[🍃]`, remove `projects:` |
| `projects/` → `zettelkasten/` | Change `tags` to `[📖]`, add `referenced-in`, rename |

**Always use CLI `move`** — it updates backlinks automatically:
```bash
obsidian move file="Note Name" to="destination/folder/"
```

## Connect Notes

Use the Idea Compass directions to decide which property to use:

| Direction | Question | Property | Example |
|---|---|---|---|
| **North** (upstream) | What does this belong to? | `parent:` | Zettel → Source Book, Meeting → Project |
| **West** (similar) | What reinforces this? | `related:` | Zettel → Map, Zettel → related Zettel |
| **East** (opposing) | What challenges this? | `challenges:` | Zettel → counterargument note |
| — | Should this appear on a map? | `maps:` | Person → `[[Psychology]]` (when `related:` is occupied) |
| — | Where did this come from? | `referenced-in:` | Zettel → Highlight or Book |

**Decision: `related:` vs `maps:`**
- Note's primary associative links *are* maps → use `related:`
- Note uses `related:` for non-map connections AND should appear on a map → add `maps:` too
- Reference notes (people, articles, highlights) → default to `maps:`

**Decision: `parent:` vs `related:`**
- `parent:` = singular, hierarchical ("belongs to")
- `related:` = plural, associative ("connected to")

## Promote Maturity (Garden Notes)

| Promotion | Criteria (guidelines, not gates) | CLI |
|---|---|---|
| `🌱` → `🌿` | Clear thesis, cites ≥1 📖 note, has `related:` to a map, structured with headings | `obsidian property:set name="tags" value="🌿" file="Note"` |
| `🌿` → `🌳` | Coherent end-to-end, counterarguments addressed, language cleaned up, all relevant maps linked | `obsidian property:set name="tags" value="🌳" file="Note"` |
| `🌳` → Harvest | Move to `blog/articles/`, change tag to `🥕`, set `dg-publish: true` | See "Move a Note" section |
| `🌳` → Keep | Stays in `garden/` with `dg-publish: false` — a finished private piece | No action needed |

**Always ask before promoting.** Present the criteria checklist and let the user decide.

## Check Before Creating

Before creating any zettelkasten note, search for duplicates:

```bash
obsidian search query="[concept name]" limit=10
obsidian aliases
```

If a note already covers the concept:
- **Same idea** → link to it, add new source to `referenced-in:`
- **New angle** → create with distinct title, link via `related:`
- **Existing note outdated** → update in place

## Verify After Any Operation

After creating, moving, or updating a note:

```bash
obsidian read file="Note Name"
```

Confirm: correct tags, correct folder, correct frontmatter, body intact.
