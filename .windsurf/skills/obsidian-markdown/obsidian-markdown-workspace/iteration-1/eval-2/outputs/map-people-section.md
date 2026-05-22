## People

> [!tip]- People Connected to This Topic
> This section shows people whose work, ideas, or conversations are connected to this map.

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Name"
FROM #🙂
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT file.name ASC
```
