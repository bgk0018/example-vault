<%*  
	let name = (await tp.system.prompt("Name"));  
	let project = name + " Career Project"  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = name + " One on One - " + uniqueId;
	let folder = "projects/" + project;
	await tp.file.rename(filename);
	await tp.file.move(folder + "/" + filename);
-%>
---
banner: "[[f-one-on-one.webp]]"
tags: [👥, one-on-one]
create-date: "[[<% tp.date.now() %>]]"
project: "[[<% project %>]]"  
attendees: "[[<% name %>]]"
modified-dates:
append_modified_update: true
maps:
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


