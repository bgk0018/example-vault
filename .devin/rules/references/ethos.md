# Vault Ethos — Philosophical Grounding

This file collects the philosophical rationale behind each folder's conventions. Read a section when you need to understand *why* a convention exists — the folder rules themselves contain only *what* to do.

---

## Archive

The archive is the **cold storage** layer of **Tiago Forte's** PARA system. Forte's key distinction is between *active* and *inactive* — the archive exists so that `projects/` stays lean and focused on current work, while nothing is ever truly lost.

As **David Allen** writes in *Getting Things Done*, a trusted system must handle not just what you're doing now, but what you've already done. The archive provides that closure: when a project reaches its natural end, you triage its contents — reusable knowledge moves to `zettelkasten/` or `garden/`, and the rest is preserved here with its original folder structure intact. The `end-date` and `ended-as` properties provide a clean record of *when* and *how* each project concluded.

Key principles: read-only by default, structure preserved, organized by year.

---

## Blog / Digital Garden

The blog folder implements a **digital garden** — a concept popularized by **Mike Caulfield** and expanded by **Maggie Appleton**, **Andy Matuschak**, and others. Unlike a traditional blog (reverse-chronological, polished, finished), a digital garden is a public workspace where ideas grow over time. Notes are published at varying stages of maturity, interlinked, and revisited.

**Matuschak's** concept of *evergreen notes* informs the approach: published zettelkasten notes and maps are living documents that evolve as understanding deepens, not static posts frozen on a publication date. **Appleton's** *A Brief History & Ethos of the Digital Garden* frames gardens as spaces for "learning in public" — sharing not just conclusions but the thinking that led to them.

Key principles: selective transparency (`dg-publish`), navigation-first (index pages, pinned sidebar), articles as finished pieces, the garden grows from the vault (not a parallel effort).

---

## Garden

The garden is the vault's **nursery and workshop bench** — a place for original thinking that doesn't yet have a home in a project or a zettelkasten note. It bridges the gap between fleeting inspiration and structured output.

This folder draws on the idea of **"intermediate packets"** from **Tiago Forte's** *Building a Second Brain*: reusable units of creative work that have value on their own, independent of any particular project. An idea note, a talk abstract, a brainstorm, a code snippet — each is a discrete creation that may feed into a future project, get promoted to a blog article, or simply stand on its own as a record of your thinking.

It also reflects the zettelkasten principle of separating **your ideas** from **other people's ideas**. As **Sönke Ahrens** emphasizes, the whole point of a literature note is to distinguish the author's thought from your own. References hold what others said; the zettelkasten holds your distilled understanding of those ideas; and the garden holds your *original* output — ideas, stories, talks, and writings that originated with you, not from a source.

Key principles: original (not derived), orphaned by design, maturity pipeline (🌱→🌿→🌳), free-form by nature.

---

## Inbox

The inbox is a direct implementation of **David Allen's** GTD **collection bucket** — the single trusted place where new inputs land before they are processed. Allen's foundational rule is simple: *capture everything, clarify later*. If something catches your attention — an article, a video, a half-formed thought — it goes in the inbox immediately, without worrying about where it ultimately belongs.

**Tiago Forte** reinforces this in *Building a Second Brain* with the concept of "capture" as the first step of his CODE framework (Capture → Organize → Distill → Express). The inbox is where CODE begins — raw material enters the system here before being organized into `references/`, `zettelkasten/`, `projects/`, or `garden/`.

Key principles: zero friction capture, transient by design, empty is the goal.

---

## Journal

The journal is the **time axis** of the vault — a structured record of what happened, what you did, and how your habits are tracking. While the zettelkasten captures ideas and projects capture goals, the journal captures *the lived experience of your days*.

This system draws on several traditions:

- **Periodic review** from **David Allen's** *Getting Things Done* — Allen insists on the Weekly Review as the backbone of a trusted system. The journal hierarchy (daily → weekly → monthly → quarterly → yearly) provides natural checkpoints for reflection at every scale.
- **Habit tracking** inspired by **James Clear's** *Atomic Habits* — Clear's argument is that you don't rise to the level of your goals; you fall to the level of your systems. The daily Habits table makes the invisible visible.
- **Reflective practice** from **Cal Newport's** *Deep Work* and time-blocking philosophy — the `toggl` code blocks in daily notes render time-tracking summaries, providing an honest accounting of where attention actually went versus where you intended it to go.

Key principles: automatic creation, hierarchy as zoom, tracking (not narrating).

---

## Maps of Content

Maps of Content are drawn from **Nick Milo's** *Linking Your Thinking* (LYT) framework. Milo's core argument is that a flat pile of notes — no matter how well-written — becomes unusable at scale. You need **navigational layers** that sit above the notes themselves, providing context and orientation without imposing a rigid hierarchy.

A MOC is not a folder, a tag, or a table of contents. It is a **thinking tool** — a note that gathers related ideas in one place so you can see patterns, spot gaps, and decide what to explore next. As Milo puts it, MOCs let you "develop ideas at a higher level" by creating a space where notes can talk to each other.

