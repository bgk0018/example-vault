---
description: Unified gardening workflow for planting (ingesting new material) and tending (curating existing notes)
---
# Garden Workflow

A unified workflow for **planting** (ingesting new material) and **tending** (curating existing notes). The LLM facilitates **divergent then convergent thinking** — it does not auto-create notes.

## Determine session type

Ask the user which mode they want, or infer from context:

- **Plant** — the user has a source (file, URL, reference note) they want to process
- **Tend** — the user wants to curate existing notes from the tending queue

---

## Plant: Ingest a new source

The user provides a file, URL, or reference note. Follow these steps:

### 1. Read the source

Use `obsidian read file="Note Name"` for vault notes, or the file read tool for other files. For URLs, use Defuddle or WebFetch per the skill rules.

### 2. Orient in the vault

Run the vault navigation startup sequence:

```bash
obsidian read file="YYYY-MM-DD"                            # today's daily note (e.g., 2026-05-18)
obsidian search query="[topic from source]" limit=20
```

Daily notes use `YYYY-MM-DD` naming and live in `journal/1-daily/`.

### 3. Open divergent discussion

Ask the user open-ended questions to surface their thinking:

- What stood out to you? What surprised you?
- How does this connect to things you already know?
- What does this challenge or contradict?
- What questions does this raise?

Do NOT rush past this step. The goal is to help the user think, not to summarize.

### 4. Search for connections

Use CLI to find existing vault notes that relate:

```bash
obsidian search query="[key concept]" limit=10
obsidian backlinks file="[related note]"
```

Present findings as conversation starters, not as a dump of results. For each relevant connection, explain *why* it connects and what tension or reinforcement it creates.

### 5. Offer ready-made recommendations

Suggest specific metadata links with rationale:

- `related:` — maps and peer notes this connects to
- `parent:` — hierarchical parent if applicable
- `challenges:` — notes this contradicts or complicates (Idea Compass East)
- `referenced-in:` — source material (book, article, highlight) the idea was derived from (📖 notes only)
- `maps:` — MOCs this should appear on

**Never apply these automatically.** Present them as recommendations with reasoning.

### 6. Converge toward learning exhaust

Through discussion, identify what to create. For each candidate, help the user decide what kind:

- **📖 Zettelkasten note** — an atomic concept in their own words. Updated in place as understanding deepens.
- **❓ Question** — a line of inquiry worth tracking
- **🌱 Creation** — something bigger: an argument, essay idea, tutorial. Born as a seedling, will grow toward publication.
- **📋 Task** — an actionable item that emerged
- **Map updates** — new `related:` links to existing maps, or a signal that a new map is emerging

If an insight emerges during discussion worth keeping, say: *"This seems like a discussion worth keeping. Want to plant this?"* — then help decide what type.

### 7. Create notes with user approval

For each proposed note:

1. Show the complete frontmatter and body
2. Wait for confirmation
3. Create using `obsidian create` with `silent` flag
4. **Verify:** `obsidian read file="Note Name"` — confirm frontmatter and body match what was approved
5. Track what was created for the session log

### 8. Log the session in the daily note

Append a `## Gardening:` section to today's daily note. First find today's note filename, then append:

```bash
obsidian append file="YYYY-MM-DD" content="## Gardening: [Source Name]\n**Session type:** Plant\n**Source:** [[Source Note]]\n\n[Summary of discussion and decisions]\n\n**Produced:**\n- 📖 [[Note Name]]\n- 🌱 [[Note Name]]"
```

Daily notes use `YYYY-MM-DD` naming (e.g., `2026-05-18`). Compute from the current date.

---

## Tend: Curate existing notes

Driven by `Garden.base`, which surfaces notes needing attention.

### 1. Open the tending queue

Read `Garden.base` or ask the user which category to tend:

| Category | What it surfaces | Tending action |
|----------|-----------------|----------------|
| **Disconnected 📖** | Zettelkasten notes with empty `related:` and no `parent:` | Connect to maps, peers, challenges |
| **Unchallenged 📖** | Zettelkasten notes with `referenced-in:` but no `challenges:` | Examine from the Idea Compass "East" direction |
| **Seedling 🌱** | Creations tagged `🌱` | Develop — add substance, cite 📖 notes |
| **Growing 🌿** | Creations tagged `🌿` | Refine — polish toward publication |
| **Stale 💡** | Creations tagged `🌱` or `🌿` not modified in 30+ days | Revisit or accept it's dormant |
| **Parentless** | Notes with empty `parent:` | Assign a hierarchical parent |

