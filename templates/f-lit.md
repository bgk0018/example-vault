<%*  
	let Name = (await tp.system.prompt("Name"));  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = Name + " - " + uniqueId;  
	await tp.file.rename(filename);  
-%>
---
banner: "[[f-lit-20250108173451193.webp]]"
aliases: ["<% Name %>"]
tags: [📖,♣️]
create-date: "[[<% tp.date.now() %>]]"
parent:
related:
challenges:
dg-publish: true
referenced-in:
modified-dates:
append_modified_update: true
maps:
---
# Content



# References


# Flashcards