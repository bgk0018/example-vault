# References

The references folder is the vault's **personal library** — a catalog of everything you've read, watched, listened to, and encountered in the outside world. It corresponds to the Resources category in Tiago Forte's PARA framework.

## Philosophy

In a zettelkasten workflow, references serve a critical upstream role. As Sönke Ahrens describes, the process flows from source → highlights → literature notes. The reference note is the **bibliographic anchor** — it tells you *where* an idea came from so your zettelkasten notes can trace provenance.

The two-layer approach (reference + highlight → zettelkasten) mirrors what Mortimer Adler describes in *How to Read a Book*: the difference between *understanding what the author said* and *deciding what you think about it*.

## Subfolder Structure

| Subfolder | Tag | What lives here |
|-----------|-----|----------------|
| `books/` | 📕 | Book references with cover, metadata, Dataview concept queries |
| `articles/` | 📰 | Web articles, research papers |
| `highlights/` | ✂️ | Clippings from sources, with `^ref-` block IDs for citation |
| `people/` | 🙂 | Contact notes with meeting queries and birthday tasks |
| `locations/` | 📌 | Places with GPS coordinates and map views |
| `videos/` | 🎥 | YouTube, talks, lectures |
| `classes/` | 🎓 | Courses and workshops |
| `podcasts/` | 🎧 | Podcast episodes |
| `games/` | 🎮 | Games |
| `movies/` | 🎬 | Films |
| `music/` | 🎹 | Albums, songs |
| `organizations/` | 🏢 | Companies, institutions |
| `series/` | 📺 | TV series |
| `recipes/` | 🍽️ | Recipes |

## Key Conventions

- **Highlights** use `>[!QUOTE]` callout format with `^ref-` block IDs that zettelkasten notes cite via footnotes
- **Books** have a `status:` field (`todo`, `reading`, `done`) and a Dataview query showing concepts extracted from them
- **People** have automatic meeting queries and birthday reminder tasks
- References rarely change after creation — they're anchors, not living documents

## Associated Workflows

- **`/process-inbox`** — Raw captures in `inbox/` are often filed here as reference notes
- **`/garden plant`** — References are the starting point for planting sessions

## Example Notes in This Vault

- **Endure - Alex Hutchinson** (📕) — Completed book with summary and concept query
- **Why We Sleep - Matthew Walker** (📕) — In-progress book
- **Endure Highlights** (✂️) — Highlights with `^ref-` block IDs, cited by zettelkasten notes
- **The Science of Muscle Hypertrophy** (📰) — Article reference
- **Dr. Sarah Chen** (🙂) — Person note with meeting query
- **Science of Endurance** (🎥) — Video reference with transcript snippet and Concepts dataview query
- **Lakewood Running Trail** (📌) — Location with GPS coordinates, mapview block, and Activities query
