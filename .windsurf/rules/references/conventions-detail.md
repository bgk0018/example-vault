# Global Conventions — Extended Reference

Detailed guidance extracted from the always-on global conventions. Read this file when you need depth on a specific topic — the core rule file has pointers to each section.

## The Idea Compass

The Idea Compass, described by **Steven Thompson** in *The Idea Compass: Expanding Ideas*, is a framework for expanding any idea in four directions. When creating or linking a note, ask yourself what lies in each direction:

- **North — Where does this idea come from?** Upstream themes, broader concepts, and parent categories. What is this a part of? What field or discipline does it belong to? In the vault, this maps to the `parent:` and `related:` properties — linking a note to the map, book, or concept it sits under.
- **South — Where does this idea lead?** Downstream applications, consequences, and examples. What does this enable? What would happen if you applied it? South connections often become new zettelkasten notes or project ideas that are *derived from* the current note.
- **West — What is similar to this idea?** Reinforcing ideas, analogies, parallel concepts from other domains. What supports or strengthens this idea? West connections enrich the `related:` field — linking to notes that rhyme with this one across disciplines.
- **East — What opposes or challenges this idea?** Contradictions, counterarguments, tensions, and transformative perspectives. What would someone who disagrees say? In the vault, this maps to the `challenges:` property — linking to notes that push back on or complicate the idea.

The compass is not a checklist to complete on every note, but a **thinking prompt** for when you're linking. If a note feels isolated, pick a direction and ask the question — a connection will usually emerge.

## The Garden: Two Systems, One Cycle

The vault operates two complementary knowledge systems, inspired by **Maggie Appleton's** *A Brief History & Ethos of the Digital Garden* and **Mike Caufield's** *The Garden and the Stream*:

```
References (📕, 📰, 🎥)  →  Zettelkasten (📖)  →  Garden (🌱→🌿→🌳)  →  Blog (🥕)
         raw material            atomic soil            growing plants         harvest
```

**Zettelkasten = the soil.** Classical Luhmann model — 📖 notes are atomic concepts written in your own words. They default to **update-in-place**: revise directly when understanding deepens. Use `supersedes:` only when your understanding fundamentally changes.

**Garden = the plants.** Digital garden model — 🌱/🌿/🌳 notes are original work that grows through maturity stages (`🌱` → `🌿` → `🌳`). When a note reaches `🌳` (evergreen), it is either **harvested** to the blog or **kept** as a mature private piece. A garden note draws from the zettelkasten by synthesizing multiple 📖 notes into an argument, essay, tutorial, or opinion piece.

All work flows through a gardening cycle that **implements** the capture→publish pipeline below:

```
🌱 Plant  →  🌿 Tend  →  🌳 Harvest  →  🌱 Plant ...
```

| Phase | Action | Vault equivalent |
|-------|--------|------------------|
| **Plant** | Bring in new material, discuss it, decide where seeds go | `inbox/` → `references/` → `zettelkasten/` + `🌱` |
| **Tend** | Revisit existing notes, fill gaps, strengthen connections, develop drafts | `Garden.base` → gardening workflow |
| **Harvest** | When a creation reaches evergreen, publish it or keep it private | `🌳` → `blog/articles/` (harvest) or stays in `garden/` (keep) |

The key insight: **harvesting loops back to planting**. A synthesis that emerges from discussion re-enters the gardening conversation as a new candidate to plant.

**The LLM's role** is that of a **gardening companion** — Socratic, not autonomous. It facilitates divergent-then-convergent thinking, searches for connections, and suggests specific actions, but **never creates or modifies notes without user approval**. The `Garden.base` view serves as the **tending queue**: the primary entry point for identifying what needs attention.

