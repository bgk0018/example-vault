<%*  
	let project = (await tp.system.prompt("Name"));  
	let filename = project + " Book Project";  
	await tp.file.rename(filename);

	const directoryPath = "projects/" + project
	if (!tp.file.exists(directoryPath)) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + filename)
-%>
---
banner: "[[pexels-catcaryn-938165.webp]]"
aliases: []
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

Read and take notes on the book so that I can add it to my note collection and generate learning exhaust from it.

# Brainstorm


# Metrics

- [ ] Read Book
- [ ] Write Notes
- [ ] Create From It

# Execution

> [!TODO]+
> ```tasks
> 	not done
> 	description includes [[<% tp.file.title %>]]
> 	sort by due
> 	short mode
> ```

---
- [ ] #📋 [[<% filename %>|<% project %>]]: Read Book 📅 <% tp.date.now() %> ⏳ <% tp.date.now() %>  🔁 every day
- [ ] #📋 [[<% filename %>|<% project %>]]: Write Notes 📅 <% tp.date.now() %> ⏳ <% tp.date.now() %> 🔁 every week
---
- [ ] #📋 [[<% filename %>|<% project %>]]: Determine next action 🔁 every month 📅 <% tp.date.now() %> ⏳ <% tp.date.now() %>
---

# Result
> What was the result of this work?

