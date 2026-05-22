---
description: Lint the vault folder by folder against the conventions defined in .windsurf/rules/
---

# Vault Lint Workflow

Audit each folder's `.md` files against the conventions defined in `.windsurf/rules/`. Process one folder at a time, report findings, and optionally fix issues with user approval.

## Before Starting
- Read `.windsurf/rules/global-conventions.md` to understand the baseline rules that apply everywhere.
- Do **not** lint hidden folders (those starting with `.`), `templates/`, or `archive/`.
- Skip non-markdown files (`.base`, `.canvas`, `.excalidraw.md`, `.webp`, `.png`, etc.) unless a rule specifically covers them.
- Do **not** auto-fix anything. Report findings and wait for approval before making changes.

## Phase 0: Template Audit (Do First)

Templates are the source of truth for note structure. Checking them first reveals root causes — a single template bug propagates to every note created from it.

Read `.windsurf/rules/global-conventions.md` and each folder-specific rule, then check every `templates/*.md` file:

- [ ] **Property naming** — uses `aliases:` (not `alias:`), `authors:` (not `author:`)
- [ ] **Required global properties** — every template that creates content notes includes `create-date:`, `modified-dates:`, `append_modified_update: true`
- [ ] **Folder-specific properties** — each template includes properties required by its folder's rule (e.g., `location:` for `f-location.md`, `url:` for `f-media.md`)
- [ ] **YAML validity** — no quoted property keys (e.g., `"modified-dates:":`), no malformed template variables
- [ ] **Body structure** — matches the rule's expected sections (e.g., `# Content` / `# References` for zettelkasten, `# Objective` / `# Brainstorm` / `# Metrics` / `# Execution` / `# Result` for projects)

Fix template issues **before** linting folders so that new notes don't inherit the same problems.

## Lint Steps — Process Each Folder in Order

### 1. `journal/`
Read `.windsurf/rules/journal.md`, then check files in each subfolder (`1-daily/`, `2-weekly/`, `3-monthly/`, `4-quarterly/`, `5-yearly/`):
- [ ] File naming matches the expected pattern for its subfolder (e.g., `YYYY-MM-DD.md` for daily)
- [ ] Frontmatter has: `tags: [📅]`, `create-date`, `before`, `after`, `parent`, `append_modified_update: true`
- [ ] Weekly+ notes have `children:` list
- [ ] `parent` links correctly up the hierarchy (day→week, week→month, month→quarter, quarter→year)
- [ ] Daily notes have the Habits callout and `# Journal` heading
- [ ] Weekly notes have `## Notes From the Week`, `## Tasks`, `## Attention` sections

### 2. `zettelkasten/`
Read `.windsurf/rules/zettelkasten.md`, then check all `.md` files:
- [ ] File naming follows `Title - YYYYMMDDHHmm.md` pattern
- [ ] Frontmatter has: `tags: [📖]`, `create-date`, `append_modified_update: true`
- [ ] Frontmatter has `referenced-in:` and/or `related:` fields (at least one should be populated)
- [ ] Body has `# Content` section
- [ ] Body has `# References` section
- [ ] Note is atomic — flag if the note appears to cover multiple distinct concepts

### 3. `maps/`
Read `.windsurf/rules/maps.md`, then check all `.md` files:
- [ ] File name is a plain descriptive name (no date suffix)
- [ ] Frontmatter has: `tags: [🗺️]`, `create-date`, `dg-publish`, `append_modified_update: true`
- [ ] Body has the standard sections: `## Summary`, `## Exploration`, `## Projects`, `## Concepts`, `## Notes`, `## References`, `## Other`
- [ ] Each section has a dataview query that filters by `contains(related, this.file.link)`

### 4. `projects/`
Read `.windsurf/rules/projects.md`, then check each project subfolder:

