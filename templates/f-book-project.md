<%*  
	const _args = window._templater_args || {};
	delete window._templater_args;
	let project = _args.name || (await tp.system.prompt("Name"));  
	let filename = project + " Book Project";  
	await tp.file.rename(filename);

	const directoryPath = "projects/" + project
	if (!(await this.app.vault.adapter.exists(directoryPath))) {
		await this.app.vault.createFolder(directoryPath)
	}
	await tp.file.move(directoryPath + '/' + filename)

	// Create a tasks folder for TaskNotes-style task notes
	const tasksDirPath = directoryPath + '/tasks'
	if (!(await this.app.vault.adapter.exists(tasksDirPath))) {
		await this.app.vault.createFolder(tasksDirPath)
	}

	// Helper to create a TaskNotes note if it does not exist
	const ensureTaskNote = async (taskTitle) => {
		const filePath = `${tasksDirPath}/${taskTitle}.md`
		if (await this.app.vault.adapter.exists(filePath)) {
			return
		}
		const today = tp.date.now("YYYY-MM-DD")
		const nowIso = new Date().toISOString()
		const content = `---\naliases: []\nappend_modified_update: true\ncontexts: []\ncreate-date: "[[${today}]]"\ndateCreated: ${nowIso}\ndateModified: ${nowIso}\ndue: ${today}\nmodified-dates:\n  - "[[${today}]]"\npriority: normal\nprojects:\n  - "[[${filename}]]"\nrelated:\nscheduled: ${today}\nstatus: todo\ntags:\n  - \u{1F4CB}\n---\n`
		await this.app.vault.create(filePath, content)
	}

	// Seed book project tasks as separate TaskNotes
	await ensureTaskNote('Inspectional reading')
	await ensureTaskNote('Read book')
	await ensureTaskNote('Write chapter notes')
	await ensureTaskNote('Generate highlights')
	await ensureTaskNote('Distill into zettelkasten')
-%>
---
banner: "[[pexels-catcaryn-938165.webp]]"
aliases: []
tags: [🚧]
create-date: "[[<% tp.date.now() %>]]"
start-date: "[[<% tp.date.now() %>]]"
end-date: 
ended-as:
parent:
modified-dates:
append_modified_update: true
related:
---
# Objective

Read and take notes on the book so that I can add it to my note collection and generate learning exhaust from it.

# Process

Inspired by [[How to Read a Book - Mortimer J Adler Charles Van Doren|How to Read a Book]] — Adler's four levels of reading.

## Level 1 — Inspectional Reading

Before committing to a deep read, get the lay of the land:

- [ ] Skim the table of contents, preface, and chapter summaries
- [ ] Read the first and last chapter
- [ ] Note the book's structure — how many parts, what arc does it follow?
- [ ] Answer: **What is this book about as a whole?** (one sentence)

> [!NOTE]- Unity of the book
> *Write your one-sentence summary here after inspectional reading.*

> [!NOTE]- Structure
> *Outline the major parts and how they relate to each other.*

## Level 2 — Analytical Reading (per chapter)

For each chapter:
1. **Read** — Read the chapter, note key words and ideas
2. **Write** — Write a chapter review in my own words, composing those ideas together
3. **Highlight** — Revisit the chapter and highlight concepts related to what I wrote
4. **Reference** — Generate the highlights document and reference them in the book report
5. **Distill** — When the book report is complete, process everything into zettelkasten notes

> [!question]- Analytical questions to answer as you read
> - What is being said in detail? What are the propositions and arguments?
> - What are the author's key terms? Come to terms with the author.
> - Is it true, in whole or in part?
> - What of it? What follows from understanding this?

## Level 3 — Syntopical Reading (optional)

After completing the book, connect it to other works on the same topics:
- What do other authors say about the same problems?
- Where do they agree or disagree?
- What new questions emerge from comparing sources?

# Metrics

- [ ] Inspectional reading complete
- [ ] Read Book (analytical, chapter-by-chapter)
- [ ] Write Notes (chapter-by-chapter book report)
- [ ] Generate Highlights
- [ ] Create From It (zettelkasten notes with provenance)

# Execution

- [[projects/<% project %>/tasks/Inspectional reading]]
- [[projects/<% project %>/tasks/Read book]]
- [[projects/<% project %>/tasks/Write chapter notes]]
- [[projects/<% project %>/tasks/Generate highlights]]
- [[projects/<% project %>/tasks/Distill into zettelkasten]]

# Result
> What was the result of this work?

