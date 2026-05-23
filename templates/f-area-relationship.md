<%*  
	let person = await tp.system.prompt("Person");
	let parentArea = await tp.system.prompt("Parent Area (e.g., Career Development)");
	let folder = person

	let filename = person;  
	await tp.file.rename(filename);

	const directoryPath = "areas/" + parentArea + "/" + folder
	if (!(await this.app.vault.adapter.exists(directoryPath))) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + filename)

	// Create a tasks folder for relationship tasks
	const tasksDirPath = directoryPath + '/tasks'
	if (!(await this.app.vault.adapter.exists(tasksDirPath))) {
		await this.app.vault.createFolder(tasksDirPath)
	}

-%>
---
banner: "[[pexels-catcaryn-938165.webp]]"
tags: [🛒]
create-date: "[[<% tp.date.now() %>]]"
aliases: ["<% person %>"]
parent: "[[<% parentArea %>]]"
modified-dates:
append_modified_update: true
related:
---
# <% person %>

## Objective
> What does success look like for this relationship/responsibility?

## Metrics
> How do you measure health of this responsibility?

## Execution

> [!TODO]
> ```tasks
> not done
> description includes [[<% person %>]]
> sort by due
> short mode
> ```
> 
---

- [ ] #📋 Have a one on one with [[<% person %>]] 🔁 every month ⏳ <% tp.date.now() %> 📅 <% tp.date.now() %>
---
- [ ] #📋 Schedule an in person one on one with [[<% person %>]] 🔁 every 3 months ⏳ <% tp.date.now() %> 📅 <% tp.date.now() %>
---

## Related