**Learning exhaust** (inspired by **swyx's** *Learn in Public*): the gardening process should produce publishable artifacts. Insights from discussion become `🌱` seedlings that feed the maturity pipeline.

## Information Flow

Information moves through the vault in a pipeline. Each stage refines raw input into lasting knowledge. The gardening cycle (🌱 Plant → 🌿 Tend → 🌳 Harvest) is the **operational rhythm** that drives this pipeline — not a parallel model.

```
capture → catalog → distill → connect → publish
```

| Stage | Action | From | To |
|-------|--------|------|----|
| **Capture** | Grab anything that catches your attention | External world | `inbox/` |
| **Catalog** | Triage inbox items into typed reference notes | `inbox/` | `references/` (with `highlights/` for passages) |
| **Distill** | Rewrite highlighted passages as atomic concepts in your own words | `references/highlights/` | `zettelkasten/` |
| **Connect** | Link zettelkasten notes to maps, related notes, and challenges via the Idea Compass | `zettelkasten/` | `maps/`, `related:`, `challenges:` |
| **Publish** | Set `dg-publish: true` on mature notes; move finished articles to blog | `zettelkasten/`, `maps/`, `garden/` | `blog/` / Digital Garden |

This pipeline is not strictly linear — you can create a zettelkasten note directly without an inbox step, or publish a map before all its notes are complete. But the general flow is: **capture → catalog → distill → connect → publish**.

Projects and Areas operate in parallel: they generate meetings, tasks, and working notes that may feed into the pipeline (e.g., a project insight becomes a zettelkasten note). Areas provide the ongoing context in which projects exist — a project's `parent:` typically points to an area file. When a project ends, triage its contents into the appropriate folders and archive the rest.

## Linking Properties Compared

Three context properties connect notes to other notes. They serve different purposes:

| Property | Relationship | Direction | Use When | Example |
|----------|-------------|-----------|----------|---------|
| `parent:` | **Hierarchical** — "belongs to" | Child → Parent (up the tree) | A note is structurally *part of* another note. One parent only. | Meeting → Project or Area, Daily → Weekly, Zettel → Source Book, Project → Area |
| `related:` | **Associative** — "is connected to" | Peer ↔ Peer (lateral) | A note is thematically connected to a map, concept, or sibling note. Multiple values allowed. Maps discover notes via this field. | Zettel → Map of Content, Zettel → related Zettel |
| `maps:` | **Explicit MOC tag** — "appears on this map" | Note → Map | A note should appear on a specific map's Dataview queries. Used on reference notes and meetings where `related:` is already occupied by non-map links. | Person → `[[Psychology]]`, Article → `[[Machine Learning]]` |

**When to use `related:` vs. `maps:`:**
- If the note's primary associative links *are* maps → use `related:` (this is the common case for zettelkasten notes and creations)
- If the note already uses `related:` for non-map connections and you also want it to appear on a map → add `maps:` as well
- Some note types (people, articles, highlights) default to `maps:` because their `related:` field typically points to a parent highlight or source, not a map

**When to use `parent:` vs. `related:`:**
- `parent:` is singular and hierarchical — it answers "what does this belong to?"
- `related:` is plural and associative — it answers "what is this connected to?"
- A zettelkasten note's `parent:` might be the book it came from, while its `related:` points to the maps it contributes to

## `challenges:` Guidance

The `challenges:` property connects a note to ideas that oppose, complicate, or provide tension against it (Idea Compass "East" direction). During gardening sessions, the LLM should actively look for challenge connections:

- **During planting** (ingesting a new source): "Does this new source contradict anything in [[X]]?"
- **During tending** (curating existing notes): "This note has no East-direction links — what might challenge it?"
- **The LLM suggests; the user decides.** Challenge links are never added automatically.

Good challenges are not merely "different topics" — they represent genuine intellectual tension: counterarguments, opposing frameworks, contradictory evidence, or alternative interpretations of the same phenomenon.

## Alias Guidance

Aliases make notes discoverable via Obsidian's link auto-suggest. Good aliases ensure you can find a note by any name you might naturally type when linking.

- **Short titles** — If the filename is long, add a concise version: `"Building a Second Brain"` → alias `"BASB"`
- **Acronyms and abbreviations** — `"Getting Things Done"` → alias `"GTD"`
- **Alternate phrasings** — `"The Pygmalion Effect"` → alias `"Rosenthal Effect"`, `"Self-Fulfilling Prophecy"`
- **People's names** — Include both formal and casual forms: `"Robert C. Martin"` → alias `"Uncle Bob"`
- **Stripped prefixes** — If a zettelkasten filename includes a timestamp, the alias is often the clean concept name: `Dynamic Tension - 202304171455` → alias `"Dynamic Tension"`
- **First alias = display name** — The first alias in the list is often used as the display name in Dataview table queries. Choose the most human-readable form as the first entry.

## Image and Asset Placement

- **Banner images** → `templates/banners/` — co-located with the templates that reference them
- **Project-specific assets** (screenshots, diagrams, attachments) → inside the project's subfolder in `projects/`
- **Blog article assets** → inside the article's subfolder in `blog/articles/YYYY-MM-DD - Title/`
- **Zettelkasten diagrams** → `zettelkasten/` alongside the note (Excalidraw files use `Title - YYYYMMDDHHmm.excalidraw.md`)
- **Reference covers** — Book and article covers are typically external URLs in the `cover:` property, not local files
- **General rule:** Keep assets co-located with the notes that use them. If an image is only used by one note, it lives in that note's folder. If it's shared (like a banner), it lives in `templates/banners/`.

## Inline Links vs. Frontmatter Links

Both wikilinks in the body and properties in the frontmatter create connections, but they serve different purposes:

- **Frontmatter properties** (`parent:`, `related:`, `maps:`, `challenges:`, `referenced-in:`) are **structured, queryable metadata**. Dataview queries read these fields to build tables, lists, and aggregations. If a connection should be discoverable by a query (e.g., "show all notes related to this map"), it must be in the frontmatter.
- **Inline wikilinks** (`[[Note Name]]` in the body) are **contextual references** — they explain *how* two notes relate within a sentence. The graph view picks these up, but Dataview queries generally do not (unless specifically coded to parse file content).

**Rule of thumb:**
- If a link represents a *structural relationship* (parent, map, source, challenge) → put it in the appropriate frontmatter property
- If a link provides *context within a paragraph* (mentioning a concept, citing a highlight with `#^ref-`, referencing a person in discussion notes) → use an inline wikilink
- Many connections deserve **both** — e.g., a zettelkasten note might have `related: "[[Psychology]]"` in frontmatter *and* mention `[[Psychology]]` in the body text

## Session Retrospective

At the end of any vault work session (gardening, migrations, audits, bulk edits, or any multi-step task), the LLM must **review the process** and look for improvements. Present recommendations covering:

- **Rules** (`.windsurf/rules/`) — Were any conventions unclear, contradictory, or missing? Did the work reveal an undocumented pattern that should be codified?
- **Workflows** (`.windsurf/workflows/`) — Were any steps clumsy, redundant, or in the wrong order? Could a new workflow automate a repeated sequence?
- **Skills** (`.windsurf/skills/`) — Were any CLI commands missing from the skill docs? Did the session rely on a tool interaction that should be documented?

Keep recommendations **specific and actionable** — e.g., "Add a `promotions:` view to `Garden.base` for notes that just changed maturity," not "Consider improving the workflow." The user decides which to adopt.
