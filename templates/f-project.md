<%*  
	let projectName = (await tp.system.prompt("Name"));  
	let filename = projectName + " Project";  
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

	// Seed starter project tasks as separate TaskNotes notes
	await ensureTaskNote('Create objective')
	await ensureTaskNote('Create brainstorm')
	await ensureTaskNote('Create metrics')
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
---
# Objective
> What value will I have at the end of this project?

# Brainstorm


# Metrics
> How will I know if the project has been successful?

# Execution

- [[projects/<% filename %>/tasks/Create objective]]
- [[projects/<% filename %>/tasks/Create brainstorm]]
- [[projects/<% filename %>/tasks/Create metrics]]

---
- [ ] #📋 [[<% filename %>]]: Determine next action 🔁 every month 📅 <% tp.date.now() %>
---

# Result
> What was the result of this work?

