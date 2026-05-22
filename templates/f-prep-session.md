<%*  
	let uniqueId = moment().format("YYYYMMDDHHmm");  
	let filename = "Session - " + uniqueId;  
	await tp.file.rename(filename);  
-%>
---
tags: [🧙]
create-date: "[[<% tp.date.now() %>]]"
before: 
after: 
campaign:
append_modified_update: true
modified-dates:
---

# <% filename %>

# Housekeeping
> [!HINT]-  
> In this section, write down things about the game (mechanics, house rules) that you need to communicate to the players.

![[House Rules]]

---
# Review the Characters
---

```dataview
TABLE WHERE contains(file.folder, this.file.folder) and contains(tags, "rpg/pc")
```

# The Story
---
## Last Time

[[LastSession#Results]]

## Ahead

*Write your strong start here*

# Scenes
---
*List your scenes here*

# Results
---


