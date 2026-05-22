---
name: obsidian-cli
description: Interact with Obsidian vaults using the Obsidian CLI to read, create, search, and manage notes, tasks, properties, and more. Query and create items in Obsidian Bases (.base database views). Also supports plugin and theme development with commands to reload plugins, run JavaScript, capture errors, take screenshots, and inspect the DOM. Use this skill whenever the user asks to interact with their Obsidian vault, manage notes, search vault content, query or work with Bases, perform vault operations from the command line, or develop and debug Obsidian plugins and themes. Also use when the user wants to find connections between notes, explore their knowledge graph, manage tasks in Obsidian, promote garden notes, append to daily notes, or navigate vault structure — even if they don't mention "CLI" explicitly.
---
# Obsidian CLI

Use the `obsidian` CLI to interact with a running Obsidian instance. Requires Obsidian to be open.

Run `obsidian help` to see all available commands. Full docs: https://help.obsidian.md/cli

For full command syntax and parameters, see `references/commands.md`. For plugin/theme development, see `references/plugin-dev.md`.

## When to use CLI vs Windsurf built-in tools

The CLI talks to a live Obsidian instance — it understands wikilinks, tags, backlinks, Bases, templates, and the plugin ecosystem. Windsurf's built-in tools (`read_file`, `edit`, `grep_search`) operate on raw files with no Obsidian awareness.

| Task | Use CLI | Use Windsurf tools |
|------|---------|-------------------|
| **Read a note by name** | `obsidian read file="Note Name"` — resolves wikilinks, aliases | `read_file` — need exact absolute path |
| **Search vault content** | `obsidian search` — respects Obsidian's index, aliases, tags | `grep_search` — raw text match, faster for regex |
| **Find connections** | `obsidian backlinks`, `links`, `orphans`, `unresolved` — only CLI understands the link graph | No equivalent |
| **Edit note body** | `obsidian append` / `prepend` — preserves Obsidian sync/history | `edit` — precise find-and-replace within a file |
| **Modify frontmatter** | `obsidian property:set` — type-aware, handles YAML correctly | `edit` — works but risks YAML formatting issues |
| **Create from template** | `obsidian templater:create-from-template` — processes Templater syntax | `write_to_file` — no template processing |
| **Create with content** | `obsidian create` — places in vault, resolves names | `write_to_file` — need exact path |
| **Query a Base view** | `obsidian base:query` — only way to get computed/filtered results | Read `.base` file — only sees the YAML definition |
| **Move/rename a note** | `obsidian move` / `rename` — updates all backlinks automatically | File system move — breaks all wikilinks |
| **Manage tasks** | `obsidian tasks`, `task` — understands task status, dates | `grep_search` for `- [ ]` — raw text only |
| **Browse vault structure** | `obsidian tags`, `files`, `folders`, `orphans` — Obsidian-aware | `find_by_name`, `list_dir` — filesystem only |

**Rules of thumb:**
- **Link-aware operations → CLI.** Anything involving wikilinks, backlinks, tags, or Bases requires the CLI because Windsurf tools don't understand Obsidian's link graph.
- **Precise text surgery → Windsurf `edit`.** When you need to find-and-replace specific text in a note body, the `edit` tool is more precise than CLI append/prepend.
- **Bulk file discovery → either.** `grep_search` is faster for regex patterns across many files; `obsidian search` is better when you want results ranked by Obsidian's relevance or scoped by metadata.

## Syntax essentials

**Parameters** take a value with `=`. Quote values with spaces:
```bash
obsidian create name="My Note" content="# Hello"
```

**Flags** are boolean switches with no value:
```bash
obsidian create name="My Note" overwrite open
```

For multiline content use `\n` for newline and `\t` for tab.

**Multi-vault:** Use `vault=<name>` before any command to target a different vault:
```bash
obsidian vault=work read file="Meeting Notes"
```

**File targeting** — two ways to identify a note:
- `file=<name>` — resolves like a wikilink (name only, no path or extension needed)
- `path=<path>` — exact path from vault root, e.g. `folder/note.md`

Without either, the active file is used.

Use `total` on any list command to get a count instead of full results.

## Key gotchas

- **`base:query` needs full path:** `file="views/Garden.base"` not `file="Garden"`
- **`property:set type=list` replaces the entire list** — it does not append. Use comma-separated values: `value="alpha,beta,gamma"`
- **`create` doesn't open the note** — add `open` or `newtab` flag to open in the UI
- **`move`/`rename` updates backlinks** — always prefer CLI over filesystem operations for moves

## Reference files

For the complete command reference organized by category, see:
- `references/commands.md` — all commands with syntax, parameters, and examples
- `references/plugin-dev.md` — plugin reload/test cycle, dev tools, DOM inspection, screenshots