### 2. Pick a candidate

Read the note:

```bash
obsidian read file="Note Name"
```

### 3. Facilitate discussion per note type

**For 📖 zettelkasten notes** — tending = *connecting and refining*:

- Search for maps to link via `related:`: `obsidian search query="[concept]"`
- Look for `challenges:` links (Idea Compass East): "What might challenge this idea?"
- Check `referenced-in:` — does the note trace back to its source material? If empty, search for the book, article, or highlight it was derived from and suggest adding provenance.
- Discover peers via `obsidian backlinks file="Note Name"`
- If understanding has deepened since the note was written, suggest revisions — update in place by default
- Use `supersedes:` only when the old framing was fundamentally wrong

**For 🌱/🌿/🌳 creations** — tending = *developing*:

- Expand the draft, refine the argument
- Search for 📖 notes that support the thesis: `obsidian search query="[thesis topic]"`
- Cite zettelkasten notes that feed the creation
- When ready, suggest maturity promotion:
  - `🌱` → `🌿`: has real substance now
  - `🌿` → `🌳`: mature and complete
  - `🌳` → harvest (publish) or keep (private)

**For ❓ question notes** — tending = *answering*:

- Review the question: "Do we know enough now to answer this?"
- Search for 📖 notes that address the question: `obsidian search query="[question topic]"`
- If answerable → create one or more 📖 notes with the answer, link them to the ❓ via `related:`
- If partially answerable → refine the question, note what's still missing
- If still open → leave it; open questions are valuable

### Promotion check

After every tending discussion, ask: **"Does this note now meet the criteria for the next maturity stage?"** (See `garden.md` for full criteria.)

- `🌱`: Has it gained a clear thesis, cited a 📖 note, and been structured with headings? → Promote to `🌿`
- `🌿`: Is the argument coherent end-to-end, are counterarguments addressed, is the language cleaned up? → Promote to `🌳`
- `🌳`: Is this for publication or for keeps? → Harvest (publish) or Keep (private)

This check should be a **standard closing prompt** for every tending session, not something the LLM only raises when it seems obvious.

### 4. Execute only with approval

For every change (property update, content edit, maturity promotion):

1. Show what will change and why
2. Wait for confirmation
3. Apply using `obsidian property:set name="prop" value="val" file="Note Name"` or file edit tools
4. **Verify:** `obsidian read file="Note Name"` — confirm properties and content are correct

### 5. Log the session

Append to today's daily note as in the Plant flow (see Plant step 8).

---

## Harvest: Publish an evergreen creation

When a `🌳` creation is ready for publication:

1. Review and clean up any private shorthand or vault-internal references
2. Move the file:
   ```bash
   obsidian move file="Note Name" to="blog/articles/"
   ```
3. Update the tag:
   ```bash
   obsidian property:set name="tags" value="🥕" type=list file="Note Name"
   ```
4. Set publishing properties:
   ```bash
   obsidian property:set name="dg-publish" value="true" type=checkbox file="Note Name"
   ```
5. Optionally pin to the garden homepage:
   ```bash
   obsidian property:set name="dg-pinned" value="true" type=checkbox file="Note Name"
   ```
6. Log the harvest in the daily note

The note becomes a **published blog article** (`🥕`) — the end of the creation pipeline. See `garden.md` for full promotion criteria.

---

## Daily cadence

Tend at least one candidate per day. The `Garden.base` tending queue makes this easy — open it, pick the top item, spend 5-10 minutes.

## Key principles

- **Divergent then convergent** — explore broadly before narrowing to specific outputs
- **The LLM suggests; the user decides** — never auto-create or auto-modify notes
- **Learning exhaust** — every session should produce something that could eventually be published
- **Provenance in the daily journal** — session narrative and manifest go in the daily note, not on individual notes
- **Harvesting loops back to planting** — a synthesis that emerges doesn't get auto-filed; it re-enters as a new candidate to plant
