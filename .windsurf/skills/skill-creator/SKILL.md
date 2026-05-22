---
name: skill-creator
description: Create new Windsurf skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit or optimize an existing skill, run test cases to verify a skill, or iterate on a skill's quality. Also use when the user says "turn this into a skill" or wants to capture a workflow as a reusable skill.
---

# Skill Creator

A skill for creating new Windsurf skills and iteratively improving them.

At a high level, the process of creating a skill goes like this:

- Decide what you want the skill to do and roughly how it should do it
- Write a draft of the skill
- Create a few test prompts and run-through them inline (reading the skill, then following its instructions to accomplish each prompt)
- Help the user evaluate the results qualitatively
- Rewrite the skill based on feedback from the user's evaluation
- Repeat until satisfied

Your job when using this skill is to figure out where the user is in this process and then jump in and help them progress through these stages. For instance, maybe they say "I want to make a skill for X". You can help narrow down what they mean, write a draft, write the test cases, run through them, and iterate.

On the other hand, maybe they already have a draft of the skill. In this case you can go straight to the test/iterate part of the loop.

Always be flexible — if the user says "I don't need to run a bunch of tests, just vibe with me", do that instead.

## Communicating with the user

Pay attention to context cues to understand how to phrase your communication. In the default case:

- "evaluation" and "benchmark" are borderline, but OK
- for "JSON" and "assertion" you want to see cues that the user knows what those things are before using them without explaining

It's OK to briefly explain terms if you're in doubt.

---

## Creating a skill

### Capture Intent
Start by understanding the user's intent. The current conversation might already contain a workflow the user wants to capture (e.g., they say "turn this into a skill"). If so, extract answers from the conversation history first — the tools used, the sequence of steps, corrections the user made, input/output formats observed. The user may need to fill the gaps, and should confirm before proceeding.

1. What should this skill enable Cascade to do?
2. When should this skill trigger? (what user phrases/contexts)
3. What's the expected output format?
4. Should we set up test cases to verify the skill works? Skills with objectively verifiable outputs (file transforms, data extraction, code generation, fixed workflow steps) benefit from test cases. Skills with subjective outputs (writing style, art) often don't need them. Suggest the appropriate default based on the skill type, but let the user decide.

### Interview and Research
Proactively ask questions about edge cases, input/output formats, example files, success criteria, and dependencies. Wait to write test prompts until you've got this part ironed out.

Come prepared with context to reduce burden on the user.

### Write the SKILL.md
Based on the user interview, fill in these components:

- **name**: Skill identifier (lowercase, hyphenated)
- **description**: When to trigger, what it does. This is the primary triggering mechanism — include both what the skill does AND specific contexts for when to use it. All "when to use" info goes here, not in the body. Make descriptions a little bit "pushy" to combat undertriggering. For instance, instead of "How to build a dashboard to display data.", write "How to build a dashboard to display data. Use this skill whenever the user mentions dashboards, data visualization, metrics, or wants to display any kind of data, even if they don't explicitly ask for a 'dashboard.'"
- **the rest of the skill instructions**

### Skill Writing Guide

#### Anatomy of a Windsurf Skill

```
.windsurf/skills/skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter (name, description required)
│   └── Markdown instructions
└── Bundled Resources (optional)
    ├── scripts/    - Executable code for deterministic/repetitive tasks
    └── references/ - Docs loaded into context as needed
```

#### Progressive Disclosure

Skills use a three-level loading system:
1. **Metadata** (name + description) — Always in context (~100 words)
2. **SKILL.md body** — In context whenever skill triggers (<500 lines ideal)
3. **Bundled resources** — Read as needed (unlimited, scripts can execute without loading)

**Key patterns:**
- Keep SKILL.md under 500 lines; if approaching this limit, split into reference files with clear pointers about when to read them
- Reference files clearly from SKILL.md with guidance on when to read them
- For large reference files (>300 lines), include a table of contents

**Domain organization**: When a skill supports multiple domains/frameworks, organize by variant:
```
cloud-deploy/
├── SKILL.md (workflow + selection)
└── references/
    ├── aws.md
    ├── gcp.md
    └── azure.md
```
Cascade reads only the relevant reference file.

#### Principle of Lack of Surprise

Skills must not contain malware, exploit code, or any content that could compromise system security. A skill's contents should not surprise the user in their intent if described.

#### Writing Patterns

Prefer using the imperative form in instructions.

**Defining output formats:**
```markdown
## Report structure
ALWAYS use this exact template:
# [Title]
## Executive summary
## Key findings
## Recommendations
```

**Examples pattern:**
```markdown
## Commit message format
**Example 1:**
Input: Added user authentication with JWT tokens
Output: feat(auth): implement JWT-based authentication
```

### Writing Style
Explain to the model why things are important in lieu of heavy-handed MUSTs. Use theory of mind and try to make the skill general, not narrow to specific examples. Start by writing a draft, then look at it with fresh eyes and improve it.

### Test Cases
After writing the skill draft, come up with 2–3 realistic test prompts — the kind of thing a real user would actually say. Share them with the user: "Here are a few test cases I'd like to try. Do these look right, or do you want to add more?"

Save test cases to `evals/evals.json` in the skill directory:

```json
{
  "skill_name": "example-skill",
  "evals": [
    {
      "id": 1,
      "prompt": "User's task prompt",
      "expected_output": "Description of expected result",
      "files": []
    }
  ]
}
```

