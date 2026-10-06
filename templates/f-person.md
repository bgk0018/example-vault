<%*
  let folder = "references/people";
  let personName = tp.file.title;

  // Move the person note directly to references/people/ (flat, no subdirectory)
  await tp.file.move(folder + "/" + personName)

  // Ensure the Relationships area's tasks/ folder exists
  const areaTasksDir = "areas/Relationships/tasks"
  if (!(await this.app.vault.adapter.exists(areaTasksDir))) {
    await this.app.vault.createFolder(areaTasksDir)
  }

  // Helper to create a TaskNotes note in Relationships/tasks/ if it does not exist
  const today = tp.date.now("YYYY-MM-DD")
  const ensureRelationshipTask = async (taskTitle, opts) => {
    const filePath = `${areaTasksDir}/${taskTitle}.md`
    if (await this.app.vault.adapter.exists(filePath)) {
      return
    }
    const nowIso = new Date().toISOString()
    const due = opts.due || today
    const body = opts.body || ""
    let extraFields = ""
    if (opts.recurrence) {
      extraFields += `\nrecurrence: "${opts.recurrence}"`
    }
    if (opts.recurrenceAnchor) {
      extraFields += `\nrecurrence-anchor: ${opts.recurrenceAnchor}`
    }
    const content = `---
aliases: []
append_modified_update: true
contexts: []
create-date: "[[${today}]]"
dateCreated: ${nowIso}
dateModified: ${nowIso}
due: ${due}
modified-dates:
  - "[[${today}]]"
priority: normal
projects:
  - "[[Relationships]]"
related:
  - "[[${personName}]]"
scheduled: ${today}
status: todo
tags:
  - 📋${extraFields}
---
${body}
`
    await this.app.vault.create(filePath, content)
  }

  // Seed relationship-maintenance tasks for this person
  await ensureRelationshipTask(`Happy Birthday - ${personName}`, {
    due: today,
    body: `It's [[${personName}]]'s birthday! Send a message, call, or celebrate with them.`,
    recurrence: "FREQ=YEARLY",
    recurrenceAnchor: "scheduled"
  })
  await ensureRelationshipTask(`Connect on LinkedIn - ${personName}`, {
    due: today,
    body: `Find and connect with [[${personName}]] on [LinkedIn](<https://www.linkedin.com/search/results/all/?keywords=${encodeURIComponent(personName)}>).`
  })
-%>
---
aliases:
  - <% tp.file.title %>
append_modified_update: true
create-date: "[[<% tp.date.now() %>]]"
linter-yaml-title-alias: <% tp.file.title %>
modified-dates:
name: <% tp.file.title %>
related:
tags:
  - 🙂
---

# <% tp.file.title %>

> [!TODO]+
> ![[projects/Tasks.base#By Person]]

> [!NOTE]+ Meetings
> ![[Meetings.base#By Person]]

## Tasks

- [[areas/Relationships/tasks/Happy Birthday - <% personName %>]]
- [[areas/Relationships/tasks/Connect on LinkedIn - <% personName %>]]

## Notes


## Related

