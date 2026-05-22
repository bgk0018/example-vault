# Obsidian CLI Command Reference

Complete command reference organized by category. Every command and parameter from `obsidian help` is documented here. For decision guidance on when to use these commands vs Windsurf built-in tools, see the main SKILL.md.

## Table of Contents

- [Read](#read)
- [Create](#create)
- [Append & Prepend](#append--prepend)
- [Delete](#delete)
- [Open](#open)
- [Property commands](#property-commands)
- [Properties (vault-wide)](#properties-vault-wide)
- [Move and rename](#move-and-rename)
- [File & folder exploration](#file--folder-exploration)
- [Outline](#outline)
- [Search](#search)
- [Link analysis](#link-analysis)
- [Bases (Databases)](#bases-databases)
- [Tags](#tags)
- [Tasks](#tasks)
- [TaskNotes plugin](#tasknotes-plugin)
- [Templater](#templater)
- [Homepage plugin](#homepage-plugin)
- [History & recovery](#history--recovery)
- [Commands & hotkeys](#commands--hotkeys)
- [Plugin management](#plugin-management)
- [Themes & CSS snippets](#themes--css-snippets)
- [App & vault management](#app--vault-management)

---

## Read

```bash
obsidian read file="Note Name"
obsidian read path="folder/note.md"
```

| Parameter | Description |
|-----------|-------------|
| `file=` | File name (resolves like a wikilink) |
| `path=` | Exact vault-relative path (e.g., `folder/note.md`) |

## Create

```bash
obsidian create name="New Note" content="# Hello"
obsidian create name="New Note" template="Template Name"
obsidian create path="folder/New Note.md" content="# Hello" overwrite
obsidian create name="New Note" open                        # open after creating
obsidian create name="New Note" newtab                      # open in new tab
```

| Parameter | Description |
|-----------|-------------|
| `name=` | File name |
| `path=` | File path (vault-relative) |
| `content=` | Initial content |
| `template=` | Template to use |
| `overwrite` | Overwrite if file exists |
| `open` | Open file after creating |
| `newtab` | Open in new tab after creating |

Files do **not** open in the UI by default. Use `open` or `newtab` to open after creating.

## Append & Prepend

```bash
obsidian append file="Note Name" content="Text to append"
obsidian append path="folder/note.md" content="Text to append"
obsidian append file="Note Name" content="inline text" inline   # no trailing newline
obsidian prepend file="Note Name" content="Text to prepend"
obsidian prepend file="Note Name" content="inline text" inline
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `file=` / `path=` | Yes | Target file (wikilink name or vault-relative path) |
| `content=<text>` | Yes | Content to append/prepend |
| `inline` | No | No trailing newline |

Prepend inserts after frontmatter, before body.

## Delete

```bash
obsidian delete file="Note Name"
obsidian delete path="folder/note.md" permanent             # skip trash
```

| Parameter | Description |
|-----------|-------------|
| `file=` / `path=` | Target file |
| `permanent` | Skip trash, delete permanently |

## Open

```bash
obsidian open file="Note Name"
obsidian open file="Note Name" newtab
```

| Parameter | Description |
|-----------|-------------|
| `file=` / `path=` | Target file |
| `newtab` | Open in new tab |

## Property commands

Read, set, and remove frontmatter properties on a single file:

```bash
obsidian property:read name="tags" file="Note Name"
obsidian property:set name="tags" value="🌿" file="Note Name"
obsidian property:set name="dg-publish" value="true" type=checkbox file="Note Name"
obsidian property:remove name="old-prop" file="Note Name"
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `property:read` | `name=` (required), `file=` / `path=` | Read a property value |
| `property:set` | `name=`, `value=` (required), `type=`, `file=` / `path=` | Set a property value |
| `property:remove` | `name=` (required), `file=` / `path=` | Remove a property entirely |

**`type=` values** for `property:set`: `text`, `list`, `number`, `checkbox`, `date`, `datetime`. Defaults to text if omitted.

**List behavior:** `property:set type=list` **replaces** the entire list — it does not append. Use comma-separated values to set multiple items: `value="alpha,beta,gamma"` produces a YAML list with three entries.

## Properties (vault-wide)

List all properties across the vault (distinct from per-file `property:read/set/remove`):

```bash
obsidian properties                                         # list all properties (YAML)
obsidian properties sort=count counts                       # sorted by usage count
obsidian properties file="Note Name"                        # properties for a file
obsidian properties name="tags" total                       # count of a specific property
obsidian properties format=json                             # JSON output
obsidian properties active                                  # properties for active file
```

| Parameter | Description |
|-----------|-------------|
| `file=` / `path=` | Filter to a specific file |
| `name=` | Filter to a specific property name |
| `total` | Return count only |
| `counts` | Include usage counts |
| `sort=count` | Sort by count (default: name) |
| `format=json\|tsv\|csv` | Output format (default: YAML) |
| `active` | Properties for active file |

## Move and rename

```bash
obsidian move file="Note Name" to="blog/articles/"
obsidian move path="garden/My Note.md" to="blog/articles/My Note.md"
obsidian rename file="Note Name" name="New Name"
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `move` | `file=` / `path=`, `to=` (required) | Move to a destination folder or full path |
| `rename` | `file=` / `path=`, `name=` (required) | Rename a file |

Both commands update all backlinks automatically.

## File & folder exploration

```bash
obsidian file file="Note Name"                              # show file info
obsidian files                                              # list all files
obsidian files folder="projects" ext=md total               # filter & count
obsidian folder path="projects" info=files                  # folder info
obsidian folders                                            # list all folders
obsidian folders folder="projects" total                    # filter & count
obsidian recents                                            # recently opened files
obsidian recents total                                      # count only
obsidian wordcount file="Note Name" words                   # word count only
obsidian wordcount file="Note Name" characters              # character count only
obsidian aliases                                            # list all aliases
obsidian aliases file="Note Name"                           # aliases for a file
obsidian aliases verbose                                    # include file paths
obsidian aliases active                                     # aliases for active file
obsidian aliases total                                      # count only
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `file` | `file=` / `path=` | Show file info |
| `files` | `folder=`, `ext=`, `total` | List files in vault |
| `folder` | `path=` (required), `info=files\|folders\|size` | Show folder info |
| `folders` | `folder=`, `total` | List folders in vault |
| `recents` | `total` | Recently opened files |
| `wordcount` | `file=` / `path=`, `words`, `characters` | Count words and characters |
| `aliases` | `file=` / `path=`, `total`, `verbose`, `active` | List aliases in vault |

## Outline

```bash
obsidian outline file="Note Name"                           # tree format
obsidian outline file="Note Name" format=md                 # markdown format
obsidian outline file="Note Name" format=json               # JSON format
obsidian outline file="Note Name" total                     # heading count
```

| Parameter | Description |
|-----------|-------------|
| `file=` / `path=` | Target file |
| `format=tree\|md\|json` | Output format (default: tree) |
| `total` | Return heading count only |

## Search

```bash
obsidian search query="search term" limit=10                # basic search
obsidian search query="term" path="projects" case           # scoped, case-sensitive
obsidian search query="term" format=json                    # JSON output
obsidian search query="term" total                          # match count only
obsidian search:context query="term" limit=5                # search with line context
obsidian search:context query="term" format=json case       # JSON, case-sensitive
obsidian search:open query="term"                           # open search view in UI
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `search` | `query=` (required), `path=`, `limit=`, `total`, `case`, `format=text\|json` | Search vault for text |
| `search:context` | `query=` (required), `path=`, `limit=`, `case`, `format=text\|json` | Search with matching line context |
| `search:open` | `query=` | Open search view in Obsidian UI |

`search:context` returns matching lines with surrounding context — useful for understanding matches without reading full files.

## Link analysis

```bash
obsidian backlinks file="Note Name"                         # incoming links
obsidian backlinks file="Note Name" counts                  # with link counts
obsidian backlinks file="Note Name" total                   # count only
obsidian backlinks file="Note Name" format=json             # JSON output
obsidian links file="Note Name"                             # outgoing links
obsidian links file="Note Name" total                       # outgoing link count
obsidian orphans                                            # files with no incoming links
obsidian orphans total                                      # count only
obsidian orphans all                                        # include non-markdown files
obsidian deadends                                           # files with no outgoing links
obsidian deadends total                                     # count only
obsidian deadends all                                       # include non-markdown files
obsidian unresolved counts                                  # unresolved links with counts
obsidian unresolved verbose                                 # include source files
obsidian unresolved total                                   # count only
obsidian unresolved format=json                             # JSON output
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `backlinks` | `file=` / `path=`, `counts`, `total`, `format=json\|tsv\|csv` | Incoming links to a file |
| `links` | `file=` / `path=`, `total` | Outgoing links from a file |
| `orphans` | `total`, `all` | Files with no incoming links (`all` includes non-markdown) |
| `deadends` | `total`, `all` | Files with no outgoing links (`all` includes non-markdown) |
| `unresolved` | `total`, `counts`, `verbose`, `format=json\|tsv\|csv` | Unresolved (broken) links in vault |

## Bases (Databases)

```bash
obsidian bases                                              # list all base files
obsidian base:views file="Garden"                           # list views in a base
obsidian base:query file="views/Garden.base" view="Seedling 🌱" format=paths
obsidian base:query file="views/Garden.base" view="Seedling 🌱" format=md
obsidian base:create file="Projects" name="New Item"        # create item in base
obsidian base:create file="Projects" name="New Item" content="# Hello"  # with content
obsidian base:create file="Projects" view="Active" open     # create and open
obsidian base:create file="Projects" name="New Item" newtab # open in new tab
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `bases` | — | List all `.base` files in vault |
| `base:views` | `file=` / `path=` | List views defined in a base file |
| `base:query` | `file=` / `path=`, `view=`, `format=json\|csv\|tsv\|md\|paths` | Query a base and return results |
| `base:create` | `file=` / `path=`, `view=`, `name=`, `content=`, `open`, `newtab` | Create a new item in a base |

**IMPORTANT:** `base:query` requires the vault-relative path with `.base` extension (e.g., `file="views/Garden.base"`). Using a wikilink-style name may silently return incorrect/unfiltered results.

**Output formats for `base:query`:**

| Format | Description |
|--------|-------------|
| `json` | Structured data (default) |
| `csv` / `tsv` | Tabular export |
| `md` | Markdown table |
| `paths` | File paths only |

## Tags

```bash
obsidian tags sort=count counts                             # all tags with counts
obsidian tags file="Note Name"                              # tags for a file
obsidian tags format=json                                   # JSON output
obsidian tags total                                         # tag count only
obsidian tags active                                        # tags for active file
obsidian tag name="🌱"                                      # info for a specific tag
obsidian tag name="🌱" verbose                              # include file list and count
obsidian tag name="🌱" total                                # occurrence count only
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `tags` | `file=` / `path=`, `total`, `counts`, `sort=count`, `format=json\|tsv\|csv`, `active` | List tags in vault |
| `tag` | `name=` (required), `total`, `verbose` | Info for a specific tag |

## Tasks

### List tasks

```bash
obsidian tasks todo                                         # all incomplete tasks
obsidian tasks done                                         # all completed tasks
obsidian tasks daily todo                                   # today's incomplete tasks
obsidian tasks file="Project" verbose                       # tasks grouped by file
obsidian tasks status="/" todo                              # filter by status character
obsidian tasks format=json                                  # JSON output
obsidian tasks total                                        # task count only
obsidian tasks active                                       # tasks for active file
```

| Parameter | Description |
|-----------|-------------|
| `file=` / `path=` | Filter by file |
| `total` | Return task count only |
| `done` | Show completed tasks |
| `todo` | Show incomplete tasks |
| `status="<char>"` | Filter by status character |
| `verbose` | Group by file with line numbers |
| `format=json\|tsv\|csv` | Output format (default: text) |
| `active` | Tasks for active file |
| `daily` | Tasks from today's daily note |

### Single task operations

```bash
obsidian task file="Note" line=5                            # show task at line
obsidian task file="Note" line=5 toggle                     # toggle status
obsidian task file="Note" line=5 done                       # mark done
obsidian task file="Note" line=5 todo                       # mark todo
obsidian task file="Note" line=5 status="/"                 # set custom status
obsidian task ref="folder/note.md:5" toggle                 # ref shorthand
obsidian task daily line=3 done                             # daily note task
```

| Parameter | Description |
|-----------|-------------|
| `ref=<path:line>` | Task reference shorthand |
| `file=` / `path=` | Target file |
| `line=` | Line number of the task |
| `toggle` | Toggle task status |
| `done` | Mark as done |
| `todo` | Mark as todo |
| `daily` | Use daily note |
| `status="<char>"` | Set custom status character |

## TaskNotes plugin

### tasknotes:capture

Create a TaskNotes task from free text (NLP-parsed) or explicit flags:

```bash
obsidian tasknotes:capture text="Buy groceries tomorrow"                    # NLP parse
obsidian tasknotes:capture title="Review PR" due=2026-05-20 priority=high  # explicit
obsidian tasknotes:capture text="Buy milk" literal                          # literal title
obsidian tasknotes:capture title="Deploy" scheduled=2026-05-25 estimate=60 # scheduled with estimate
obsidian tasknotes:capture title="Sync" recurrence="FREQ=WEEKLY;BYDAY=MO" recurrence-anchor=scheduled
```

| Parameter | Description |
|-----------|-------------|
| `text=` | Task text to parse with NLP (unless `literal` is set) |
| `title=` | Explicit task title; overrides NLP-derived title |
| `details=` | Task details/body; overrides NLP-derived details |
| `status=` | Explicit task status |
| `priority=` | Explicit task priority |
| `due=` | Due date or datetime (`YYYY-MM-DD` or `YYYY-MM-DDTHH:MM`) |
| `scheduled=` | Scheduled date or datetime (`YYYY-MM-DD` or `YYYY-MM-DDTHH:MM`) |
| `tags=` | Comma-separated tags; overrides NLP-derived tags |
| `contexts=` | Comma-separated contexts; overrides NLP-derived contexts |
| `projects=` | Comma-separated projects; overrides NLP-derived projects |
| `recurrence=` | Explicit recurrence rule (iCal RRULE format) |
| `recurrence-anchor=` | How recurring tasks advance: `scheduled` or `completion` |
| `reminders=` | Reminder spec(s): `due:-PT1H;scheduled:-PT30M;at:2026-04-02T09:00` or a JSON array |
| `estimate=` | Time estimate in minutes |
| `literal` | Treat `text=` as a literal title instead of parsing with NLP |

### tasknotes:pomodoro

```bash
obsidian tasknotes:pomodoro action=status                                   # check status
obsidian tasknotes:pomodoro action=start query="Review PR"                  # start pomodoro
obsidian tasknotes:pomodoro action=start title="Review PR" duration=30      # custom duration
obsidian tasknotes:pomodoro action=pause                                    # pause
obsidian tasknotes:pomodoro action=resume                                   # resume
obsidian tasknotes:pomodoro action=stop                                     # stop
obsidian tasknotes:pomodoro action=short-break                              # short break
obsidian tasknotes:pomodoro action=long-break                               # long break
```

| Parameter | Description |
|-----------|-------------|
| `action=` | `status` (default), `start`, `pause`, `resume`, `stop`, `short-break`, `long-break` |
| `path=` | Exact task file path (for `action=start`) |
| `title=` | Exact task title (for `action=start`) |
| `query=` | Substring match against task title or path (for `action=start`) |
| `duration=` | Optional work-session duration override in minutes (for `action=start`) |

### tasknotes:start-time / stop-time / time-status

```bash
obsidian tasknotes:start-time query="Review PR"                             # start time tracking
obsidian tasknotes:start-time query="Review PR" description="Code review"   # with description
obsidian tasknotes:stop-time query="Review PR"                              # stop time tracking
obsidian tasknotes:time-status                                              # all active sessions
obsidian tasknotes:time-status query="Review PR"                            # specific task status
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `tasknotes:start-time` | `path=`, `title=`, `query=`, `description=` | Start time tracking for a task |
| `tasknotes:stop-time` | `path=`, `title=`, `query=` | Stop time tracking (or the only active session if unambiguous) |
| `tasknotes:time-status` | `path=`, `title=`, `query=` | Show active time-tracking sessions |

## Templater

```bash
obsidian templater:create-from-template template="f-daily.md" file="journal/1-daily/2026-05-19.md"
obsidian templater:create-from-template template="templates/f-project.md" file="projects/New Project/New Project.md" open
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `template=` | Yes | Template file path (relative to vault root or templates folder) |
| `file=` | Yes | Output file path (relative to vault root) |
| `open` | No | Open the created file in the UI |

## Homepage plugin

```bash
obsidian homepage                                           # open the homepage in UI
obsidian homepage:read                                      # read homepage contents
```

| Command | Description |
|---------|-------------|
| `homepage` | Open the homepage (as configured by the Homepage plugin) |
| `homepage:read` | Read and return the homepage note contents |

## History & recovery

```bash
obsidian history file="Note Name"                           # list versions
obsidian history:list                                       # files with history
obsidian history:read file="Note Name" version=1            # read a version
obsidian history:restore file="Note Name" version=2         # restore a version
obsidian history:open file="Note Name"                      # open file recovery UI
obsidian diff file="Note Name" from=1 to=2                  # diff between versions
obsidian diff file="Note Name" filter=local                 # local versions only
obsidian diff file="Note Name" filter=sync                  # sync versions only
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `history` | `file=` / `path=` | List file history versions |
| `history:list` | — | List files that have history |
| `history:read` | `file=` / `path=`, `version=` (default: 1) | Read a specific history version |
| `history:restore` | `file=` / `path=`, `version=` (required) | Restore a history version |
| `history:open` | `file=` / `path=` | Open file recovery UI |
| `diff` | `file=` / `path=`, `from=`, `to=`, `filter=local\|sync` | Diff between history versions |

## Commands & hotkeys

```bash
obsidian commands                                           # list all commands
obsidian commands filter="editor"                           # filter by prefix
obsidian command id="editor:toggle-bold"                    # execute a command
obsidian hotkeys                                            # list all hotkeys
obsidian hotkeys total                                      # count only
obsidian hotkeys verbose                                    # show if custom or default
obsidian hotkeys format=json                                # JSON output
obsidian hotkeys all                                        # include commands without hotkeys
obsidian hotkey id="editor:toggle-bold"                     # hotkey for a command
obsidian hotkey id="editor:toggle-bold" verbose             # show if custom or default
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `commands` | `filter=` | List available commands (filter by ID prefix) |
| `command` | `id=` (required) | Execute an Obsidian command |
| `hotkeys` | `total`, `verbose`, `format=json\|tsv\|csv`, `all` | List hotkeys (`all` includes commands without hotkeys) |
| `hotkey` | `id=` (required), `verbose` | Get hotkey for a specific command |

## Plugin management

```bash
obsidian plugins                                            # list all plugins
obsidian plugins filter=community versions                  # community plugins with versions
obsidian plugins format=json                                # JSON output
obsidian plugins:enabled                                    # list enabled plugins
obsidian plugins:enabled filter=community versions          # enabled community plugins
obsidian plugins:enabled format=json                        # JSON output
obsidian plugin id="dataview"                               # plugin info
obsidian plugin:enable id="dataview"                        # enable plugin
obsidian plugin:enable id="dataview" filter=community       # specify plugin type
obsidian plugin:disable id="dataview"                       # disable plugin
obsidian plugin:disable id="dataview" filter=core           # specify plugin type
obsidian plugin:install id="dataview" enable                # install and enable
obsidian plugin:uninstall id="dataview"                     # uninstall plugin
obsidian plugin:reload id="my-plugin"                       # reload (for developers)
obsidian plugins:restrict on                                # enable restricted mode
obsidian plugins:restrict off                               # disable restricted mode
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `plugins` | `filter=core\|community`, `versions`, `format=json\|tsv\|csv` | List installed plugins |
| `plugins:enabled` | `filter=core\|community`, `versions`, `format=json\|tsv\|csv` | List enabled plugins |
| `plugin` | `id=` (required) | Get plugin info |
| `plugin:enable` | `id=` (required), `filter=core\|community` | Enable a plugin |
| `plugin:disable` | `id=` (required), `filter=core\|community` | Disable a plugin |
| `plugin:install` | `id=` (required), `enable` | Install a community plugin |
| `plugin:uninstall` | `id=` (required) | Uninstall a community plugin |
| `plugin:reload` | `id=` (required) | Reload a plugin (for developers) |
| `plugins:restrict` | `on` / `off` | Toggle or check restricted mode |

## Themes & CSS snippets

```bash
obsidian themes                                             # list installed themes
obsidian themes versions                                    # with version numbers
obsidian theme                                              # show active theme
obsidian theme name="Border"                                # theme details
obsidian theme:set name="Border"                            # set theme
obsidian theme:install name="Minimal" enable                # install and activate
obsidian theme:uninstall name="Old Theme"                   # uninstall
obsidian snippets                                           # list CSS snippets
obsidian snippets:enabled                                   # list enabled snippets
obsidian snippet:enable name="callouts"                     # enable snippet
obsidian snippet:disable name="callouts"                    # disable snippet
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `themes` | `versions` | List installed themes |
| `theme` | `name=` | Show active theme, or details for a named theme |
| `theme:set` | `name=` (required) | Set active theme (empty name for default) |
| `theme:install` | `name=` (required), `enable` | Install a community theme |
| `theme:uninstall` | `name=` (required) | Uninstall a theme |
| `snippets` | — | List installed CSS snippets |
| `snippets:enabled` | — | List enabled CSS snippets |
| `snippet:enable` | `name=` (required) | Enable a CSS snippet |
| `snippet:disable` | `name=` (required) | Disable a CSS snippet |

## App & vault management

```bash
obsidian vault info=name                                    # vault name
obsidian vault info=path                                    # vault path
obsidian vault info=files                                   # file count
obsidian vault info=folders                                 # folder count
obsidian vault info=size                                    # vault size
obsidian vaults verbose                                     # list all vaults with paths
obsidian vaults total                                       # vault count
obsidian version                                            # Obsidian version
obsidian reload                                             # reload vault
obsidian restart                                            # restart app
obsidian tabs                                               # list open tabs
obsidian tabs ids                                           # with tab IDs
obsidian tab:open file="Note Name"                          # open file in new tab
obsidian tab:open group="abc123"                            # open in specific tab group
obsidian tab:open view="graph"                              # open a specific view type
obsidian workspace                                          # show workspace tree
obsidian workspace ids                                      # with workspace item IDs
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `vault` | `info=name\|path\|files\|folders\|size` | Show vault info (specific field or all) |
| `vaults` | `total`, `verbose` | List known vaults |
| `version` | — | Show Obsidian version |
| `reload` | — | Reload the vault |
| `restart` | — | Restart the app |
| `tabs` | `ids` | List open tabs |
| `tab:open` | `file=`, `group=`, `view=` | Open a new tab |
| `workspace` | `ids` | Show workspace tree |
