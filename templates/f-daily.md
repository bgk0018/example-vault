<%*
var fileDate = moment(tp.file.title);
let today = moment(fileDate).format('YYYY-MM-DD');
let prevDay = moment(fileDate).subtract(1, 'd').format('YYYY-MM-DD');
let nextDay = moment(fileDate).add(1, 'd').format('YYYY-MM-DD');
let week = fileDate.format('gggg-[W]ww');
-%>
---
banner: "[[pexels-eberhardgross-640781.webp]]"
tags: [📅]
create-date: "[[<% today %>]]"
before: "[[<% prevDay %>]]"
after: "[[<% nextDay %>]]"
parent: "[[<%  week %>]]"
modified-dates:
append_modified_update: true
---
# Habits

>[!TIP]+ Habits  
>*"Obvious, attractive, easy and satisfying, 1% better"*
>
>| Habit   | Today |
>| ------------- | ------------------ |
>| Network       | (Network::0)       |
>| Reading| (Reading::0)|
>| Protein | (Protein::0)|
>| Weight | (Weight::0)|

>[!EXAMPLE]- Definitions
>- **Network:** Did I reach out to someone intentionally to keep contact
>- **Reading:** Did I read my kindle or reddit in the morning?
>- Protein: I need to hit around 124 to 155 grams a day
>- Weight: Weighing myself to track muscle gain (hopefully)

> [!EXAMPLE]- Review  
> ![[Habits]]

# Journal


