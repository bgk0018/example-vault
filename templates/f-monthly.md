<%*  
var fileDate = moment(tp.file.title);  
let today = moment(fileDate).format('YYYY-MM-DD')  
let quarter = moment(fileDate).format('YYYY-[Q]Q');  
let start = moment(fileDate).format('YYYY-MM-DD');  
let end = moment(fileDate).format("YYYY-MM-") + moment(fileDate).daysInMonth();
  
let nextMonth = moment(fileDate).add(1, 'M').format('YYYY-MM');  
let prevMonth = moment(fileDate).subtract(1, 'M').format('YYYY-MM');  

let next = moment(fileDate);
let weekList = "[";
let weekCount = Math.ceil(next.daysInMonth() / 7);
for(let i=0; i<weekCount; i++){  
	weekList += "\"[["+ next.format('gggg-[W]ww') + "]]\","; 
	next = next.add(1, 'w');
}
weekList = weekList.slice(0, -1) + "]";
-%>
---
banner: "[[f-monthly.webp]]"
tags: [📅]
create-date: "[[<% today %>]]"
parent: "[[<% quarter %>]]"  
before: "[[<% prevMonth %>]]"  
after: "[[<% nextMonth %>]]"  
children: <% weekList %>  
modified-dates:
append_modified_update: true
---
# <% tp.file.title %> Review

