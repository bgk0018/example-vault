<%*  
var fileDate = moment(tp.file.title, "YYYY-[Q]Q");  
let today = moment(fileDate).format('YYYY-MM-DD');  
let Quarter = moment(fileDate).format('YYYY-[Q]Q');  
let year = moment(fileDate).format('YYYY');
  
let nextQuarter = moment(fileDate).add(1, 'Q').format('YYYY-[Q]Q');  
let prevQuarter = moment(fileDate).subtract(1, 'Q').format('YYYY-[Q]Q');  

let next = moment(fileDate);
let monthList = "[";
let monthEnd = ((moment(fileDate).quarter() - 1) * 3)
console.log("monthEnd:" + monthEnd)
for(let i=monthEnd; i<3+monthEnd; i++){  
	monthList += "\"[["+ next.format('YYYY-MM') + "]]\","; 
	console.log("monthList:" + monthList)
	next = next.add(1, 'M');
}
monthList = monthList.slice(0, -1) + "]";
-%>
---
banner: "[[f-quarterly.webp]]"
tags: [📅]
create-date: "[[<% today %>]]"
parent: "[[<% year %>]]"  
before: "[[<% prevQuarter %>]]"  
after: "[[<% nextQuarter %>]]"  
children: <% monthList %>  
modified-dates:
append_modified_update: true
---
# <% Quarter %> Review

 
