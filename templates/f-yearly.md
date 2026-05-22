<%*  
var fileDate = moment(tp.file.title, "YYYY");  
let today = moment(fileDate).format('YYYY-MM-DD');  
let Year = moment(fileDate).format('YYYY');

let before = moment(fileDate).subtract(1, 'y').format('YYYY');  
let after = moment(fileDate).add(1, 'y').format('YYYY');  

let next = moment(fileDate);
let list = "[";
for(let i=0; i< 4; i++){  
	list += "\"[["+ next.format('YYYY-[Q]Q') + "]]\","; 
	next = next.add(3, 'M');
}
list = list.slice(0, -1) + "]";
-%>
---
banner: "[[pexels-pixabay-33109.webp]]"
tags: [📅]
create-date: "[[<% today %>]]"
before: "[[<% before %>]]"  
after: "[[<% after %>]]"  
children: <% list %>  
modified-dates:
append_modified_update: true
---
# <% Year %> Review

