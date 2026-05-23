---
trigger: glob
globs: projects/**
---
# Project Notes

Active project folders containing objectives, execution tracking, meetings, sessions, and task notes. Managed through three lifecycle workflows: `/open-project`, `/review-projects`, `/close-project`.

GTD + PARA hybrid. Every project has an Objective, Metrics, Brainstorm, Execution, and Result. The LLM is a **Socratic companion** — asks questions, never auto-fills sections. For philosophical grounding, see `references/ethos.md#projects`.

**The three-part project test:** Does it have a (1) finite outcome, (2) multiple steps, and (3) foreseeable time horizon? If YES to all three → it belongs here. If it's an ongoing responsibility with no defined end → `areas/` (see `areas.md`). If it's a single action → daily note task. If it's a concept collection → `zettelkasten/` or `references/`.

**Areas** are ongoing responsibilities in `areas/` (`🛒`). Set `parent:` on the project to the relevant area file. **Someday/Maybe** items are `🌱` garden notes, not `📋` tasks — activate via `/open-project`.

## Do Not
- Create project files without a subfolder — every project gets its own folder
- Leave Objective/Metrics as placeholder text — these drive the project's purpose
- Remove `tasks` or `dataview` query blocks from project files
- Place ongoing responsibilities here — career management, family, health belong in `areas/`
- Place reference material here — that belongs in `references/`
- Use `parent:` on one-on-one notes — use `project:` instead (this is intentional)
- Use `parent:` on task notes — use `projects:` (plural) instead
- Auto-fill Objective, Metrics, or Brainstorm sections — the LLM asks questions, the user writes answers
- Use `📋` task notes for Someday/Maybe ideas — those are `🌱` creations, not tasks

## Do
- Give every project its own subfolder matching the project file name
- **Fill Objective and Metrics before meaningful work begins** — use `/open-project` for Socratic facilitation
- Apply the three-part project test before creating a new project folder
- Set `parent:` to an Area file (`areas/`) on the main project file
- Set `parent:` on meeting and session notes to link back to the project
- Use `start-date:` when creating a new project
- Set `end-date:` and `ended-as:` before archiving — use `/close-project`
- Use TaskNotes (files in `tasks/`) as the primary task system — one file per task
- Use `obsidian tasknotes:capture` CLI to create ad-hoc tasks during conversations
- Link TaskNote files in the `# Execution` section of project files and in meeting/session notes where tasks originate
- Link `attendees:` to `references/people/` notes so person-page queries work
- Periodically plant insights from long-running projects via `/garden plant`
- Review projects regularly via `/review-projects`

## Project Lifecycle

Projects have no explicit `status:` property. Lifecycle state is derived from existing properties:

| State | Condition | Meaning |
|-------|-----------|---------|
| **🟢 Active** | Has `start-date`, no `end-date`, modified within 30 days | Work is happening |
| **🟡 Stale** | Has `start-date`, no `end-date`, not modified in 30+ days | Needs review — still relevant? |
| **🔴 Closing** | `end-date` is set, still in `projects/` | Triage in progress, not yet archived |
| **📦 Archived** | In `archive/YYYY/projects/` | Historical record, read-only |

`Projects.base` computes this status automatically via a formula. The `/review-projects` workflow surfaces stale projects for attention.

## Folder Structure
Each project lives in its own subfolder:
```
projects/
  ProjectName Project/
    ProjectName Project.md        # Main project file
    tasks/                        # TaskNotes-style task files
      Task Title.md
    Meeting Name - YYYYMMDDHHmm.md
    Session Name - YYYYMMDDHHmm.md
    PersonName One on One - YYYYMMDDHHmm.md
    [other supporting files]
```
- Folder name matches the main project file name (e.g., `Delivery Lead Project/`)
- Career projects use: `PersonName Career Project/`
- Book projects use: `BookName/` with a `BookName Book Project.md` inside. Book projects follow a 5-step chapter-by-chapter process: **Read** (note key words/ideas) → **Write** (chapter review in own words) → **Highlight** (revisit and highlight related concepts) → **Reference** (generate highlights document, link to book report) → **Distill** (process into zettelkasten notes with provenance). See `templates/f-book-project.md` for the full process and metrics.

## Main Project File

### Folder-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `start-date:` | `"[[YYYY-MM-DD]]"` | Recommended | When the project began. |
| `end-date:` | `"[[YYYY-MM-DD]]"` | On archive | When the project ended. Set before moving to `archive/`. |
| `ended-as:` | string (e.g., `completed`, `abandoned`, `paused`) | On archive | How the project concluded. Set before moving to `archive/`. |

### Frontmatter Example
```yaml
banner: "[[pexels-catcaryn-938165.webp]]"
tags: [🚧]
create-date: "[[YYYY-MM-DD]]"
start-date: "[[YYYY-MM-DD]]"
end-date:
ended-as:
parent:
modified-dates:
append_modified_update: true
related:
```

### Body Structure
```markdown
# Objective
> What value will I have at the end of this project?

# Brainstorm
[or embedded brainstorm note]

# Metrics
> How will I know if the project has been successful?

# Execution
[tasks query or linked task notes]

# Result
> What was the result of this work?
```

## Meeting Notes
- **Tag:** `👥`
- **Naming:** `Meeting Name Meeting - YYYYMMDDHHmm.md`
- **Template:** `templates/f-meeting.md`
- **Body:** `## Goals / Agenda`, `## Discussion Notes`, `## Action Items`, `## Related`

### Meeting-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `attendees:` | YAML list of `"[[Person Name]]"` | Recommended | Links to `references/people/` notes for each attendee. Used by Dataview queries on person pages. |
| `parent:` | `"[[ProjectName Project]]"` | **Yes** | Links to the parent project file. |

## Session Notes (coaching, facilitation)
- **Tag:** `🧙`
- **Naming:** `YYYYMMDDHHmm - Session Name.md`
- **Frontmatter:** `tags: [🧙]`, `parent: "[[ProjectName Project]]"`, `attendees:`
- **Body:** `## Goals`, `## Notes`, `## Related`
- **Template:** `templates/f-session.md`

## One-on-One Notes
- **Tag:** `👥, one-on-one`
- **Naming:** `PersonName One on One - YYYYMMDDHHmm.md`
- **Template:** `templates/f-one-on-one.md`
- **Body:** `## Goals / Agenda` (with standard 1:1 checklist), `## Discussion Notes`, `## Action Items`

### One-on-One-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `project:` | `"[[PersonName Career Project]]"` | **Yes** | Links to the career project. Note: this uses `project:` **not** `parent:` — this is intentional and distinct from the global `parent:` property. |
| `attendees:` | `"[[PersonName]]"` | **Yes** | The person this 1:1 is with. |

## Task Notes (in `tasks/` subfolder)

TaskNotes are the **primary task management system**. Every discrete action item is a separate file in the project's `tasks/` subfolder. Do not use inline `- [ ]` checkbox tasks for action items — those are reserved for recurring reminders only (see below).

- **Tag:** `📋`
- **Naming:** `Task Title.md` (plain descriptive name, no timestamp)
- **Location:** `projects/ProjectName Project/tasks/`

### Task-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `status:` | `todo` \| `in-progress` \| `done` | **Yes** | Current task status. |
| `due:` | `YYYY-MM-DD` | Optional | Due date (plain date, not wiki-linked). |
| `scheduled:` | `YYYY-MM-DD` | Optional | Scheduled start date (plain date, not wiki-linked). |
| `priority:` | `normal` \| `high` \| `low` | Optional | Task priority level. Defaults to `normal`. |
| `projects:` | YAML list of `"[[ProjectName Project]]"` | **Yes** | Links to parent project(s). Note: this uses `projects:` (plural), not `parent:`. |
| `contexts:` | YAML list | Optional | GTD-style contexts (e.g., `@computer`, `@phone`). |
| `estimate:` | number (minutes) | Optional | Time estimate in minutes. |
| `recurrence:` | iCal RRULE string | Optional | For recurring tasks. |

### Frontmatter Example
```yaml
tags: [📋]
status: todo
due: YYYY-MM-DD
scheduled: YYYY-MM-DD
priority: normal
projects:
  - "[[ProjectName Project]]"
create-date: "[[YYYY-MM-DD]]"
append_modified_update: true
```

### Creating TaskNotes

**At template time** — project templates use a Templater `ensureTaskNote` helper to seed starter tasks when a project is created. These appear pre-linked in the `# Execution` section.

**Ad-hoc during work** — use the CLI to create tasks as they emerge from meetings, reviews, or conversations:

```bash
obsidian tasknotes:capture title="Task title" projects="[[ProjectName Project]]" due=YYYY-MM-DD literal
```

**Important:** Wrap project names in `[[...]]` inside the `projects=` parameter to produce wiki-links in frontmatter. Without brackets, the property is plain text and won't resolve as a link.

Key `tasknotes:capture` parameters:
- `title=` — explicit task title
- `text=` — free text parsed by NLP (alternative to `title=`)
- `projects=` — comma-separated project associations (wrap each in `[[...]]`)
- `status=`, `priority=`, `due=`, `scheduled=` — metadata
- `contexts=`, `tags=` — categorization
- `estimate=` — time estimate in minutes
- `recurrence=` — iCal RRULE for recurring tasks
- `literal` flag — treat `text=` as a literal title, skip NLP parsing

### Linking TaskNotes

Link TaskNote files in two places:
1. **Project file `# Execution` section** — master task list for the project
2. **Meeting/session notes** — where the task originated (e.g., after a `### Follow-ups` section)

```markdown
# Execution
- [[projects/ProjectName Project/tasks/Research competitor landscape]]
- [[projects/ProjectName Project/tasks/Draft proposal]]
```

## Inline Tasks (recurring reminders only)

Inline `- [ ]` tasks are **only** for recurring reminders in project files — not for discrete action items. The canonical example is the "Determine next action" reminder seeded by project templates:

```markdown
- [ ] #📋 [[ProjectName Project]]: Determine next action 🔁 every month 📅 YYYY-MM-DD
```

- Always prefix with `#📋` tag and `[[Project Name]]:`
- Use 📅 for due date, 🔁 for recurrence
- Do **not** create inline tasks for one-off action items — use TaskNotes instead

## Templates
- General project: `templates/f-project.md`
- Sales project: `templates/f-sales-project.md`
- Career project: `templates/f-career-project.md`
- Book project: `templates/f-book-project.md`
- Meeting: `templates/f-meeting.md`
- Session: `templates/f-session.md`
- One-on-one: `templates/f-one-on-one.md`

## CLI Operations (via @obsidian-cli)

Use the Obsidian CLI for project operations — it understands tasks, Bases, and the link graph that Windsurf's built-in tools can't see.

### Manage tasks

For `tasknotes:capture` syntax and parameters, see **Creating TaskNotes** above.

```bash
obsidian tasks file="Project Name" verbose                  # list tasks in a project
obsidian tasks daily todo                                   # today's incomplete tasks
obsidian task file="Note" line=5 done                       # mark a specific task done
obsidian property:set name="status" value="done" file="Task Title"  # mark TaskNote done
```

### Query project health

Use `base:query` to check project status via the Projects Base. **Important:** use the vault-relative path with `.base` extension.

```bash
obsidian base:query file="projects/Projects.base" view="Stale" format=md           # stale projects
obsidian base:query file="projects/Projects.base" view="Open Tasks by Project" format=md  # open tasks
obsidian base:query file="projects/Projects.base" view="Ready to Close" format=md  # ready to archive
```

### Create project notes from templates

```bash
obsidian templater:create-from-template template="f-project.md" file="projects/New Project/New Project.md" open
obsidian templater:create-from-template template="f-meeting.md" file="projects/My Project/Sprint Planning Meeting - 202605211200.md" open
```

