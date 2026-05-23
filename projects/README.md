# Projects

The projects folder implements a hybrid of **David Allen's GTD** and **Tiago Forte's PARA**. A project is "a series of tasks linked to a goal, with a defined outcome." Only **active** work lives here — completed projects move to `archive/`.

## Philosophy

From GTD: externalize commitments, define next actions, review regularly. Allen's **Natural Planning Model** maps to the project file structure: Purpose → Objective, Outcome Visioning → Metrics, Brainstorming → Brainstorm, Organizing → Execution, Next Actions → Tasks.

From PARA: projects have defined outcomes and deadlines. **The three-part project test:** Does it have a (1) finite outcome, (2) multiple steps, and (3) foreseeable time horizon? If YES → it belongs here. If it's an ongoing responsibility → `areas/`. Areas of Responsibility live in `areas/` and projects roll up under them via `parent:`.

From Covey: "Begin with the end in mind" — every project defines its Objective before work starts.

## Folder Structure

```
projects/
└── ProjectName Project/
    ├── ProjectName Project.md     # Main project file (🚧)
    ├── tasks/
    │   ├── Task One.md            # TaskNotes task (📋)
    │   └── Task Two.md
    ├── Meeting Name - YYYYMMDDHHmm.md   # Meeting note (👥)
    └── Session Name - YYYYMMDDHHmm.md   # Session note (🧙)
```

## Project File Sections

| Section | Purpose |
|---------|---------|
| `# Objective` | What value will you have when this is done? |
| `# Brainstorm` | Raw ideas, risks, resources, approaches |
| `# Metrics` | How will you know if the project was successful? |
| `# Execution` | Links to task notes + inline tasks |
| `# Result` | Filled on closure — what was the outcome? |

## Note Types

| Tag | Type | Frontmatter |
|-----|------|-------------|
| 🚧 | Project | `start-date`, `end-date`, `ended-as`, `parent:` (area in `areas/`) |
| 📋 | Task | `status`, `due`, `scheduled`, `priority`, `projects:` |
| 👥 | Meeting | `parent:` (project), `attendees:`, `maps:` |
| 🧙 | Session | `parent:` (project), `attendees:` |

## Task States

- `status: todo` — Not yet started
- `status: in-progress` — Currently being worked
- `status: done` — Completed

## Project Health (visible in `Projects.base`)

| View | What it shows |
|------|--------------|
| Category | All projects grouped by `parent:` (area) |
| Age | Projects sorted by creation date |
| Stale | Projects not modified in 30+ days (🟡) |
| Open Tasks by Project | All open tasks grouped by project |
| Ready to Close | Projects with `end-date` set |

## Associated Workflows

- **`/open-project`** — Socratic brainstorming ceremony. Fills Objective, Metrics, Brainstorm through guided questions.
- **`/close-project`** — Archive triage. Capture Result, extract knowledge to zettelkasten/garden, resolve tasks, move to archive.
- **`/review-projects`** — Weekly health check. Surface stale projects, missing next actions, empty objectives.

## Example Projects in This Vault

- **Marathon Training Project** — Active, healthy. Filled sections, open tasks, meeting with attendees.
- **Home Gym Setup Project** — Stale (60+ days). Shows up in Projects.base Stale view. Target for `/review-projects`.
- **Strength Training Research Book Project** — Completed and archived in `archive/2025/`. Has a filled Result section. Produced zettelkasten notes.