Key principles: emergent (not imposed), entry points (not containers), queryable structure (Dataview-driven), public by default.

---

## Areas

Areas implement **Tiago Forte's** PARA concept of **Areas of Responsibility** — ongoing commitments with no natural end date. Forte's key distinction: projects end, areas don't. "Health" is an area; "Run a marathon" is a project within it. "Career Development" is an area; "Get promoted to Senior Engineer" is a project within it.

**David Allen** describes the same concept at the **20,000-foot horizon** in *Getting Things Done* (ch. 9, "Horizons of Focus"): areas of focus and accountability that frame your projects. Allen's weekly review checks not just project next actions but whether your areas of responsibility are covered.

The **three-part project test** gates what belongs in `projects/` vs `areas/`: Does it have a (1) finite outcome, (2) multiple steps, and (3) foreseeable time horizon? If all three → project. If it's an ongoing responsibility → area.

Area files are **accountability dashboards** — they surface projects, meetings, and tasks via Dataview queries. They are NOT knowledge indexes; that role belongs to Maps of Content. Maps are the **convergence point** where all note types (areas, projects, zettelkasten, garden) meet for a topic, making imbalance visible. A topic can have both an area (accountability) and a map (knowledge convergence).

Key principles: ongoing (not finite), accountability (not just interest), flat structure (no topic nesting — sole exception is person-management relationship folders), contains projects, reviewed at a different cadence than projects (horizon scan vs staleness check).

---

## Projects

This folder implements a hybrid of **David Allen's** *Getting Things Done* (GTD) and **Tiago Forte's** *Building a Second Brain* (PARA) methodologies. Projects are **finite outcomes** — they pass the three-part test (finite + multi-step + time-bounded). Areas of Responsibility live separately in `areas/`.

From **GTD** comes the discipline of *externalizing commitments*. Allen's central insight is that your mind is for having ideas, not holding them — every open loop needs a trusted place outside your head. Allen defines a project as *any outcome requiring more than one action step*. Allen's **Natural Planning Model** (*Getting Things Done*, ch. 3) maps directly to the project file's body structure: Purpose → Objective, Outcome Visioning → Metrics, Brainstorming → Brainstorm, Organizing → Execution, Next Actions → TaskNotes.

From **PARA** comes the organizational structure. Forte defines a project as "a series of tasks linked to a goal, with a deadline." The `projects/` folder holds only **active** work with a defined finish line.

As **Stephen Covey** writes in *The 7 Habits of Highly Effective People* (Habit 2: "Begin with the end in mind"), the Objective section forces you to define done before you start.

Key principles: project = finite outcome + tasks, capture at the source, regular review, next actions (not vague intentions), knowledge extraction, Socratic LLM companion.

---

## References

The references folder is the vault's **personal library** — a catalog of everything you've read, watched, listened to, and encountered in the outside world. It corresponds to the **Resources** category in **Tiago Forte's** PARA framework.

In a zettelkasten workflow, references serve a critical upstream role. As **Sönke Ahrens** describes in *How to Take Smart Notes*, the process flows from source → highlights → literature notes. The reference note is the **bibliographic anchor** — it tells you *where* an idea came from so your zettelkasten notes can trace provenance.

This two-layer approach (reference + highlight → zettelkasten) mirrors what **Mortimer Adler** and **Charles Van Doren** describe in *How to Read a Book*: the difference between *understanding what the author said* (the reference and its highlights) and *deciding what you think about it* (the zettelkasten note).

Key principles: external (not original), typed subfolders, highlights as first-class layer, people as nodes.

---

## Templates

Templates are the vault's **constitution** — the canonical definitions of how every note type is structured, named, and placed. They encode the conventions described in every other rule file into executable blueprints.

This reflects a principle from **Tiago Forte's** *Building a Second Brain*: reduce friction to near zero. It also supports **David Allen's** GTD tenet that a trusted system must be *consistent*.

Key principles: source of truth, friction reduction, convention propagation.

---

## Views (dissolving into vertical slices)

The views folder was the vault's **control room** — dashboards, queries, and widgets surfacing information from across the vault. It is being dissolved: each `.base` and query file moves to the domain folder it serves, following the **vertical slice** principle — everything a domain needs to function lives together.

This reflects a core principle of both **Tiago Forte's** PARA system and **David Allen's** GTD: your trusted system must give you the *right view at the right time*. Co-locating views with content means you find the dashboard by opening the domain folder, not by remembering a separate `views/` location.

Key principles: configuration (not content), co-located with domain, embedded by design.

---

## Zettelkasten

The zettelkasten ("slip box") method was pioneered by the German sociologist **Niklas Luhmann**, who used it to produce over 70 books and 400 articles across disciplines. The core insight — explained in depth by **Sönke Ahrens** in *How to Take Smart Notes* — is that lasting understanding comes not from collecting information, but from **rewriting ideas in your own words** and **linking them to what you already know**.

Key principles: atomicity (one idea per note), elaboration over collection, linking as thinking (Idea Compass: North → `parent:`, West → `related:`, East → `challenges:`), emergence over planning, two note types (📖 literature + ❓ question), update in place.
