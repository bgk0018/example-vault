---
description: Process inbox items — triage unprocessed material into the correct vault folders
---
# Process Inbox Workflow

Guided triage of `inbox/` items following Allen's "clarify and organize" step. Each item gets identified, decided on, and moved to its permanent home — or deleted.

## 1. Survey the inbox

List all items in the inbox:

```bash
obsidian files folder="inbox" ext=md
```

If `Inbox.base` exists, query it for a sorted view:

```bash
obsidian base:query file="inbox/Inbox.base" format=md
```

Report: "[N] items in the inbox. Let's process them one at a time."

---

## 2. For each item

Read the item:

```bash
obsidian read path="inbox/[filename]"
```

### Clarify: What is it?

Ask the user (or infer from content):

- **Is it a reference to external material?** (article, video, book, podcast, person) → `references/`
- **Is it highlights/clippings from a source?** → `references/highlights/`
- **Is it a concept you can articulate in your own words?** → `zettelkasten/` (📖)
- **Is it a question or line of inquiry?** → `zettelkasten/` (❓)
- **Is it an idea or original work?** → `garden/` (🌱)
- **Is it related to an active project?** → `projects/[project]/`
- **Is it not worth keeping?** → delete it

Present the recommendation with reasoning: *"This looks like a web article about X. I'd suggest moving it to `references/articles/` with tag 📰."*

### Organize: Move it

For each decision, the LLM:

1. **Proposes frontmatter** — based on the target note type (see `references/property-cheatsheet.md`)
2. **Shows the complete note** — frontmatter + body
3. **Waits for approval**
4. **Creates/moves the note:**

For items that need a new note created from template:
```bash
obsidian templater:create-from-template template="f-lit.md" file="zettelkasten/Concept Name - YYYYMMDDHHmm.md"
```

For items that just need to be moved and retagged:
```bash
obsidian property:set name="tags" value="📰" type=list file="Item Name"
obsidian move file="Item Name" to="references/articles/"
```

For items to delete:
```bash
obsidian delete file="Item Name"
```

### Verify

After each move, confirm the item landed correctly:

```bash
obsidian read file="[moved note name]"
```

---

## 3. Connect

After processing all items, review what was created and suggest connections:

- `related:` links to Maps of Content and other connected notes
- `parent:` links to source material (for highlights/zettelkasten)

Present connections as recommendations, not automatic changes.

---

## 4. Log the session

Append to today's daily note:

```bash
obsidian append file="YYYY-MM-DD" content="## Inbox Processing\n**Items processed:** [count]\n\n**Moved:**\n- 📰 [[Article Name]] → references/articles/\n- 📖 [[Concept Name]] → zettelkasten/\n- 🗑️ Deleted: [item name]\n\n**Connections suggested:** [list]"
```

Daily notes use `YYYY-MM-DD` naming. Compute from the current date.

---

## Key Principles

- **One item at a time** — don't batch-process without user review
- **The LLM recommends; the user decides** — never auto-move or auto-delete
- **Use the Note Placement Decision Tree** (see Global Conventions) when unsure
- **Empty inbox is the goal** — but it's okay to leave items if the user isn't sure yet
- **Verify after each move** — confirm the note landed correctly with proper frontmatter