See `references/schemas.md` for the full schema (including the `expectations` field, which you'll add after the first test run).

---

## Running and evaluating test cases

Since Windsurf doesn't have subagents, test inline: for each test case, read the skill's SKILL.md, then follow its instructions to accomplish the test prompt yourself. Do them one at a time.

This is less rigorous than independent agents (you wrote the skill and you're also running it, so you have full context), but it's a useful sanity check — and the human review step compensates.

### Step 1: Run each test case

For each eval in `evals/evals.json`:
1. Read the skill's SKILL.md
2. Follow its instructions to accomplish the eval prompt
3. Save outputs to a workspace directory: `<skill-name>-workspace/iteration-<N>/eval-<ID>/outputs/`
4. Note any issues, edge cases, or places where the skill's instructions were unclear

### Step 2: Draft expectations

After running the first test case (or while thinking about results), draft quantitative expectations for each test case. Good expectations are objectively verifiable and have descriptive names.

Subjective skills (writing style, design quality) are better evaluated qualitatively — don't force expectations onto things that need human judgment.

Update `evals/evals.json` with the expectations:

```json
{
  "id": 1,
  "prompt": "User's task prompt",
  "expected_output": "Description of expected result",
  "files": [],
  "expectations": [
    "The output includes X",
    "The skill used approach Y",
    "The file contains valid JSON"
  ]
}
```

### Step 3: Present results to the user

For each test case, present:
- **Prompt**: the task that was given
- **Output**: what was produced (show file contents inline where practical)
- **Self-assessment**: which expectations passed/failed and why
- **Issues noticed**: anything the skill's instructions didn't handle well

Ask for feedback: "How does this look? Anything you'd change?"

### Step 4: Grade and summarize

After presenting all results, create a simple `grading.json` in the iteration directory:

```json
{
  "expectations": [
    {
      "text": "The output includes X",
      "passed": true,
      "evidence": "Found X in the output file at line 12"
    }
  ],
  "summary": {
    "passed": 2,
    "failed": 1,
    "total": 3,
    "pass_rate": 0.67
  }
}
```

---

## Improving the skill

This is the heart of the loop. You've run the test cases, the user has reviewed the results, and now you need to make the skill better based on their feedback.

### How to think about improvements

1. **Generalize from the feedback.** You're trying to create skills that can be used many times across many different prompts. Here you and the user are iterating on only a few examples because it's quick for them to assess new outputs. But if the skill works only for those examples, it's useless. Rather than put in fiddly overfitty changes or oppressively constrictive MUSTs, if there's some stubborn issue, try branching out and using different metaphors or recommending different patterns.

2. **Keep the prompt lean.** Remove things that aren't pulling their weight. If it looks like the skill is making the model waste time doing unproductive things, try getting rid of those parts and see what happens.

3. **Explain the why.** Try hard to explain the **why** behind everything you're asking the model to do. Today's LLMs are *smart*. They have good theory of mind and when given a good harness can go beyond rote instructions. Even if the feedback from the user is terse, try to actually understand the task and why the user wrote what they wrote, and then transmit this understanding into the instructions. If you find yourself writing ALWAYS or NEVER in all caps, or using super rigid structures, that's a yellow flag — reframe and explain the reasoning so the model understands why it's important.

4. **Look for repeated work across test cases.** Notice if you independently took the same multi-step approach across test cases. If all test cases resulted in writing a similar helper script or taking the same approach, that's a strong signal the skill should bundle that script. Write it once, put it in `scripts/`, and tell the skill to use it.

Take your time and really mull things over. Write a draft revision, then look at it anew and improve it.

### The iteration loop

After improving the skill:

1. Apply your improvements to the skill
2. Rerun all test cases into a new `iteration-<N+1>/` directory
3. Present results to the user with comparison to previous iteration
4. Ask for feedback
5. Improve again, repeat

Keep going until:
- The user says they're happy
- The feedback is all positive (everything looks good)
- You're not making meaningful progress

---

## Windsurf-specific guidance

### Skill location
Skills live in `.windsurf/skills/<skill-name>/SKILL.md`. The directory name should match the `name:` field in frontmatter.

### Triggering
Windsurf loads skill metadata (name + description) and uses it to decide when to invoke a skill. The `description:` field is the primary triggering mechanism. Write it to be comprehensive about when the skill should fire.

### Pointer rules (optional)
For skills that should trigger on specific file types, create a pointer rule in `.windsurf/rules/`:

```markdown
---
trigger: glob
globs: **/*.ext
---
When working with `.ext` files, invoke the `@skill-name` skill for [purpose].
```

This ensures the skill triggers when the user opens or edits matching files.

### No subagents
Windsurf doesn't support spawning subagent tasks. All testing is done inline — you read the skill, follow its instructions, and present results directly in the conversation.

### No CLI-based optimization
Description optimization scripts that require `claude -p` are not available in Windsurf. Instead, optimize descriptions manually: think about what queries should and shouldn't trigger the skill, and craft the description to match.

---

## Reference files

The references/ directory has additional documentation:
- `references/schemas.md` — JSON structures for evals.json, grading.json, etc.

---

Core loop summary:

1. Figure out what the skill is about
2. Draft or edit the skill
3. Run test prompts inline (read the skill, follow its instructions)
4. Present results to the user for review
5. Improve the skill based on feedback
6. Repeat until satisfied
