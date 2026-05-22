---
tags:
  - 📌
aliases:
create-date: "[[<% tp.date.now() %>]]"
location:
  - 
  - 
related:
dg-publish: false
append_modified_update: true
modified-dates:
maps: []
---
# <% tp.file.title %>

```mapview
{"name":"Default","type":"map","center":{"lat":0,"lng":0},"zoom":10}
```

# Activities

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name"
FROM #🚧
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT create-date DESC
```
