<%*  
	let clientName = (await tp.system.prompt("Client Name"));  
	let filename = clientName + " Sales Project";  
	await tp.file.rename(filename);

	const directoryPath = "projects/" + filename
	if (!(await this.app.vault.adapter.exists(directoryPath))) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + filename)

	// Create a tasks folder for TaskNotes-style task notes
	const tasksDirPath = directoryPath + '/tasks'
	if (!(await this.app.vault.adapter.exists(tasksDirPath))) {
		await this.app.vault.createFolder(tasksDirPath)
	}

	// Helper to create a TaskNotes note if it does not exist
	const ensureTaskNote = async (taskTitle) => {
		const filePath = `${tasksDirPath}/${taskTitle}.md`
		if (await this.app.vault.adapter.exists(filePath)) {
			return
		}
		const today = tp.date.now("YYYY-MM-DD")
		const nowIso = new Date().toISOString()
		const content = `---\naliases: []\nappend_modified_update: true\ncontexts: []\ncreate-date: "[[${today}]]"\ndateCreated: ${nowIso}\ndateModified: ${nowIso}\ndue: ${today}\nmodified-dates:\n  - "[[${today}]]"\npriority: normal\nprojects:\n  - "[[${filename}]]"\nrelated:\nscheduled: ${today}\nstatus: todo\ntags:\n  - 📋\n---\n`
		await this.app.vault.create(filePath, content)
	}

	// Seed sales engineering process tasks
	await ensureTaskNote('Complete prospect research')
	await ensureTaskNote('Prepare discovery agenda')
	await ensureTaskNote('Draft solution approach')
	await ensureTaskNote('Draft Statement of Work')
	await ensureTaskNote('Deliver proposal')
-%>
---
aliases: []
banner: "[[pexels-catcaryn-938165.webp]]"
tags: [🚧]
create-date: "[[<% tp.date.now() %>]]"
start-date: "[[<% tp.date.now() %>]]"
end-date: 
ended-as:
parent:
modified-dates:
append_modified_update: true
related:
  - "[[Sales Engineering]]"
---
# Objective

Win a paid engagement with <% clientName %> for [solution area].

# Prospect

> Company overview, key contacts, current tech stack, and pain points. Link to research artifacts (Company Snapshot, LinkedIn profiles, etc.)

# Discovery

> Current state vs desired state. Key findings from discovery conversations.

# Solution Approach

> High-level architecture, phased roadmap, key assumptions, and risks.

# Brainstorm

# Metrics

- SOW delivered and acknowledged
- Discovery workshop or architecture deep-dive scheduled
- Engagement signed

# Execution

- [[projects/<% filename %>/tasks/Complete prospect research]]
- [[projects/<% filename %>/tasks/Prepare discovery agenda]]
- [[projects/<% filename %>/tasks/Draft solution approach]]
- [[projects/<% filename %>/tasks/Draft Statement of Work]]
- [[projects/<% filename %>/tasks/Deliver proposal]]

---
- [ ] #📋 [[<% filename %>]]: Determine next action 🔁 every month 📅 <% tp.date.now() %>
---

```dataview
TABLE WITHOUT ID link(file.link, aliases[0]) as "Meetings", create-date as "Date" FROM "projects" WHERE parent = link("<% filename %>") and contains(tags, "👥") SORT create-date DESC
```

# Result

> What was the outcome? Did we win? What did we learn?
