<%*
  let folder = "references/people";
  let filename = tp.file.title;
  await tp.file.move(folder + "/" + filename);
-%>
---
banner: "[[f-person-20250109114009371.webp]]"
tags:
  - 🙂
create-date: "[[<% tp.date.now() %>]]"
name: <% tp.file.title %>
append_modified_update: true
modified-dates:
maps: []
---
# <% tp.file.title %>

> [!NOTE]+ Meetings
> ```dataview
> TABLE create-date as Date FROM #👥 WHERE contains(attendees, link("<% tp.file.title %>")) SORT create-date DESC 
> ```

## Tasks
---
- [ ] #📋 Tell [[<% tp.file.title %>]] Happy Birthday (Not Set) 🔁 every year ⏳ <% tp.date.now("YYYY-MM-DD", 365) %> 📅 <% tp.date.now("YYYY-MM-DD", 365) %>
---
- [ ] #📋 Add [[<% tp.file.title %>]] on [LinkedIn](<https://www.linkedin.com/search/results/all/?keywords=<% tp.file.title %>>) ⏳ <% tp.date.now("YYYY-MM-DD", 365) %> 📅 <% tp.date.now() %>

## Notes


## Related


