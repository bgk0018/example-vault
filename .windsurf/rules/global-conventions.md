---
trigger: always_on
---

# Obsidian Vault Global Conventions

This is a personal Obsidian knowledge management vault. All files are markdown (`.md`) or Obsidian-specific formats (`.canvas`, `.excalidraw.md`, `.base`).

## Philosophy

Notes exist for **recall**. Every note should be contextualized so it can be rediscovered later. Use the LATCH method (Location, Alphabet, Time, Category, Hierarchy) and the Idea Compass to build connections between notes.

Note types are **mutually exclusive** — each note has one primary type denoted by an emoji tag. Occasionally a note may carry a second tag, but this is not preferred.

### The Idea Compass

A four-direction thinking prompt for linking notes: **North** (upstream → `parent:`, `related:`), **South** (downstream applications), **West** (similar ideas → `related:`), **East** (opposing ideas → `challenges:`). Not a checklist — use when a note feels isolated. See `references/conventions-detail.md#the-idea-compass` for full explanation.

Note categories at a high level:
- **Reference Notes** — pointers to external material (books, articles, people, videos). Rarely edited after creation.
- **Temporal Notes** — captured in real-time (highlights, fleeting notes, meetings). May be disposable or feed into literature notes.
- **Atomic Notes (Zettelkasten)** — one idea per note, in your own words, linked to sources and maps.
- **Journal Notes** — periodic entries (daily → weekly → monthly → quarterly → yearly).

## Link Syntax
- Use Obsidian wiki-link syntax: `[[Note Name]]` or `[[Note Name|Display Text]]`
- For block references: `[[Note Name#^block-id]]`
- For heading references: `[[Note Name#Heading]]`
- Embed/transclude with: `![[Note Name]]`

## Frontmatter Baseline
All content notes must include YAML frontmatter. At minimum: `tags:`, `create-date:`, `modified-dates:`, and `append_modified_update: true`. See the **Global Property Reference** section below for the full catalog of properties, their formats, and which are required.

## Tag System (Emoji Tags)
Tags represent note types. Authoritative source: `[[Current Tags - 202303181855]]`

| Tag | Type | Folder |
|-----|------|--------|
| 🗺️ | Map of Content | `maps/` |
| 📖 | Literature / Concept Note | `zettelkasten/` |
| 🌱 | Idea / Creation (seedling) | `garden/` |
| 🌿 | Idea / Creation (growing) | `garden/` |
| 🌳 | Idea / Creation (evergreen) | `garden/` |
| ❓ | Question / Inquiry | `zettelkasten/` |
| 📥 | Inbox | `inbox/` (future) |
| 🍃 | Informal Original Work | `garden/` |
| 👥 | Meeting | `projects/` (in project folder) |
| ⏱️ | Temporal Note | varies |
| ✂️ | Highlights / Clippings | `references/highlights/` |
| 📰 | Article | `references/articles/` |
| 🎓 | Course | `references/classes/` |
| 🎧 | Podcast | `references/podcasts/` |
| 🎥 | Video | `references/videos/` |
| 📕 | Book | `references/books/` |
| 🙂 | Person | `references/people/` |
| 🎙️ | Talk | `references/` or `garden/` |
| 📌 | Location | `references/locations/` |
| 🏢 | Organization | `references/organizations/` |
| 🚧 | Project | `projects/` |
| 📋 | Task (note-based) | `projects/<project>/tasks/` |
| 📅 | Calendar / Journal | `journal/` |
| 🎹 | Music | `references/music/` |
| 🥕 | Garden / Blog Note | `blog/` |
| 🍽️ | Recipe | `references/recipes/` |
| ♣️ | Spaced Repetition (secondary tag) | `zettelkasten/` (on notes with `# Flashcards` section) |
| 🧙 | RPG / Session | `projects/` or RPG folders |

## Global Property Reference

All frontmatter values that are dates use wiki-linked format: `"[[YYYY-MM-DD]]"`. List-type properties use YAML list syntax. Wiki-link properties wrap note names in `"[[…]]"`.

