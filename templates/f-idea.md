<%*  
	let name = (await tp.system.prompt("Name"));  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = name + " - " + uniqueId;  
	await tp.file.rename(filename);  
-%>
---
banner: "[[f-idea.webp]]"
aliases: ["<% name %>"]
tags: [🌱]
create-date: "[[<% tp.date.now() %>]]"
parent:
related:
challenges:
dg-publish: false
modified-dates:
append_modified_update: true
---
# <% name %>



## References


