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


# Process

For each chapter:
1. **Read** — Read the chapter, note key words and ideas
2. **Write** — Write a chapter review in my own words, composing those ideas together
3. **Highlight** — Revisit the chapter and highlight concepts related to what I wrote
4. **Reference** — Generate the highlights document and reference them in the book report
5. **Distill** — When the book report is complete, process everything into zettelkasten notes

# Metrics

- [ ] Read Book
- [ ] Write Notes (chapter-by-chapter book report)
- [ ] Generate Highlights
- [ ] Create From It (zettelkasten notes with provenance)

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

