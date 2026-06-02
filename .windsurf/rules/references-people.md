---
trigger: glob
globs: references/people/**
---
# People (`references/people/`)

### People-Specific Properties

| Property | Format | Required | Description |
|----------|--------|----------|-------------|
| `name:` | string | **Yes** | Full display name of the person. |

### Frontmatter Example
```yaml
banner: "[[f-person-20250109114009371.webp]]"
tags: [🙂]
create-date: "[[YYYY-MM-DD]]"
name: Full Name
append_modified_update: true
modified-dates:
related:
```

### Body
- `# Full Name`
- Meetings dataview query (from `#👥` notes with matching `attendees`)
- `## Tasks` — birthday reminders, LinkedIn connection tasks
- `## Notes`, `## Related`

### Template: `templates/f-person.md`
