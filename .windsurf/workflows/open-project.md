---
description: Open a new project with a Socratic brainstorming ceremony based on GTD's Natural Planning Model
---
# Open Project Workflow

Guide the user through opening a new project using **David Allen's Natural Planning Model** (*Getting Things Done*, ch. 3): Purpose → Outcome Visioning → Brainstorming → Organizing → Next Actions. The LLM facilitates **divergent then convergent thinking** — it does not fill in sections for the user.

## Before Starting

Determine if the user already has a project file or needs to create one:

- **New project** — the user will create it in Obsidian using the `f-project.md` template (or a variant like `f-book-project.md`, `f-career-project.md`). The template creates the folder, seeds starter tasks, and sets up the body structure.
- **Existing project with empty sections** — the user has a project file but Objective/Metrics/Brainstorm are placeholder text. Read the project file to orient.

```bash
obsidian read file="ProjectName Project"
```

---

## 1. Orient in the vault

Search for context before starting the conversation:

```bash
obsidian read file="YYYY-MM-DD"                            # today's daily note
obsidian search query="[project topic]" limit=20            # related notes
```

Look for:
- Existing Maps of Content that could serve as the project's Area (`parent:`)
- Related projects (active or archived) on the same topic
- Zettelkasten notes or creations that connect to this project's domain

Present findings as context, not directives.

## 2. Purpose — Fill the Objective

Ask open-ended questions to help the user articulate the project's purpose. Do NOT write the Objective for them.

**Questions to ask:**
- "What value will you have when this is done?"
- "Why does this matter to you right now?"
- "What would happen if you didn't do this project?"
- "Who benefits from this work?"
- "Is this truly a project (defined outcome) or an ongoing area of interest (map)?"

Wait for the user to articulate their objective. When they're ready, they write it into the `# Objective` section. Offer to help refine the wording but never replace it.

## 3. Outcome Visioning — Fill the Metrics

Help the user envision what done looks like.

**Questions to ask:**
- "How will you know this project is successful?"
- "What would you show someone to prove it worked?"
- "What does the finish line look like — concretely?"
- "Are there measurable indicators, or is it more of a feeling?"

The user writes their metrics. Encourage specificity where possible, but accept qualitative metrics for personal projects.

## 4. Brainstorm

Shift to **divergent thinking**. The LLM asks expanding questions, not narrowing ones. Capture everything in the `# Brainstorm` section (or a separate embedded brainstorm note).

**Questions to ask:**
- "What are all the things that come to mind when you think about this?"
- "What resources, people, or tools might be relevant?"
- "What could go wrong? What are the risks?"
- "Have you done anything like this before? What did you learn?"
- "What's the wildest approach you can imagine?"

Do NOT organize or filter during brainstorming. That comes next.

## 5. Organize — Set up Execution

**Converge** from the brainstorm. Help the user identify:

- **First next actions** — concrete tasks to create in the `tasks/` subfolder
- **Key milestones** — if the project is large enough to warrant them
- **People involved** — link to `references/people/` notes via `attendees:` on meeting notes

Create tasks only with user approval:

```bash
obsidian create name="Task Title" content="---\naliases: []\nappend_modified_update: true\ncreate-date: \"[[YYYY-MM-DD]]\"\ndue: YYYY-MM-DD\nmodified-dates:\n  - \"[[YYYY-MM-DD]]\"\npriority: normal\nprojects:\n  - \"[[ProjectName Project]]\"\nrelated:\nscheduled: YYYY-MM-DD\nstatus: todo\ntags:\n  - 📋\n---\n" silent
obsidian move file="Task Title" to="projects/ProjectName Project/tasks/"
```

**Verify:** `obsidian read file="Task Title"` — confirm task landed in the correct project folder with proper frontmatter.

## 6. Orient — Connect to the vault

Set the project's metadata connections:

- **`parent:`** — identify the Area (Map of Content) this project belongs to. Search for existing maps:
  ```bash
  obsidian search query="[area topic]" limit=10
  ```
  If the right map doesn't exist, note it as a phantom link — the map can be created later.

- **`related:`** — link to Maps of Content, related projects, or zettelkasten notes that connect to this project's domain.

Apply metadata only with user approval:

```bash
obsidian property:set name="parent" value="[[MapName]]" file="ProjectName Project"
obsidian property:set name="related" value="[[Map1]],[[Map2]]" type=list file="ProjectName Project"
```

## 7. Log the session

Append an opening summary to today's daily note:

```bash
obsidian append file="YYYY-MM-DD" content="## Project: [Project Name]\n**Session type:** Open\n**Objective:** [one-line summary]\n\n**Produced:**\n- 🚧 [[ProjectName Project]]\n- 📋 [list of tasks created]"
```

Daily notes use `YYYY-MM-DD` naming (e.g., `2026-05-18`). Compute from the current date.

---

## Key Principles

- **Divergent then convergent** — brainstorm broadly before narrowing to tasks
- **The LLM asks; the user answers** — never auto-fill Objective, Metrics, or Brainstorm
- **Begin with the end in mind** (Covey, Habit 2) — Objective defines done before work starts
- **Every project needs a next action** (Allen) — don't end the ceremony without at least one concrete task
- **Connect to the knowledge graph** — set `parent:` and `related:` so the project is discoverable
