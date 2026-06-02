---
trigger: glob
globs: references`locations`/**
---
# Locations (`references`locations`/`)

### Location-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `location:` | YAML list of `[longitude, latitude]` or `"[[Place Name]]"` | **Yes** | Geographic coordinates or wiki-link to a parent place. Used by the Map View plugin. |

### Frontmatter Example
```yaml
aliases:
append_modified_update: true
create-date: "[[YYYY-MM-DD]]"
location:
  - <longitude>
  - <latitude>
modified-dates:
related: ["[[Trip or Map]]"]
tags: [📌]
```

### Body
- `mapview` code block with map configuration JSON
- `# Activities` — dataview query for related project files

### Template: `templates`f-location`.md`