### Identity Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `tags:` | YAML list of emoji strings | **Yes** | Primary emoji tag identifying note type. One tag preferred; a second tag is acceptable but not encouraged. |
| `aliases:` | YAML list of strings | Optional | Alternative names for the note. Obsidian uses these for link auto-suggest. First alias is often used as display name in Dataview queries. See **Alias Guidance** below. |
| `title:` | string | Folder-specific | Display title of the note. Used primarily in reference notes (books, articles, videos, highlights) and blog articles. Not needed when the filename is the canonical title. |

### Time Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `create-date:` | `"[[YYYY-MM-DD]]"` | **Yes** | The date the note was created. Always wiki-linked. |
| `modified-dates:` | YAML list of `"[[YYYY-MM-DD]]"` | **Yes** | Tracks every date the note was meaningfully changed. Managed automatically when `append_modified_update` is `true`. |
| `append_modified_update:` | `true` | **Yes** | Enables the auto-append plugin to add today's date to `modified-dates` on save. Always set to `true` on content notes. |

### Context Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `parent:` | `"[[Note Name]]"` | Recommended | The hierarchical parent of this note. Points up the note tree — e.g., a zettelkasten note's parent is the source book, a meeting's parent is the project. |
| `related:` | YAML list of `"[[Note Name]]"` | Recommended | Links to Maps of Content or thematically related notes. This is how maps discover notes via Dataview queries. |
| `maps:` | YAML list of `"[[Note Name]]"` | Optional | Explicit association to Maps of Content. Some note types use this instead of or alongside `related`. Commonly appears on reference notes (people, articles, highlights, classes) and meeting notes. |
| `referenced-in:` | YAML list of `"[[Note Name]]"` | Optional | Source material this note was derived from — the reference note or highlight whose ideas were rewritten here. Used primarily in zettelkasten notes. |
| `prompted-by:` | `"[[Note Name]]"` | Optional | Person or conversation that prompted the creation of this note. Used primarily in zettelkasten notes. |
| `challenges:` | `"[[Note Name]]"` or YAML list | Optional | Links to notes that challenge or contradict this note's idea. Supports the Idea Compass "East" direction. See **`challenges:` Guidance** below. |
| `supersedes:` | `"[[Note Name]]"` or YAML list | Optional | Links to older notes that this note replaces or subsumes. Used when merging duplicates or evolving a concept. Primarily used in `zettelkasten/`. |

### Display Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `banner:` | `"[[image-file.webp]]"` | Optional | Banner image displayed at the top of the note via the Banners plugin. Typically references an image in `templates/` (e.g., `f-meeting.webp`, `f-one-on-one.webp`). |
| `cssclasses:` | YAML list of strings | Optional | CSS classes applied to the note for visual layout. Common value: `[cards, cards-cols-4]` for card-style Dataview results. Used on book and article reference notes. |

### Publishing Properties (Digital Garden)

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `dg-publish:` | `true` / `false` | Optional | Controls whether the note is published to the Digital Garden. Default behavior if absent: not published. Set explicitly to `false` to suppress publishing on notes that might otherwise inherit it. |
| `dg-home:` | `true` | Blog-only | Marks the Digital Garden home page. Only used on `blog/Home.md`. |
| `dg-pinned:` | `true` | Blog-only | Pins the note in the Digital Garden navigation sidebar. Only used on blog index pages. |
| `dg-path:` | string path | Blog-only | Custom URL path in the Digital Garden. Overrides the default vault-path-based URL. Used on blog articles. |

## Heading Structure
- Start with `#` (H1) for the note title
- Use `##` (H2) for main sections
- Use `###` (H3) for subsections

## File Placement
- **Do not create files at the vault root.** Every note belongs in a folder.
- Use the appropriate folder based on the note type (see folder-specific rules).
- When unsure, ask rather than guessing.

### Note Placement Decision Tree

When creating or filing a note, walk this tree from top to bottom:

1. **Is it unprocessed material you haven't triaged yet?** → `inbox/`
2. **Is it about something external** (a book, article, person, video, place, recipe)?
   - Yes → `references/` in the appropriate subfolder by type
   - Is it highlights/clippings from a source? → `references/highlights/`
