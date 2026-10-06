<%*  
	const _args = window._templater_args || {};
	delete window._templater_args;
	let name = _args.name || (await tp.system.prompt("Person Name"));  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = name + " One on One - " + uniqueId;

	// Find the relationship sub-area folder for this person
	const dv = this.app.plugins.plugins["dataview"].api;
	let areas = dv.pages("#🛒").where(p => p.file.folder.startsWith("areas/")).file.sort(n => n.name);
	let areaNames = areas.name;
	let parentArea = _args.project || (await tp.system.suggester(areaNames, areaNames));

	let folder = "areas/" + parentArea + "/" + name;
	await tp.file.rename(filename);
	if (!(await this.app.vault.adapter.exists(folder))) {
		await this.app.vault.createFolder(folder);
	}
	await tp.file.move(folder + "/" + filename);
-%>
---
banner: "[[f-one-on-one.webp]]"
tags: [👥, one-on-one]
create-date: "[[<% tp.date.now() %>]]"
project: "[[<% name %>]]"  
attendees: "[[<% name %>]]"
modified-dates:
append_modified_update: true
related:
---
# <% filename %>

---

## Goals / Agenda
- [ ] What do you have for me?
- [ ] Is there anything I can help with?
- [ ] You should know...
- [ ] Review Goal Commitments
- [ ] Career Question

## Discussion Notes



## Action Items


