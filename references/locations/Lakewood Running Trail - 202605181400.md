---
aliases:
  - Lakewood Running Trail
append_modified_update: true
create-date: "[[2026-05-18]]"
location:
  - -96.8716
  - 32.8407
modified-dates:
  - "[[2026-05-18]]"
  - "[[2026-05-22]]"
parent: "[[Dallas, TX]]"
related:
  - "[[Marathon Training Project]]"
  - "[[Exercise Science]]"
tags:
  - 📌
---

# Summary

A 6.2-mile paved loop trail around White Rock Lake, popular with runners and cyclists. Flat terrain makes it ideal for zone 2 heart rate training. Used for long runs during the [[Marathon Training Project|marathon training]] base-building phase.

## Details

- **Distance:** 6.2-mile loop (full lake circuit is 9.3 miles)
- **Surface:** Paved
- **Elevation gain:** Minimal (~50 ft)
- **Best times:** Early morning before 8am (less crowded, cooler)
- **Facilities:** Water fountains at mile 2 and mile 4, restrooms at the boathouse

```mapview
{"name":"Default",
"mapZoom":14,
"centerLat":32.8407,
"centerLng":-96.8716,
"query":"path:\"$filename$\"",
"chosenMapSource":0}
```

# Activities

```dataview
TABLE WITHOUT ID
	link(file.link, default(aliases[0], file.name)) as "Name",
	create-date as "Date"
FROM #🚧 or #👥
WHERE contains(related, this.file.link) or contains(parent, this.file.link)
SORT create-date DESC
```
