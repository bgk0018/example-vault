<%*  
	let name = (await tp.system.prompt("Name"));  
	await tp.file.rename(name);

	const directoryPath = "maps"
	await tp.file.move(directoryPath + "/" + name)

-%>
---
banner: "[[f-map-20250108173714088.webp]]"
tags: [🗺️]
create-date: "[[<% tp.date.now() %>]]"
modified-dates:
append_modified_update: true
description:
dg-publish: true
---


# <% name %>

## Summary



## Exploration

> [!bulb]- Ideas and Questions I've Captured  
> This section captures brainstorming sessions, potential applications, and questions that emerge during learning. It serves as a space for documenting creative thoughts, implementation possibilities, and areas that need further exploration.

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Name"
FROM #🌱 or #🌿 or #🌳 or #❓ 
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT create-date DESC
```

## Projects

> [!example]- Projects I've Attempted  
> This section documents hands-on experiences and practical implementations. It includes experiments, proof-of-concepts, and real-world applications that help reinforce understanding through actual usage.

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name"
FROM #🚧
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT create-date DESC
```

## Concepts

> [!info]- Concepts I've Broken Out  
> This section breaks down fundamental concepts into manageable components. It focuses on core principles, terminology, and essential knowledge areas that form the foundation of understanding the subject matter.

```dataview
TABLE WITHOUT ID 
	link(file.link, default(aliases[0], file.name)) as "Name",
	default(length(file.inlinks), 0) as "Weight"
FROM #📖
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT default(length(file.inlinks), 0) DESC
```

## Notes

> [!note]- Notes I've Taken  
> This section contains detailed notes from various learning sources such as meetings, workshops, tutorials, and personal observations. It serves as a repository for insights, challenges encountered, and key takeaways from practical experiences.

```dataview
TABLE WITHOUT ID
	link(file.name) as "Name"
FROM #⏱️ or #👥 or #🧙
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT create-date DESC
```

## References

> [!quote]- References I've used  
> This section maintains a curated list of learning resources including documentation, articles, videos, and other materials that contribute to understanding the topic. It serves as a bibliography of valuable information sources for future reference.

```dataview
TABLE WITHOUT ID
	link(file.name) as "Title"
FROM #📰 or #🎥 or #🎓 or #📕 or #🗣️
WHERE
	contains(related, this.file.link) or
	contains(parent, this.file.link)
SORT create-date DESC
```

## Other

> [!QUESTION]- Other Files
> A catch all so I can appropriately categorize files I deemed related but have not appropriately tagged.

```dataview
TABLE WITHOUT ID
	link(file.name) as "Title"
WHERE !contains(file.tags, "📰") 
	AND !contains(file.tags, "🎥")
	AND !contains(file.tags, "🎓")
	AND !contains(file.tags, "📕")
	AND !contains(file.tags, "🗣️")
	AND !contains(file.tags, "✂️")
	AND !contains(file.tags, "📖")
	AND !contains(file.tags, "⏱️")
	AND !contains(file.tags, "👥")
	AND !contains(file.tags, "🌱")
	AND !contains(file.tags, "🌿")
	AND !contains(file.tags, "🌳")
	AND !contains(file.tags, "❓")
	AND !contains(file.tags, "🚧")
	AND !contains(file.tags, "🧙")
	AND (
	contains(related, this.file.link) or
	contains(parent, this.file.link))
SORT create-date DESC
```
