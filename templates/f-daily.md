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

# Workout

| Exercise | Type | Sets×Reps | Weight | Failure |
| -------- | ---- | --------- | ------ | ------- |

> [!INFO]- Exercise & Type Cheat Sheet
> **Types:** ME = Max Effort · DE = Dynamic Effort · VD = Volume Day · IN = Intensity
>
> | Lift | Variations | Types |
> | ---- | ---------- | ----- |
> | Squat | Conventional, Box, Pin | ME, DE (Conv only), VD |
> | Deadlift | Conventional, Paused, Snatch Grip, Deficit | ME, DE (Conv only), VD |
> | Bench Press | Conventional, Close Grip, Paused, Pin | ME, DE (Conv only), VD |
> | Overhead Press | Conventional, Pin | ME, IN, VD |
> | Accessories | Chin Ups, Dips, Bent Over Rows | VD only |

> [!TIP]- Weight & Rep Calculator
> **ME (Max Effort)** — 4-7 min rest
> - 1×1 work up to max, then 3×3 @ 80% of variation ME
>
> **DE (Dynamic Effort)** — 60-90 sec rest
> - Bench: 10×3 @ 65% of ME
> - Deadlift: 6×2 @ 75% of ME
> - Squat: waves — 12×2 @ 60%, 10×2 @ 65%, 8×2 @ 70%
>
> **VD (Volume Day)** — 4-6 min rest
> - Bench: 3×5 @ 70% of variation ME
> - Deadlift: 2×5 @ 70% of variation ME
> - Squat: 4×4 @ 75% of variation ME
> - OHP: 5×5 @ 70% of variation ME
>
> **IN (Intensity, OHP only)** — 2 min rest
> - Conventional: 10×1 @ 85% of ME
> - Pin: 5×1 @ 85% of ME

