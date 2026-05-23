<%*  
	const meeting = (await tp.system.prompt("Name"));  
	const uniqueId = moment().format("YYYYMMDDHHmm");  
	const Filename = uniqueId + " - " + meeting;

    // Using dataview
    const dv = this.app.plugins.plugins["dataview"].api;

    // Filter for projects and areas
    let targets = dv.pages("#🚧 or #🛒").file.sort(n => n.name);
    let suggestions = targets.name;
    let values = targets.name;
    const projectName = await tp.system.suggester(suggestions,values);

	await tp.file.rename(Filename);
    // Determine folder: areas/ for 🛒, projects/ for 🚧
    const targetPage = dv.page(projectName);
    const directoryPath = targetPage ? targetPage.file.folder : "projects/" + projectName
	if (!tp.file.exists(directoryPath)) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + Filename)

-%>
---
banner: "[[f-session.webp]]"
tags: [🧙]
create-date: "[[<% tp.date.now() %>]]"
aliases: ["<% meeting %>"]
parent:  "[[<% projectName %>]]"
attendees:  
related:
modified-dates:
append_modified_update: true
---
# <% Filename %>

---

## Goals


## Notes


## Related

```dataview
TABLE WITHOUT ID link(file.link, aliases[0]) as "Sessions", create-date as "Date" WHERE parent = link("<% projectName %>") and contains(tags, "🧙") SORT create-date DESC
```