**Structural checks:**
- [ ] Each project has a main project file (e.g., `ProjectName Project.md`)
- [ ] Main project file has: `tags: [🚧]`, `create-date`, `start-date`, `append_modified_update: true`
- [ ] Main project file body has: `# Objective`, `# Brainstorm`, `# Metrics`, `# Execution`, `# Result`
- [ ] Meeting notes have: `tags: [👥]`, `parent` linking to project, `attendees`
- [ ] Session notes have: `tags: [🧙]`, `parent` linking to project
- [ ] Task notes in `tasks/` have: `tags: [📋]`, `status`, `due`, `projects`
- [ ] Inline tasks use `#📋` prefix with proper date syntax

**Health checks:**
- [ ] Objective section is filled (not placeholder text like "What value will I have...")
- [ ] Metrics section is filled (not placeholder text like "How will I know...")
- [ ] `parent:` links to an existing Map of Content (`🗺️` note in `maps/`)
- [ ] Has at least one open `📋` task (`status: todo` or `status: in-progress`) — flag stalled projects
- [ ] Active projects have `modified-dates` entries within 30 days — flag stale projects

### 5. `references/`
Read `.windsurf/rules/references.md`, then check each subfolder:

**`references/people/`**
- [ ] Frontmatter has: `tags: [🙂]`, `create-date`, `name`
- [ ] Body has `# FullName` heading

**`references/books/`**
- [ ] Frontmatter has: `tags: [📕]`, `authors`, `create-date`, `title`
- [ ] Has cover image embed

**`references/highlights/`**
- [ ] Frontmatter has: `tags: [✂️]`, `parent` linking to source, `source`
- [ ] Highlights use `>[!QUOTE]` callout format with `^ref-` block IDs

**`references/articles/`**
- [ ] Frontmatter has: `tags: [📰]`, `title`, `url`, `create-date`

**`references/locations/`**
- [ ] Frontmatter has: `tags: [📌]`, `location` (lat/lng array)
- [ ] Has `mapview` code block

**Other subfolders** (`videos/`, `classes/`, `games/`, `movies/`, `music/`, `organizations/`, `podcasts/`, `series/`):
- [ ] Files have appropriate tags for their type
- [ ] Frontmatter has `create-date`

**`references/tosort/`**
- [ ] Flag all files here — they need to be sorted into proper subfolders

### 6. `blog/`
Read `.windsurf/rules/blog.md`, then check files:
- [ ] Index pages (`Home.md`, `Articles.md`, `Highlights.md`, `Maps of Content.md`) have: `tags: [🥕]`, `dg-publish: true`, `dg-pinned: true`
- [ ] `Home.md` has `dg-home: true`
- [ ] Article folders follow `YYYY-MM-DD - Title/` naming convention

### 7. `garden/`
Read `.windsurf/rules/garden.md`, then check all `.md` files:
- [ ] Frontmatter has: `tags` (should be `🌱`, `🌿`, `🌳`, `🍃`, or similar), `create-date`, `append_modified_update: true`
- [ ] File naming follows `Title - YYYYMMDDHHmm.md` pattern (flag older files that don't match but don't require fixes)

### 8. `views/`
Read `.windsurf/rules/views.md`:
- [ ] Only `.base` and query `.md` files exist here — flag any content notes that don't belong

### 9. Root-level files
- [ ] Flag any `.md` or `.base` files at the vault root — they should be filed into appropriate folders

## Reporting Format

For each folder, output a summary:

```
## [Folder Name] — X files checked, Y issues found

### ✅ Passing
- [count] files have correct frontmatter
- [count] files follow naming convention

### ⚠️ Issues
- **[filename]**: Missing `create-date` in frontmatter
- **[filename]**: Wrong tag — has `💡` but should be `📖`
- **[filename]**: Missing `# References` section

### 📋 Suggested Fixes
- Add `append_modified_update: true` to [N] files
- Add `create-date` to [N] files
- [Other actionable suggestions]
```

After reporting all folders, provide a **vault-wide summary** with total files checked, total issues, and a prioritized list of fixes grouped by severity:
1. **Missing required frontmatter** (tags, create-date)
2. **Wrong folder placement** (files in wrong location)
3. **Missing body structure** (expected sections absent)
4. **Style/naming issues** (non-conforming file names)

Wait for user approval before applying any fixes.
