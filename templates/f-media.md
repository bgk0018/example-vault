<%*  
	let Name = (await tp.system.prompt("Name"));  
	await tp.file.rename(Name);  
-%>
---
tags: [🎥]
create-date: "[[<% tp.date.now() %>]]"
title: <% Name %>
authors: 
cssClasses: [cards, cards-cols-4]
recommended-by:
url:
published:
dg-publish: true
append_modified_update: true
modified-dates:
maps:
---
# <% Name %>

>[!Summary]  
> 

# Concepts

```dataview
TABLE WITHOUT ID 
    link(file.link, default(aliases[0], file.name)) as "Name",
    "Weight: " + default(length(file.inlinks), 0) as "Weight"
FROM #📖 
WHERE contains(referenced-in, this.file.link)
SORT default(length(file.inlinks), 0) DESC
```