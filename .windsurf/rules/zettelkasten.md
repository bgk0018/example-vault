---
trigger: glob
globs: zettelkasten/**
---
# Zettelkasten Notes

Atomic, permanent notes — each captures a single concept or idea. These are literature notes (distilled from sources) and concept notes.

Atomic, one-idea-per-note. Written in your own words, linked to sources and the knowledge graph. Update in place; use `supersedes:` only when the old framing was fundamentally wrong. Two types: `📖` (concepts) and `❓` (open questions). For philosophical grounding, see `references/ethos.md#zettelkasten`.

## Do Not
- Create non-atomic notes (multi-topic) in this folder
- Remove `^ref-` block reference IDs — they are used for precise citations
- Place meeting notes, project files, or journal entries here
- Duplicate concepts that already exist — link to them instead
- Copy-paste source text as the note body — distill it into your own words

## Do
- **Atomic:** One idea per note. If you're explaining two things, split into two notes.
- **Own words:** Write in clear, concise language — not copy-paste from sources.
- **Linked:** Connect to source material via `referenced-in` and to the knowledge graph via `related` or `maps`.
- **Findable:** Use descriptive `aliases` so the note can be found by different terms.
- Set `dg-publish: true` when the note is ready to share.
- Use block references (`[[Highlights#^ref-NNNN]]`) in the References section to cite specific passages.

## File Naming
- `Title - YYYYMMDDHHmm.md` (e.g., `Dynamic Tension - 202304171455.md`)
- Excalidraw diagrams: `Title - YYYYMMDDHHmm.excalidraw.md`
- Title should be the concept name, clear and concise

## Folder-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `referenced-in:` | YAML list of `"[[Note Name]]"` | Recommended | Links to source material (book, article, highlight) this concept was derived from. This is how zettelkasten notes trace provenance back to references. |
| `prompted-by:` | `"[[Note Name]]"` | Optional | Person or conversation that prompted the creation of this note. |
| `supersedes:` | `"[[Note Name]]"` or YAML list | Optional | Links to older zettelkasten notes that this note replaces or subsumes. Used only when your understanding **fundamentally changes** — the old framing was wrong and a new note replaces it. The superseded note should be kept (for backlink integrity) but can be marked with an alias redirect. |

### Frontmatter Example
```yaml
banner: "[[f-lit-20250108173451193.webp]]"
aliases:
  - Alias Name
tags: [📖, ♣️]
create-date: "[[YYYY-MM-DD]]"
parent:
related:
  - "[[Map of Content]]"
challenges:
dg-publish: true
referenced-in:
  - "[[Source Book or Article]]"
supersedes:
modified-dates:
  - "[[YYYY-MM-DD]]"
append_modified_update: true
maps:
```

## Body Structure
```markdown
# Content

[Concise explanation of the concept — one idea per note]

![[Optional Excalidraw Diagram]]

# References

[[Source Highlights#^ref-NNNN]]

# Flashcards
[Optional spaced-repetition flashcard content]
```
1. **`# Content`** — The atomic explanation. Keep it focused on one idea.
2. **Excalidraw embeds** — Optional visual diagrams supporting the concept
3. **`# References`** — Block references to specific highlights from source material
4. **`# Flashcards`** — Optional section for spaced-repetition study material

**Legacy pattern:** Notes created before mid-2024 may use the concept name as H1 (e.g., `# Anxiety`) and `## References` (H2) instead of `# Content` / `# References`. New notes should use the canonical structure above. Older notes can be migrated during tending but this is low priority — the content is correct either way.

## ❓ Question / Inquiry Notes

Question notes are first-class zettelkasten citizens. They capture **open lines of inquiry** — things you don't yet know but want to explore. Luhmann's zettelkasten tracked not just answers but the questions that drove his thinking forward.

**When to create ❓ vs 📖:**

| Create a... | When... |
|-------------|---------|
| 📖 | You have an idea or concept you can articulate in your own words — even if incomplete |
| ❓ | You have a *question* that emerged from reading or discussion, but no answer yet |

A ❓ note is a seed-shaped hole in the soil — it marks where understanding is missing and invites future planting. When the question gets answered (through reading, discussion, or insight), the answer becomes one or more 📖 notes linked via `related:`.

**❓ frontmatter follows the same pattern as 📖:**
```yaml
tags: [❓]
create-date: "[[YYYY-MM-DD]]"
parent:
related:
prompted-by: "[[Note or Person]]"
```

**❓ body is minimal:**
```markdown
# Content

[The question, clearly stated. Optionally: why it matters, what prompted it, what a good answer might look like.]

# References

[Optional: sources that raised the question]
```

**During tending**, ❓ notes are natural gardening candidates — they surface gaps worth filling. The garden workflow should periodically review open ❓ notes and ask: "Do we know enough now to answer this?"

## Handling Duplicates and Overlaps

Before creating a new zettelkasten note, check whether the concept already exists:

1. **Search by concept name and aliases** — If a note already covers this idea, don't create a duplicate.
2. **If the existing note says the same thing** → link to it from the new source material. Add the new source to the existing note's `referenced-in:` list if it provides additional provenance.
3. **If your new perspective adds nuance** → create a new note with a distinct title that captures the difference, and link the two notes via `related:`. Two notes on similar topics are fine if each captures a genuinely different angle.
4. **If the existing note is incomplete or outdated** → update it in place rather than creating a parallel note. Add new references and expand the content section.
5. **If two notes turn out to cover the same ground** → merge them into one, keeping the better title and combining references. Redirect the other note's title as an alias.
