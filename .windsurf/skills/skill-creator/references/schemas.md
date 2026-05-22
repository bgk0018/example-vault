# JSON Schemas

This document defines the JSON schemas used by skill-creator.

---

## evals.json
Defines the evals for a skill. Located at `evals/evals.json` within the skill directory.

```json
{
  "skill_name": "example-skill",
  "evals": [
    {
      "id": 1,
      "prompt": "User's example prompt",
      "expected_output": "Description of expected result",
      "files": ["evals/files/sample1.pdf"],
      "expectations": [
        "The output includes X",
        "The skill used script Y"
      ]
    }
  ]
}
```

**Fields:**
- `skill_name`: Name matching the skill's frontmatter
- `evals[].id`: Unique integer identifier
- `evals[].prompt`: The task to execute
- `evals[].expected_output`: Human-readable description of success
- `evals[].files`: Optional list of input file paths (relative to skill root)
- `evals[].expectations`: List of verifiable statements

---

## grading.json
Output from inline grading. Located at `<run-dir>/grading.json`.

```json
{
  "expectations": [
    {
      "text": "The output includes the name 'John Smith'",
      "passed": true,
      "evidence": "Found in output file line 3: 'Contact: John Smith'"
    },
    {
      "text": "The spreadsheet has a SUM formula in cell B10",
      "passed": false,
      "evidence": "No spreadsheet was created. The output was a text file."
    }
  ],
  "summary": {
    "passed": 2,
    "failed": 1,
    "total": 3,
    "pass_rate": 0.67
  },
  "eval_feedback": {
    "suggestions": [
      {
        "assertion": "The output includes the name 'John Smith'",
        "reason": "A hallucinated document that mentions the name would also pass — consider checking it appears as the primary contact with matching phone and email from the input"
      },
      {
        "reason": "No assertion checks whether the extracted phone numbers match the input — incorrect numbers in the output went uncaught"
      }
    ],
    "overall": "Assertions check presence but not correctness. Consider adding content verification."
  }
}
```

**Fields:**
- `expectations[]`: Graded expectations with evidence
  - `text`: The original expectation text
  - `passed`: Boolean — true if expectation passes
  - `evidence`: Specific quote or description supporting the verdict
- `summary`: Aggregate pass/fail counts
  - `passed`: Count of passed expectations
  - `failed`: Count of failed expectations
  - `total`: Total expectations evaluated
  - `pass_rate`: Fraction passed (0.0 to 1.0)
- `eval_feedback`: (optional) Improvement suggestions for the evals, only present when issues worth raising are identified
  - `suggestions`: List of concrete suggestions, each with a `reason` and optionally an `assertion` it relates to
  - `overall`: Brief assessment — can be "No suggestions, evals look solid" if nothing to flag

---

## history.json
Tracks version progression across iterations. Located at workspace root.

```json
{
  "started_at": "2026-01-15T10:30:00Z",
  "skill_name": "my-skill",
  "current_best": "iteration-2",
  "iterations": [
    {
      "version": "iteration-1",
      "parent": null,
      "expectation_pass_rate": 0.65,
      "result": "baseline"
    },
    {
      "version": "iteration-2",
      "parent": "iteration-1",
      "expectation_pass_rate": 0.85,
      "result": "improved",
      "is_current_best": true
    }
  ]
}
```

**Fields:**
- `started_at`: ISO timestamp of when improvement started
- `skill_name`: Name of the skill being improved
- `current_best`: Version identifier of the best performer
- `iterations[].version`: Version identifier
- `iterations[].parent`: Parent version this was derived from
- `iterations[].expectation_pass_rate`: Pass rate from grading
- `iterations[].result`: "baseline", "improved", "regressed", or "unchanged"
- `iterations[].is_current_best`: Whether this is the current best version
