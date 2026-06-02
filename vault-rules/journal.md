---
trigger: glob
globs: journal/**
---
# Journal Notes

Periodic journaling in a time hierarchy: daily → weekly → monthly → quarterly → yearly. Auto-created on startup. Tracking (not narrating) — structured data for habits, time, and tasks. For philosophical grounding, see `references`ethos`.md#journal`.

## Do Not
- Change the numbered folder prefixes (`1-daily/`, `2-weekly/`, etc.)
- Alter the Habits table structure without asking — it feeds dataview queries
- Remove or reformat `toggl` code blocks
- Create non-journal notes in this folder
- Add `parent:` to yearly notes — they are the hierarchy root

## Do
- Follow the template for each level — templates are the source of truth for structure
- Let the startup script auto-create journal notes; only create manually if the script missed one
- Use the Habits table in daily notes for tracking (dataview queries depend on it)
- Keep `toggl` code blocks intact — they render time-tracking summaries

## Folder Structure
| Subfolder | Level | File Naming | Template | Example |
|-----------|-------|-------------|----------|---------|
| `journal/1-daily/` | Daily | `YYYY-MM-DD.md` | `templates`f-daily`.md` | `2026-02-23.md` |
| `journal/2-weekly/` | Weekly | `gggg-Www.md` | `templates`f-weekly`.md` | `2026-W08.md` |
| `journal/3-monthly/` | Monthly | `YYYY-MM.md` | `templates`f-monthly`.md` | `2026-02.md` |
| `journal/4-quarterly/` | Quarterly | `YYYY-Qq.md` | `templates`f-quarterly`.md` | `2026-Q1.md` |
| `journal/5-yearly/` | Yearly | `YYYY.md` | `templates`f-yearly`.md` | `2026.md` |

For exact frontmatter and body structure, follow the template for each level.

## Folder-Specific Properties

| Property | Format | Levels | Description |
|----------|--------|--------|-------------|
| `before:` | `"[[sibling note]]"` | All | Link to the previous sibling at the same level (e.g., yesterday's daily, last week's weekly). |
| `after:` | `"[[sibling note]]"` | All | Link to the next sibling at the same level. |
| `parent:` | `"[[parent note]]"` | Daily → Quarterly | Link upward through the hierarchy (day→week, week→month, etc.). Yearly notes have **no** parent — they are the top of the hierarchy. |
| `children:` | YAML list of `"[[child note]]"` | Weekly → Yearly | List of wiki-links to child period notes (e.g., a weekly note lists its daily children). Not present on daily notes. |

### Hierarchy Navigation
```
day → week → month → quarter → year
```
- `parent:` links upward; `children:` links downward
- `before:`/`after:` link to previous`next` sibling at the same level

## Co-located Views
- `Journal.base` — journal views (daily feed, weekly`monthly``quarterly` tables). Lives in `journal/`.
- `Habits.md` — habit tracking charts embedded in daily notes via `![[Habits]]`. Lives in `journal/`.

## Gardening Sessions in Daily Notes

When a gardening session occurs (via the ``garden`` workflow), a `## Gardening:` section is appended to that day's daily note using `obsidian append`. This section is **not** part of the `f-daily.md` template — it only appears on days when gardening happens.

### Structure

```markdown
## Gardening: [Source or Topic Name]
**Session type:** Plant | Tend
**Source:** [[Source Note]] (for Plant sessions)

[Narrative summary — what was discussed, what the LLM suggested, what you chose and why]

**Produced:**
- 📖 [[Note Name - YYYYMMDDHHmm]]
- 🌱 [[Note Name - YYYYMMDDHHmm]]
- ❓ [[Note Name - YYYYMMDDHHmm]]
```

### What to record
- **Session type** — Plant (ingesting new material) or Tend (curating existing notes)
- **Source** — the reference or note that triggered the session (for Plant)
- **Narrative** — captures *why* decisions were made, what connections were found, what the LLM surfaced
- **Produced** — manifest of everything the session created, with wiki-links and type tags

### Integration with reviews
The daily→weekly→monthly hierarchy already provides aggregation. Weekly reviews can scan gardening sections across the week's daily notes to see what was planted and tended.

## CLI Operations (via @obsidian-cli)

Use the Obsidian CLI for daily note operations — it resolves wikilink-style names and preserves Obsidian sync`history`, which Windsurf's `edit` and `read_file` tools can't do.

### Read and modify a daily note

Daily notes use `YYYY-MM-DD` naming (e.g., `2026-05-21`). Compute today's date from the current date.

```bash
obsidian read file="2026-05-21"                                                    # read today's note
obsidian append file="2026-05-21" content="- Met with Sarah about Q3 planning"     # append a line
obsidian prepend file="2026-05-21" content="## Morning"                            # prepend (after frontmatter)
```

Prefer `obsidian append`/`prepend` over the Windsurf `edit` tool for adding content — it ensures Obsidian picks up the change immediately and preserves sync history.

### Create a journal note from template

```bash
obsidian templater:create-from-template template="f-daily.md" file="journal/1-daily/2026-05-21.md"
obsidian templater:create-from-template template="f-weekly.md" file="journal/2-weekly/2026-W21.md"
```

### Query today's tasks

```bash
obsidian tasks daily todo                                   # today's incomplete tasks
obsidian task daily line=3 done                             # mark a daily note task done
```

