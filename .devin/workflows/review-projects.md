---
description: Review active projects for health signals — stale projects, missing next actions, knowledge harvest opportunities
---
# Review Projects Workflow

A periodic project health check based on **David Allen's Weekly Review** (*Getting Things Done*, ch. 8) and **Tiago Forte's PARA triage** (*Building a Second Brain*). Can review a single project or sweep all active projects.

## Determine scope

Ask the user which mode they want:

- **Single project** — the user names a specific project to review
- **Full sweep** — review all active projects, surface health signals, scan by Area

---

## 1. Surface health signals

Open `Projects.base` or run CLI queries to find projects needing attention:

### Stale projects (no activity in 30+ days)

```bash
obsidian search query="tag:🚧" limit=50
```

Cross-reference with `Projects.base` → Stale view. For each stale project, note when it was last modified.

### Projects without next actions

Check `Projects.base` → Open Tasks by Project view. Any active project NOT appearing in that view has no open `📋` task — it has stalled.

Alternatively, for a specific project:

```bash
obsidian search query="projects: [[ProjectName Project]]" limit=20
```

Look for task notes with `status: todo` or `status: in-progress`.

### Empty Objective/Metrics

Read each project file and check whether the `# Objective` and `# Metrics` sections contain real content or just placeholder text.

```bash
obsidian read file="ProjectName Project"
```

---

## 2. Walk each flagged project

For each project that needs attention, facilitate a brief review conversation:

**Questions to ask:**
- "Is this project's Objective still relevant? Has anything changed?"
- "What is the very next physical action for this project?"
- "Are there meetings or notes that need processing?"
- "Should this project be closed, paused, or continued?"

If the project is stale:
- "This project hasn't been touched in [N] days. Is it still active?"
- "Should it be closed via `/close-project`, or does it just need a next action?"
- "Could this become a Someday item (`🌱` creation) instead?"

If there's no next action:
- "What's blocking progress? Is there a decision needed?"
- "What would move this forward by one step?"

Create tasks only with user approval.

---

## 3. Knowledge harvest

For each reviewed project, ask:

- "Did anything emerge from this project recently that's worth planting?"
- "Any insights that could become a `📖` zettelkasten note?"
- "Any working documents (`🍃`) that have grown into something reusable?"

If the user identifies something worth planting, bridge to `/garden plant` — but don't force it. Not every review produces learning exhaust.

---

## 4. Someday check

Review `🌱` creation notes that represent project proposals (former Someday items):

```bash
obsidian search query="tag:🌱" limit=20
```

Ask:
- "Any of these seedling ideas ready to become a real project?"
- "If so, we can activate it via `/open-project`."

---

## 5. Area horizon scan

Areas are ongoing responsibilities — they don't go stale the way projects do. Review them at a different cadence (monthly or quarterly, not weekly).

### Surface area health

```bash
obsidian base:query file="areas/Areas.base" view="All Areas" format=md
obsidian base:query file="projects/Projects.base" view="Category" format=md
```

**Questions to ask:**
- "Are any areas getting too many active projects? Could some be deferred?"
- "Are any areas completely empty — no active projects? Is that intentional, or has something stalled?"
- "Are there orphan projects with no `parent:` pointing to an area? Should they be assigned?"
- "Do any sub-areas (career relationships, recurring responsibilities) need attention?"
- "Has any area's scope changed? Does `description:` still reflect your accountability?"

This step implements Allen's **Horizons of Focus** (*Getting Things Done*, ch. 9) at the 20,000-foot (Areas of Responsibility) level.

---

## 6. Log the session

Append a review summary to this week's weekly note:

```bash
obsidian append file="YYYY-Www" content="## Project Review\n**Date:** [[YYYY-MM-DD]]\n**Projects reviewed:** [count]\n\n**Health signals:**\n- 🟡 Stale: [list]\n- ⚠️ No next action: [list]\n\n**Decisions:**\n- [actions taken]\n\n**Knowledge harvest:**\n- [any notes planted]"
```

Weekly notes use `YYYY-Www` naming (e.g., `2026-W21`). If unsure of the format, check the `journal/2-weekly/` folder.

If no weekly note exists for the current week, append to the daily note instead under `## Project Review`.

---

## Key Principles

- **The Weekly Review is the heartbeat** (Allen) — without it, projects silently stall
- **Every active project needs a next action** — if it doesn't have one, it's stalled
- **Stale ≠ dead** — a stale project may just need attention, not closure
- **The LLM surfaces; the user decides** — present health signals as questions, not judgments
- **Harvest knowledge along the way** — review is an opportunity to plant into the garden
- **Areas frame the review** — grouping by `parent:` area reveals imbalances
- **Areas have a different cadence** — review areas monthly/quarterly, projects weekly
