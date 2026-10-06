<%*  
	const _args = window._templater_args || {};
	delete window._templater_args;
	let Name = _args.name || (await tp.system.prompt("Name"));  
	let filename = Name
	await tp.file.rename(filename);  
-%>
---
tags: [🧙]
create-date: "[[<% tp.date.now() %>]]"
parent:
related:
challenges:
modified-dates:
append_modified_update: true
---
# <% Name %>



## References


