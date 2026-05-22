<%*  
	const meeting = (await tp.system.prompt("Name")) + " Meeting";  
	const uniqueId = moment().format("YYYYMMDDHHmm");  
	const Filename = meeting + " - " + uniqueId;

    // Using dataview
    const dv = this.app.plugins.plugins["dataview"].api;

    // Filter for project files
    let projects = dv.pages("#🚧").file.sort(n => n.name);
    let suggestions = projects.name;
    let values = projects.name;
    const projectName = await tp.system.suggester(suggestions,values);

	await tp.file.rename(Filename);  
    const suffix = ' Project'
	const directoryPath = "projects/" + projectName
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
TABLE WITHOUT ID link(file.link, aliases[0]) as "Meetings", create-date as "Date" FROM "projects" WHERE parent = link("<% projectName %>") and contains(tags, "👥") SORT create-date DESC
```