3. **Is it a single concept distilled in your own words from a source?** → `zettelkasten/` (📖)
4. **Is it a question or line of inquiry prompted by another note?** → `zettelkasten/` (❓)
5. **Is it tied to a project with a defined outcome?**
   - Meeting, session, one-on-one → inside the project's folder in `projects/`
   - Task → inside the project's `tasks/` subfolder
   - The project file itself → `projects/ProjectName Project/`
6. **Is it your original work** (idea, draft, brainstorm, talk, fiction, code snippet)?
   - If it belongs to an active project → keep it in that project's folder
   - If it's orphaned or project-free → `garden/`
7. **Is it a topic index that aggregates other notes?** → `maps/`
8. **Is it a periodic time entry** (daily, weekly, monthly, quarterly, yearly)? → `journal/`
9. **Is it polished and ready for public publication?** → `blog/articles/`
10. **Still unsure?** → `inbox/` (process it later during review)

### Two Knowledge Systems

**Zettelkasten = soil** (📖 atomic concepts, update-in-place). **Garden = plants** (🌱→🌿→🌳 original work growing through maturity). The gardening cycle: `🌱 Plant → 🌿 Tend → 🌳 Harvest/Keep → 🌱 Plant`. The LLM is a **Socratic gardening companion** — suggests, never auto-creates. See `references/conventions-detail.md#the-garden-two-systems-one-cycle` for full model.

### Information Flow

`capture → catalog → distill → connect → publish` (inbox → references → zettelkasten → maps/garden → blog). Projects operate in parallel and feed insights into this pipeline. See `references/conventions-detail.md#information-flow` for the full stage table.

### Linking Properties Quick Reference

- **`parent:`** — singular, hierarchical ("belongs to"). Meeting → Project, Zettel → Source Book.
- **`related:`** — plural, associative ("connected to"). Maps discover notes via this field. Default for zettelkasten and creations.
- **`maps:`** — explicit MOC association. Use when `related:` is occupied by non-map links (people, articles, highlights).
- **`challenges:`** — Idea Compass East. Genuine intellectual tension, not just different topics. LLM suggests; user decides.

Structural relationships → frontmatter properties. Contextual mentions → inline wikilinks. Many connections deserve both. See `references/conventions-detail.md#linking-properties-compared` for the full comparison table.

### Aliases

First alias = display name for Dataview. Add short titles, acronyms, alternate phrasings, stripped timestamps. See `references/conventions-detail.md#alias-guidance` for examples.

### Assets

Co-locate assets with the notes that use them. Banners → `templates/banners/`. Project assets → project subfolder. Blog assets → article subfolder. Covers → external URLs in `cover:` property. See `references/conventions-detail.md#image-and-asset-placement` for full rules.

## Dates
- Dates in frontmatter use `"[[YYYY-MM-DD]]"` format (wiki-linked for Obsidian navigation)
- Dates in file names use either `YYYY-MM-DD` or `YYYYMMDDHHmm` depending on the note type
- Date-based properties: `create-date`, `modified-dates`, `start-date`, `end-date`, `before`, `after`

## Dataview Queries
- Many notes contain `dataview`, `tasks`, or `toggl` code blocks — these are live queries rendered by Obsidian plugins
- Do not remove or reformat these blocks unless explicitly asked
- Preserve `^ref-` block IDs used for block references

## Templates
- Templates live in `templates/` and are the **source of truth** for note structure
- Templates are powered by the Templater plugin (`<%* %>` for JavaScript, `<% %>` for expressions)
- `f-*` templates create folders and move files; `p-*` templates add properties
- When creating notes, follow the structure defined by the relevant template
- Folder-specific rules reference templates — defer to the template for exact frontmatter and body structure

## Session Retrospective

At the end of any multi-step vault work session, review the process and suggest **specific, actionable** improvements to rules, workflows, or skills. See `references/conventions-detail.md#session-retrospective` for the full checklist.
