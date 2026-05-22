# Zettelkasten

The zettelkasten is the vault's **soil** — a collection of atomic concept notes, each capturing one idea rewritten in your own words. This is where lasting understanding lives. As Sönke Ahrens describes in *How to Take Smart Notes*, the process flows from source → highlights → literature notes. The zettelkasten note is where you stop paraphrasing and start *thinking*.

## Note Types

| Tag | Type | Description |
|-----|------|-------------|
| 📖 | Literature / Concept Note | One idea, in your own words, linked to sources and peers |
| ❓ | Question / Inquiry | A line of inquiry worth tracking — may eventually produce 📖 notes |

## File Naming

`Title - YYYYMMDDHHmm.md` — e.g., `Progressive Overload - 202604151030.md`

The timestamp suffix ensures uniqueness. The first alias is the display name (without timestamp).

## Required Frontmatter

```yaml
aliases:
  - Title Without Timestamp
tags: [📖]  # or [❓]
create-date: "[[YYYY-MM-DD]]"
parent:           # hierarchical parent (source book, map)
related:          # maps and peer notes
referenced-in:    # source material this was derived from
challenges:       # notes that contradict this idea (Idea Compass East)
prompted-by:      # (❓ only) person or note that prompted the question
dg-publish: true
modified-dates:
append_modified_update: true
```

## Key Properties

- **`parent:`** — Points to the source (e.g., the book this concept came from)
- **`related:`** — Connects to Maps of Content and peer notes. This is how maps discover notes.
- **`referenced-in:`** — The specific reference note or highlight file the idea was derived from
- **`challenges:`** — Links to notes that contradict or complicate this idea (Idea Compass "East" direction)

## Body Structure

```markdown
# Title

[Your explanation of the concept in your own words]

## References

[^1]: ![[Source Highlights#^ref-123456]]
```

## Associated Workflows

- **`/garden plant`** — Process a source and extract concepts into 📖 notes
- **`/garden tend`** — Connect disconnected notes, find challenges, refine understanding

## Tending States (visible in `Garden.base`)

| State | What it means | Action needed |
|-------|--------------|---------------|
| Disconnected | Empty `related:` and no `parent:` | Connect to maps and sources |
| Unchallenged | Has `referenced-in:` but no `challenges:` | Find contradicting ideas |
| Parentless | No `parent:` set | Assign a hierarchical parent |

## Example Notes in This Vault

- **Progressive Overload** — Well-linked model note with citations, parent, related, challenges
- **Central Governor Theory** — Well-linked, challenges Progressive Overload (Idea Compass East)
- **Sleep and Recovery** — Disconnected (needs `related:` and `parent:`)
- **Protein Timing** — Unchallenged (needs `challenges:` links)
- **Muscle Memory** — No parent
- **Periodization** — Fully orphaned (worst case for tending)
- **Does Cold Exposure Improve Recovery** — ❓ question note, open inquiry
