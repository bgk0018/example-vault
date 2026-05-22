<%*  
var fileDate = moment(tp.file.title, 'gggg-[W]ww');  
let createDate = moment(fileDate).format('YYYY-MM-DD')  
let after = moment(fileDate).add(1, 'w').format('gggg-[W]ww');  
let before = moment(fileDate).subtract(1, 'w').format('gggg-[W]ww');  
let week = fileDate.format('gggg-[W]ww');  
let month = fileDate.format('YYYY-MM');

let nextDay = moment(fileDate);
let dayList = "[";  
for(let i=0; i<7; i++){  
	dayList += "\"[["+ nextDay.format('YYYY-MM-DD') + "]]\","; 
	nextDay = nextDay.add(1, 'd');
}
dayList = dayList.slice(0, -1)+ "]";
-%>
---
banner: "[[pexels-eberhardgross-1612351.webp]]"
tags: [📅]
create-date: "[[<% createDate %>]]"
parent: "[[<% month %>]]"  
before: "[[<% before %>]]"  
after: "[[<% after %>]]"  
children: <% dayList %>  
modified-dates:
append_modified_update: true
---
# <% tp.file.title %> Review

## Notes From the Week

```dataview
TABLE rows.file.link WHERE date(link(create-date)) >= date(<% moment(fileDate).format('YYYY-MM-DD') %>) AND date(link(create-date)) < date(<% moment(fileDate).format('YYYY-MM-DD') %>) + dur(7days) GROUP BY file.folder
```


## Tasks

> [!Todo] Monday
> ```tasks
> happens on <% moment(fileDate).add(1, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Tuesday
> ```tasks
> happens on <% moment(fileDate).add(2, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Wednesday
> ```tasks
> happens on <% moment(fileDate).add(3, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Thursday
> ```tasks
> happens on <% moment(fileDate).add(4, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Friday
> ```tasks
> happens on <% moment(fileDate).add(5, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Saturday
> ```tasks
> happens on <% moment(fileDate).add(6, 'd').format('YYYY-MM-DD')  %>
> short mode```

> [!Todo] Sunday
> ```tasks
> happens on <% moment(fileDate).add(7, 'd').format('YYYY-MM-DD')  %>
> short mode```

---
## Attention

```toggl
SUMMARY
FROM <% moment(fileDate).format('YYYY-MM-DD')  %> TO <% moment(fileDate).add(7, 'd').format('YYYY-MM-DD')  %>
```
>[!Example]- Entries
> ```toggl
> LIST FROM <% moment(fileDate).format('YYYY-MM-DD')  %> TO <% moment(fileDate).add(7, 'd').format('YYYY-MM-DD')  %>
> GROUP BY PROJECT
> ```
