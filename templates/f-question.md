<%*  
	let name = (await tp.system.prompt("Name"));  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = name + " - " + uniqueId;  
	await tp.file.rename(filename);  
-%>
---
banner: "[[f-question-20250109114542473.webp]]"
aliases: ["<% name %>"]
tags: [❓]
create-date: "[[<% tp.date.now() %>]]"
parent:
related:
prompted-by:
challenges:
dg-publish: true
modified-dates:
append_modified_update: true
maps:
---
# Content


# References


