<%*  
	let person = await tp.system.prompt("Person");  
	let folder = person + " Career"
	
	let filename = folder + " Project";  
	await tp.file.rename(filename);

	const directoryPath = "projects/" + folder
	if (!tp.file.exists(directoryPath)) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + filename)
 
-%>
---
banner: "[[pexels-catcaryn-938165.webp]]"
tags: [🚧]
create-date: "[[<% tp.date.now() %>]]"
start-date: "[[<% tp.date.now() %>]]"
end-date:
aliases: ["<% person + " Career" %>"]
modified-dates:
append_modified_update: true
parent:
related:
---
# Objective
That [[<% person %>]] is fulfilled by their career and grows into the potential they have as an Improver.

# Brainstorm


# Metrics
- Tenure at Improving (Length of time at Improving)
- Satisfaction with work (On a day to day basis how do I feel about work?)
- Growth in career (How are we moving compared to our ambitions?)

# Execution

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

# Result
> What was the result of this work?

# Related

