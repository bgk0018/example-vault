# Obsidian CLI First

**Always prefer the Obsidian CLI over Windsurf built-in tools** for vault interactions. The CLI talks to a live Obsidian instance and understands wikilinks, tags, backlinks, Bases, templates, and the plugin ecosystem.

## Skill Reference

Before using the CLI, invoke the **`obsidian-cli` skill** to load full command syntax, parameters, and decision guidance. The skill includes:

- `SKILL.md` — when to use CLI vs Windsurf tools, syntax essentials, key gotchas
- `references/commands.md` — complete command reference organized by category
- `references/plugin-dev.md` — plugin reload/test cycle, dev tools, DOM inspection, screenshots

When unsure about a command's exact syntax or parameters, **invoke the skill first** rather than guessing.

## Default Tool Priority

For any vault operation, attempt the CLI first. Only fall back to Windsurf tools (`read_file`, `edit`, `grep_search`, `write_to_file`, etc.) when the CLI lacks the capability or when precision text surgery is required.

### Creating Notes

- **Use:** `obsidian create name="Note Name" content="..."` or `obsidian templater:create-from-template`
- **Fallback:** `write_to_file` only if Obsidian is not running or the CLI cannot handle the specific creation scenario.

### Reading / Getting Note Content

- **Use:** `obsidian read file="Note Name"` — resolves wikilinks and aliases automatically.
- **Fallback:** `read_file` with an absolute path when you already know the exact path or need line-number references for edits.

### Modifying Notes

- **Frontmatter:** `obsidian property:set` — type-aware, handles YAML correctly.
- **Appending/Prepending:** `obsidian append` / `obsidian prepend`.
- **Fallback:** Windsurf `edit` / `multi_edit` for precise find-and-replace within a note body. The CLI lacks targeted in-body replacement.

### Searching Notes

- **Use:** `obsidian search` — respects Obsidian's index, aliases, tags, and relevance ranking.
- **Fallback:** `grep_search` for raw regex patterns across many files, or when the search needs to match code/format patterns the CLI search doesn't support.

### Querying Bases

- **Use:** `obsidian base:query file="folder/Name.base"` — the only way to get computed/filtered results from a Base view.
- **Fallback:** `read_file` on the `.base` file only gives the YAML definition, not computed results.

### Task Notes

- **Use:** `obsidian tasks` to list tasks, `obsidian task` to interact with individual tasks.
- **Fallback:** `grep_search` for `- [ ]` patterns if CLI task commands don't cover the use case.

### Link Graph Operations (CLI Only)

These have **no Windsurf equivalent** — always use CLI:

- `obsidian backlinks` — find what links to a note
- `obsidian links` — find what a note links to
- `obsidian orphans` — find unlinked notes
- `obsidian unresolved` — find broken wikilinks

### Moving / Renaming Notes

- **Use:** `obsidian move` / `obsidian rename` — updates all backlinks automatically.
- **Never:** use filesystem move/rename — this breaks all wikilinks.

### Browsing Vault Structure

- **Use:** `obsidian tags`, `obsidian files`, `obsidian folders`
- **Fallback:** `find_by_name`, `list_dir` when you need filesystem-level detail (sizes, dates, glob patterns).

## Known CLI Limitations

Update this section as limitations are discovered.

- **Precise in-body text replacement:** CLI has no find-and-replace for note body content. Use Windsurf `edit` tool.

## Known CLI Workarounds

Update this section as non-obvious CLI techniques are discovered.

- **Multi-line `content=` in `create`/`append`/`prepend`:** Use `\n` for newlines and `\t` for tabs inside the `content="..."` string. Do NOT use literal newlines in the shell command — that breaks Obsidian's IPC JSON parsing. Example: `obsidian create name="Note" content="---\ntags:\n  - 📋\n---\n# Title\n\nBody text"`. Works for full notes with YAML frontmatter.

## Key Gotchas

- `base:query` needs the full vault-relative path: `file="garden/Garden.base"` not `file="Garden"`
- `property:set type=list` **replaces** the entire list — use comma-separated values: `value="alpha,beta,gamma"`
- `create` doesn't open the note — add `open` or `newtab` flag if needed
- **Never use PowerShell `Get-Content`/`Set-Content`** on `.md` files — corrupts multi-byte UTF-8 characters (emoji tags). Use CLI or Windsurf `edit` instead.
