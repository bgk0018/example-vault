# Windsurf LLM Harness

This folder contains the configuration that turns an LLM (like Claude or GPT) into a **Socratic vault companion** — an AI that understands the vault's conventions and can facilitate workflows without auto-creating or auto-modifying notes.

## Architecture

The harness has three layers:

| Layer | What it is | Location |
|-------|-----------|----------|
| **Rules** | Domain knowledge — how to do vault-specific tasks | `.windsurf/rules/` |
| **Skills** | Tool knowledge — how to use a specific tool | `.windsurf/skills/` |
| **Workflows** | Task sequences — step-by-step guided processes | `.windsurf/workflows/` |

## Rules (`rules/`)

Rules are always-on context that the LLM loads based on which files are being edited. They follow a consistent structure: Purpose → Do Not → Do → Folder Structure → Type-Specific Properties → CLI Operations.

| Rule | Scope |
|------|-------|
| `global-conventions.md` | Baseline conventions for all notes |
| `garden.md` | Garden folder + maturity pipeline |
| `zettelkasten.md` | Zettelkasten folder + note types |
| `projects.md` | Projects folder + lifecycle |
| `maps.md` | Maps of Content |
| `journal.md` | Journal hierarchy |
| `references.md` | References shared conventions |
| `references-books.md` | Book-specific rules |
| `references-people.md` | Person-specific rules |
| `references-highlights.md` | Highlight-specific rules |
| `references-articles.md` | Article-specific rules |
| `references-locations.md` | Location-specific rules |
| `references-media.md` | Video/podcast/game rules |
| `inbox.md` | Inbox conventions |
| `blog.md` | Blog/Digital Garden |
| `archive.md` | Archive conventions |
| `templates.md` | Template conventions |
| `obsidian-cli.md` | CLI-first tool priority |
| `bases.md` | Pointer to Bases skill |
| `canvas.md` | Pointer to Canvas skill |
| `obsidian-markdown.md` | Pointer to Markdown skill |

### Reference Files (`rules/references/`)

Lazy-loaded detail files — not always-on, loaded when needed:

- `conventions-detail.md` — Full Idea Compass, Two Systems model, Information Flow, Linking Properties
- `property-cheatsheet.md` — Quick-reference frontmatter for every note type
- `ethos.md` — Philosophical grounding for each folder

## Skills (`skills/`)

Skills teach the LLM how to use specific tools:

| Skill | Purpose |
|-------|---------|
| `obsidian-cli/` | Interact with Obsidian via CLI (read, create, search, move notes) |
| `obsidian-bases/` | .base file YAML syntax, filters, formulas |
| `obsidian-markdown/` | Obsidian Flavored Markdown (wikilinks, callouts, embeds) |
| `json-canvas/` | .canvas file format |
| `defuddle/` | Extract clean markdown from web pages |
| `vault-operations/` | Decision trees for creating, moving, connecting notes |
| `skill-creator/` | Create and improve Windsurf skills |

## Workflows (`workflows/`)

Step-by-step guided processes invoked via `/slash-commands`:

| Workflow | Command | Purpose |
|----------|---------|---------|
| `process-inbox.md` | `/process-inbox` | Triage inbox items into proper folders |
| `garden.md` | `/garden` | Plant new material or tend existing notes |
| `open-project.md` | `/open-project` | Socratic brainstorming for new projects |
| `close-project.md` | `/close-project` | Archive triage for completed projects |
| `review-projects.md` | `/review-projects` | Weekly project health check |
| `vault-lint.md` | `/vault-lint` | Audit files against conventions |

## Core Principle

**The LLM suggests; the user decides.** Nothing is auto-created or auto-modified. The LLM facilitates divergent-then-convergent thinking, presents recommendations with reasoning, and waits for approval before taking action.
