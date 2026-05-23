<%*  
	let name = (await tp.system.prompt("Area Name"));  
	await tp.file.rename(name);

	const directoryPath = "areas/" + name
	if (!(await this.app.vault.adapter.exists(directoryPath))) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + "/" + name)

	// Create a tasks folder for area-level recurring tasks
	const tasksDirPath = directoryPath + '/tasks'
	if (!(await this.app.vault.adapter.exists(tasksDirPath))) {
		await this.app.vault.createFolder(tasksDirPath)
	}

-%>
---
banner: "[[f-map-20250108173714088.webp]]"
tags: [🛒]
create-date: "[[<% tp.date.now() %>]]"
description:
modified-dates:
append_modified_update: true
related:
---


# <% name %>

## Summary


## Sub-areas

> [!folder]- Sub-areas

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Name",
	description as "Description"
FROM #🛒
WHERE contains(parent, this.file.link)
SORT file.name ASC
```

## Projects

> [!example]- Active Projects

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name"
FROM #🚧
WHERE contains(parent, this.file.link)
SORT create-date DESC
```

## Meetings & Notes

> [!note]- Meetings and Notes

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name",
	create-date as "Date"
FROM #👥 or #🧙
WHERE contains(parent, this.file.link)
SORT create-date DESC
```

## Related Maps

> [!compass]- Related Maps

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Map"
FROM "maps"
WHERE contains(related, this.file.link)
SORT file.name ASC
```
