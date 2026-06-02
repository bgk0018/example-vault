---
description: Close a project with a guided ceremony — capture results, extract knowledge, resolve tasks, and archive
---
# Close Project Workflow

A guided closing ceremony based on **PARA's archive triage** (*Building a Second Brain*) and **GTD's completion processing** (*Getting Things Done*). The LLM facilitates reflection and knowledge extraction — the user decides what to keep, plant, or archive.

> **Areas don't close.** This workflow is for finite projects (`🚧` in `projects/`), not ongoing areas (`🛒` in `areas/`). If a sub-responsibility within an area ends, close the sub-area or remove it — don't close the parent area.

## Before Starting

Read the project file and get an overview of its contents:

```bash
obsidian read file="ProjectName Project"
```

List all files in the project folder to understand scope:

```bash
obsidian search query="path:projects/ProjectName" limit=100
```

---

## 1. Capture the Result

The `# Result` section should answer: "What was the outcome of this work?"

**Questions to ask:**
- "What was the outcome of this project?"
- "Did you achieve the Objective you set? How closely?"
- "What did you learn that you didn't expect?"
- "What would you do differently if you started over?"

The user writes the Result. The LLM may help refine wording but never writes it unilaterally.

---

## 2. Knowledge extraction

**Fast path:** If the project folder contains only the project file and template-generated tasks (no meetings, no working documents, no original content), skip the file-by-file walk. Note "No extractable knowledge — shell project" and proceed to step 3.

**Full path:** Walk through the project's files and help the user triage each one. For each file, decide its destination:

| File type | If reusable | If context-bound |
|-----------|-------------|-------------------|
| Insight or concept | → `📖` zettelkasten note | Stays in archive |
| Original work (proposal, analysis, design doc) | → `🌱` or `🍃` creation | Stays in archive |
| Meeting notes (`👥`) | Usually stays in archive | Stays in archive |
| Task notes (`📋`) | Resolved (see step 4) | Stays in archive |
| Reference material (people, articles) | Should already be in `references/` | Link if not |
| Images, diagrams, assets | Co-located with the note that uses them | Stays in archive |

**Questions to ask for each significant file:**
- "Is there an insight here worth preserving as a `📖` note?"
- "Is this original work (`🍃`) that has value beyond this project?"
- "Could any of this grow into a `🌱` creation?"

For files worth extracting, help the user create the new note:

```bash
obsidian create name="Concept Name - YYYYMMDDHHmm" content="[frontmatter + body]" silent
obsidian move file="Concept Name - YYYYMMDDHHmm" to="zettelkasten/"
```

Or for creations:

```bash
obsidian create name="Creation Name - YYYYMMDDHHmm" content="[frontmatter + body]" silent
obsidian move file="Creation Name - YYYYMMDDHHmm" to="garden/"
```

Always get user approval before creating or moving files.

**Verify:** After each create+move, `obsidian read file="Note Name"` — confirm the note landed in the correct folder with proper frontmatter.

---

## 3. Set closure properties

Set `end-date` and `ended-as` on the main project file:

```bash
obsidian property:set name="end-date" value="[[YYYY-MM-DD]]" file="ProjectName Project"
obsidian property:set name="ended-as" value="completed" file="ProjectName Project"
```

Valid values for `ended-as`:
- `completed` — the objective was achieved
- `abandoned` — the project is no longer relevant
- `paused` — may resume later (consider creating a `🌱` seedling for the idea)
- `merged` — absorbed into another project

---

## 4. Resolve open tasks

Find all open tasks linked to this project:

```bash
obsidian search query="projects: [[ProjectName Project]]" limit=50
```

For each open task (`status: todo` or `status: in-progress`):

- **Complete it** — if the work was done but the task wasn't marked:
  ```bash
  obsidian property:set name="status" value="done" file="Task Title"
  ```
- **Cancel it** — if the task is no longer relevant (mark as done with a note)
- **Reassign it** — if the task belongs to another active project:
  ```bash
  obsidian property:set name="projects" value="[[Other Project]]" type=list file="Task Title"
  ```

Also check for inline tasks in the project file body — these should be checked off or noted.

---

## 5. Move to archive

Move the entire project folder to the archive:

```bash
obsidian move file="ProjectName Project" to="archive/YYYY`projects`/ProjectName Project/"
```

The year in `archive/YYYY/` should be the year the project ended (from `end-date`), not the current year.

Note: Moving the main project file may not move all files in the folder. Verify that all project files are archived. The user may need to move the folder manually in Obsidian's file explorer.

---

## 6. Log the session

Append a closing summary to today's daily note:

```bash
obsidian append file="YYYY-MM-DD" content="## Project: [Project Name] — Closed\n**Session type:** Close\n**Ended as:** [completed`abandoned``paused``merged`]\n\n**Result:** [one-line summary]\n\n**Knowledge extracted:**\n- 📖 [[Note Name]] (if any)\n- 💡 [[Creation Name]] (if any)\n\n**Tasks resolved:** [count resolved, count reassigned]"
```

---

## 7. Retrospective

After the closure is complete, ask:

- "What system improvements emerged from this project?"
- "Were there any workflow friction points — things that should be easier next time?"
- "Should any rules, workflows, or templates be updated based on what you learned?"

This connects to the **Session Retrospective** in `vault-rules/global-conventions.md`. Present recommendations as specific, actionable suggestions — e.g., "Add a `stakeholders:` property to the project template" not "Consider improving the process."

---

## Key Principles

- **Closure is a ceremony, not a checkbox** — the Result section captures learning, not just completion
- **Extract knowledge before archiving** — insights trapped in a project folder are lost knowledge
- **The LLM facilitates; the user decides** — never move files or mark tasks without approval
- **Paused ≠ abandoned** — if the idea has life left, create a `🌱` seedling for it
- **Areas don't close** — only finite projects close. If an ongoing responsibility ends, remove the sub-area; don't archive the parent area
- **Archive preserves structure** — the original folder layout stays intact for future reference
- **Retrospective feeds the system** — every closure is a chance to improve the vault's workflows and rules
