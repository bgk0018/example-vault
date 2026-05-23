<%*  
	const meeting = (await tp.system.prompt("Name")) + " Meeting";  
	const uniqueId = moment().format("YYYYMMDDHHmm");  
	const Filename = meeting + " - " + uniqueId;

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
    const isArea = targetPage && targetPage.tags && targetPage.tags.includes("🛒");
    const baseFolder = isArea ? "areas" : "projects";
    const directoryPath = targetPage ? targetPage.file.folder : baseFolder + "/" + projectName
	if (!tp.file.exists(directoryPath)) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + Filename)

-%>
---
banner: "[[f-meeting.webp]]"
tags: [👥]
create-date: "[[<% tp.date.now() %>]]"
aliases: ["<% meeting %>"]
parent:  "[[<% projectName %>]]"
attendees:  
related:
modified-dates:
append_modified_update: true
maps:
---
# <% Filename %>

---

## Goals / Agenda
1. 

## Discussion Notes
- 

## Action Items


## Related

```dataview
TABLE WITHOUT ID link(file.link, aliases[0]) as "Meetings", create-date as "Date" WHERE parent = link("<% projectName %>") and contains(tags, "👥") SORT create-date DESC
```
