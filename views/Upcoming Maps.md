---
aliases: []
append_modified_update: true
create-date: "[[2025-02-22]]"
dg-publish: true
modified-dates:
  - "[[2025-01-04]]"
  - "[[2025-05-08]]"
  - "[[2026-05-01]]"
related:
tags: []
---

These are high level subjects I'm keeping an eye. They are uncreated notes that are linked to most frequently.

```dataviewjs
// Get all pages
const pages = dv.pages();

// Create a map to store link counts
const linkCounts = new Map();

// Iterate through pages and collect links from 'related' and 'parent' properties
for (let page of pages) {
    // Check both related and parent properties
    if (page.related || page.parent) {
        // Handle related links
        if (page.related) {
            const relatedLinks = Array.isArray(page.related) ? page.related : [page.related];
            for (let link of relatedLinks) {
                if (link) {  // Add null check
                    const linkPath = typeof link === 'string' ? link : (link.path || '');
                    if (linkPath) {  // Make sure we have a valid path
                        const exists = dv.pages('"' + linkPath + '"').length > 0;
                        if (!exists) {
                            linkCounts.set(linkPath, (linkCounts.get(linkPath) || 0) + 1);
                        }
                    }
                }
            }
        }
        
        // Handle parent link
        if (page.parent) {
            const parentPath = typeof page.parent === 'string' ? page.parent : (page.parent.path || '');
            if (parentPath) {  // Make sure we have a valid path
                const exists = dv.pages('"' + parentPath + '"').length > 0;
                if (!exists) {
                    linkCounts.set(parentPath, (linkCounts.get(parentPath) || 0) + 1);
                }
            }
        }
    }
}

// Convert to array, sort by count, and take top 20
const sortedLinks = Array.from(linkCounts.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, 20);

// Create table with markdown links
dv.table(
    ["Uncreated Link", "Reference Count"],
    sortedLinks.map(([link, count]) => [
        link,
        count
    ])
);
```
