<%*
  let folder = "references/organizations";
  let filename = tp.file.title;
  await tp.file.move(folder + "/" + filename);
-%>
---
banner: "[[f-person-20250109114009371.webp]]"
tags:
  - 🏢
create-date: "[[<% tp.date.now() %>]]"
name: <% tp.file.title %>
append_modified_update: true
modified-dates:
maps: []
---
# <% tp.file.title %>


## Notes


## Related


