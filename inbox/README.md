# Inbox

The inbox is the vault's **capture bucket** — a direct implementation of David Allen's GTD collection principle. Everything starts here: articles, half-formed thoughts, links, quick captures from mobile. The only rule is *capture everything, clarify later*.

## Purpose

Zero-friction capture. When something catches your attention, it goes in the inbox immediately, without worrying about where it ultimately belongs. The inbox is transient by design — empty is the goal.

## What Lives Here

Anything that hasn't been processed yet. Inbox items typically have:
- No frontmatter (or minimal frontmatter)
- No tags
- Raw text, URLs, copy-pasted content

## Processing

Use the **`/process-inbox`** workflow to triage items one at a time:

1. Read each item
2. Decide what it is (reference, concept, idea, task, or trash)
3. Create the proper note with correct frontmatter and tags
4. Move it to the right folder
5. Delete the inbox item

### Where items go after processing

| If it's... | Move to | Tag |
|------------|---------|-----|
| A reference (article, book, video) | `references/<type>/` | 📰, 📕, 🎥, etc. |
| Highlights from a source | `references/highlights/` | ✂️ |
| A concept in your own words | `zettelkasten/` | 📖 |
| A question or line of inquiry | `zettelkasten/` | ❓ |
| An original idea | `garden/` | 🌱 |
| Related to an active project | `projects/<project>/` | varies |
| Not worth keeping | Delete it | — |

## Example Items in This Vault

- **Inbox.md** — Quick-capture scratch pad for rapid dumps (processed later)
- **Interesting article on zone 2 training.md** — Raw capture that should become a reference article
- **Thought about periodization for beginners.md** — Half-formed idea that could become a 📖 or 🌱
