---
name: design-that-ships
description: >
  Prototype pipeline for building focused, high-quality prototypes that validate feature assumptions
  through iterative constraint-driven design. Use this skill whenever the user starts prototyping a
  feature, wants to set up a client context repo, or mentions "prototype", "feature", "iteratie",
  "scenario", "edge case", "constraint", "briefing", or "design candidate". Also trigger when the
  user shares a feature request, links to Figma/SharePoint/Azure DevOps, or says something like
  "manager wil feature X" or "we moeten Y bouwen". This skill manages the full flow from challenge
  through iteration to ship-ready deliverable.
---

# Design That Ships

Compressed design process for building prototypes that prove whether a feature works — not just how it looks. Inspired by Nolan Perkins' deploy-first philosophy, sharpened for constraint-driven B2B prototyping where business changes course, tech has limits, and UX must work within platform realities.

## Core Philosophy

**We're the co-driver, not the chauffeur.** When a manager says "we need feature X," the first job isn't building — it's challenging whether X is the right thing to build. Not to be difficult, but because we invest our expertise and want it spent on the right problem.

**Process is compressed, not skipped.** What looks like "just start building" is actually discovery, ideation, and evaluation running in a tight loop. The experience and patterns we've accumulated let us compress the design process into focused iteration cycles. The skill codifies this compressed process so it's repeatable, transferable, and compounds over time.

**Prototypes answer questions.** A good prototype doesn't just show how something works — it reveals whether the assumptions behind it hold up. Edge cases and scenario simulation are the sharpest tools for this.

**The system compounds.** Every feature you build adds patterns to `patterns.md`, constraints to `constraints.md`, and learnings to the knowledge base. Feature 1 is the slowest. By feature 5, patterns do 40% of the thinking. This is what NN/g means by "compressed process" — accumulated knowledge lets you move faster without skipping steps.

---

## Pipeline Overview

```
FEATURE REQUEST
      │
      ▼
CHALLENGE (continuous — not a gate, a mindset)
      │
      ▼
CONSTRAINT MAP (5 min)
      │
      ▼
HYPOTHESES + CONCEPTS (10-15 min)
  "If X, then concept A works. If not, concept B."
  Fork into 2-3 directions when uncertainty is high.
      │
      ▼
VIBECODEN PER CONCEPT (30-40 min per round)
  1. Design Candidate (wireframe + interaction + edge cases)
  2. Code Scaffold (live on Vercel, product style, hardcoded scenarios)
  3. Scenario Simulator (4-6 edge cases, visual + interactive)
      │
      ▼
DECISION (Tech OK? UX OK? Assumption OK?)
  ├─ All pass → SHIP READY
  ├─ Concept wins → Kill/merge others, continue winner
  ├─ Business pivot → Brief Agent updates spec
  ├─ UX friction → UX Agent redesigns → Brief Agent alignment check
  └─ Tech blocker → Tech Agent finds workaround → Brief Agent alignment check
      │
      ▼
KNOWLEDGE CAPTURE (5-10 min)
```

---

## How Each Step Works

### Challenge (continuous)

This isn't a phase you complete and move on from. It's a lens you apply at every step: briefing, iteration, decision. The co-driver challenges always.

When a feature request comes in, ask:

- **"What user problem does this solve?"** Not: what feature does the manager want. Find the problem behind the requested solution.
- **"For whom, primarily?"** One user role. Not "everyone."
- **"What if we don't build this?"** Priority check. If the answer is "not much," question whether this is worth the investment.
- **"What are we assuming?"** Make assumptions explicit: about user behavior, technical feasibility, business value. These become what the prototype tests.

During iteration, challenge continues: "Does this scenario still support the original assumption?" "Is business changing direction based on what we're seeing?" "Is the constraint real or assumed?"

The output of challenging is a sharp briefing — maintained by the Brief Agent as a living document. The Brief Agent's Fast Track Intake (5 mandatory questions) is the structured form of this challenge. The intake happens once to establish the briefing; the challenge mindset continues throughout every iteration.

### Constraint Map (5 min)

Before building, map the playing field. Three axes:

**Tech limits** — What can and can't the current architecture do? Which APIs exist? What's easy vs. hard? What would need to be mocked?

**UX friction** — What platform constraints exist? Desktop vs. mobile? Existing patterns in the product that users expect? Interaction patterns that don't work in this context?

**Business assumptions** — From the challenge step: what are we assuming about user needs, value, and priority? These become testable hypotheses.

**Known patterns** — If `patterns.md` exists for this client: what worked in similar situations? What failed? This is where compound learning pays off.

**Hard boundaries** — Some constraints are not configurable. They're platform-enforced rules that sit above any concept (e.g., "BSN data is only visible to own organization, always"). Separate these from soft constraints early — they apply regardless of which concept you pick.

### Hypotheses + Concepts (10-15 min)

The bridge between understanding the problem and building solutions. This step turns assumptions from the Challenge and constraints from the Constraint Map into testable hypotheses — and each hypothesis gets a concept direction.

**Formulate hypotheses.** Each hypothesis is an assumption that you can test with a prototype. Be specific:
- Bad: "Users need role-based privacy"
- Good: "Admins understand 4 sensitivity levels and can configure 15+ roles in under 5 minutes"
- Good: "Per-category permissions are sufficient — per-field is overkill for v1"
- Good: "Automatic level suggestion based on task type reduces config effort by 80%"

**Fork into concepts when uncertainty is high.** When you don't know which direction works, don't guess — build 2-3 concepts in parallel and compare. Each concept tests a different hypothesis or approaches the same hypothesis differently.

**Variant discipline (non-negotiable).** Each concept must answer a genuinely different design question — not three visual variations on the same idea. Before defining a concept, ask: "What core design tension does this concept represent that the others don't?"

Real tensions to fork on:
- Push information to user vs. user pulls on demand
- System makes the decision vs. user configures the system
- Single linear flow vs. flexible entry points
- Optimize for first-time use vs. power users
- Explicit data input vs. inferred/ambient data

**Meaningfulness test.** Before committing to a concept direction, ask:
- Does this concept have a soul? Could someone use it as a reference?
- Is it meaningfully different from a generic SaaS dashboard in this category?
- If you replaced the logo with a competitor's — would the UI still reveal which product it is?

If all three answers are no, the concept is polished but not meaningful. Push further.

Example from a real project (YIM data privacy):
- Concept A: Shared visibility profiles linked to roles (centralized)
- Concept B: Categories on roles with presets as UX helper (flexible)
- Concept C: Sensitivity levels with automatic derivation (smart defaults)

Not every concept needs to be fully built. Some are wireframes, some are working prototypes. Build enough to validate or kill the hypothesis behind it.

**Track concept status.** The Brief Agent maintains which concepts are alive, merged, or killed:
```markdown
## Concepts
- [ALIVE] Concept A: Sensitivity levels — testing whether admins understand 4 tiers
- [MERGED → A] Concept D: Auto-derivation — merged into A as suggestion engine
- [KILLED] Concept B: Per-field permissions — too complex for admin mental model
```

### Vibecoden: Iteration Cycle (30-40 min per round)

The core. Fast building per concept — one or multiple concepts per round depending on complexity. Three steps:

**1. Design Candidate**
Wireframe + interaction design + edge case definition. Not pixel-perfect, but a clear decision about how the feature works. Define 4-6 scenarios to test, including:
- Happy path
- Missing/incomplete data
- Edge case that breaks assumptions
- Error/recovery state
- Bulk/scale scenario (if relevant)

When creating the design candidate, read `agents/ux-agent.md` for interaction design guidance. The human designer reviews or creates the candidate — AI proposes, human decides.

**2. Code Scaffold**
Live on Vercel. In the product's visual style (from `ui-kit.md`). Hardcoded fixture data for each scenario. Not production code — throwaway. The point is to make it feel real enough that stakeholders react to the interaction, not the aesthetics.

The **Tech Agent** owns the build. See `agents/tech-agent.md` → Step 3 for the full build standards: design tokens (non-negotiable), component strategy, interaction quality standards, European B2B defaults, and scenario switcher requirements.

Deploy first, then talk. Don't wait for polish or documentation.

**3. Scenario Simulator**
All defined edge cases, visually walkable and interactive. The Tech Agent builds a scenario switcher into every prototype (see `agents/tech-agent.md` → Step 3).

This is the most valuable part of the pipeline. It does two things: it tests whether the UX works under real conditions, and it confronts stakeholders with the reality of their assumptions.

A scenario that breaks is not a failure — it's the most valuable insight you can get.

### Decision

**The Brief Agent owns the Decision gate.** It runs the evaluation because it holds the measuring stick: the briefing's hypotheses, success criteria, and scenario history. See `agents/brief-agent.md` → Decision Gate for the full protocol.

The Decision evaluates in this order:

1. **Hypothesis check** — Does the prototype answer the hypotheses? Confirmed / Disproven / Untested.
2. **UX quality checklist** — Run `references/design-checklist.md`. Pass/fail per item. Use MCP for principle identification.
3. **Tech check** — Works within constraints? New blockers?
4. **Severity classification** — P0 (blocker) through P3 (nice to have).

**Routing:**

| Outcome | Action |
|---|---|
| All pass, no P0/P1 | → **SHIP READY** |
| UX fails (P0/P1) | → UX Agent with specific friction + concept affected |
| Tech blocker | → Tech Agent with specific blocker + concept affected |
| Hypothesis disproven | → Brief Agent updates briefing, possibly pivots or forks new concept |
| Concept wins over others | → Kill/merge losing concepts, continue winner |

**Concept-level decisions** — When running multiple concepts, the Decision also determines which survive:
- One concept clearly wins → kill or merge the others, continue with the winner
- Two concepts solve different parts → merge them (like Concept D merging into C in YIM)
- All concepts fail the same assumption → the hypothesis was wrong, go back to Hypotheses step
- No clear winner → build one more iteration on each with tighter scenarios, then decide

Be deliberate about whether you're still making productive progress or going in circles. There's no hard max on iterations, but ask: "Are we discovering new things or repeating ourselves?"

Note: tech and UX decisions are sometimes the same decision. A technical concept (like auto-deriving sensitivity levels from tasks) directly shapes the UX. Don't force a separation when the insight is integrated — route to both agents and let the team decide.

### Ship Ready

**Deliverable:**
- Working prototype (Vercel link)
- All tested scenarios with results
- Proven and unproven assumptions
- Technical considerations for the build team
- Recommendation: build / don't build / build differently

Save the deliverable to `features/[feature-name]/brief.md` in the client context repo.

"Don't build" is a valid and valuable outcome. A prototype that proves a feature isn't worth building just saved months of development time.

### Knowledge Capture (5-10 min)

After every feature, capture what you learned:

**`features/[feature-name]/learnings.md`** — What worked, what didn't, what surprised you. Specific and actionable, not generic. **Context Agent** owns this — it converts the living briefing's version history into a learnings summary.

**`patterns.md`** — Update with confirmed patterns. These feed the Constraint Map of the next feature. This is how the system gets smarter over time. **All agents contribute:** UX Agent flags confirmed interaction patterns, Tech Agent flags confirmed constraints and workaround patterns, Brief Agent flags confirmed business patterns.

**`constraints.md`** — Tech Agent updates this whenever a new constraint is discovered or an assumed constraint is invalidated during iteration.

---

## Client Context Repo

Eén repo per klant. Meerdere prototypes (features) leven in dezelfde repo. De gedeelde context compoundt over features heen — feature 1 is traag, feature 5 gaat 40% sneller.

```
client-name/
├─ briefing.md          ← Living document, updated by Brief Agent every iteration
├─ constraints.md       ← Tech + platform constraints (gedeeld over alle features)
├─ patterns.md          ← Confirmed patterns, grows per feature (compound learning)
├─ ui-kit.md            ← Extracted from Figma or product (gedeeld)
├─ insights.md          ← Kevin's eigen inzichten — gelezen elke sessie
├─ backlog.md           ← Link naar project backlog + relevante items
├─ figma-links.md       ← Figma files, UI kits, coverage per scherm
├─ sources/
│  ├─ meetings/         ← Meeting transcripties (YYYY-MM-DD-onderwerp.md)
│  ├─ screenshots/      ← Referentiescreenshots van de ontwerper (visuele inspiratie)
│  └─ [overige docs]    ← SharePoint exports, wiki pagina's, feedback
└─ features/
   ├─ [feature-a]/
   │  ├─ brief.md       ← What we tested, what we found, recommendation
   │  └─ learnings.md   ← What worked, what didn't, patterns confirmed
   └─ [feature-b]/
      ├─ brief.md
      └─ learnings.md
```

**First time setup:** Run the Context Agent's "Client Repo Setup" protocol. It creates the folder structure from `templates/client-context/`, then asks you to fill in `insights.md`, `figma-links.md`, `backlog.md`, and `ui-kit.md`.

**Every feature after:** Context Agent bootstraps the session by reading all context files — including new entries in `insights.md`, new meeting transcripties in `sources/meetings/`, and new screenshots in `sources/screenshots/`. After shipping, Context Agent writes learnings and updates patterns. The repo compounds.

**Backlog access:** `backlog.md` bevat een link naar de project backlog (Azure DevOps, Jira, Linear). De Brief Agent checkt deze bij intake om de feature request te verifiëren tegen wat er gepland staat.

For the template structure, read `templates/client-context/`.

---

## Agents

Four focused agents in two layers.

**Context layer** — always active, maintains the shared knowledge base:

| Agent | When | What | Reference |
|---|---|---|---|
| **Context Agent** | Always active | Session bootstrap, context refinement, routing insights to the right files, knowledge capture after ship | `agents/context-agent.md` |

**Build layer** — episodic, per feature:

| Agent | When | What | Reference |
|---|---|---|---|
| **Brief Agent** | Feature intake + Decision gate | Challenges requests, writes and maintains `briefing.md`, runs the Decision gate, owns quality | `agents/brief-agent.md` |
| **UX Agent** | UX friction at Decision | Diagnoses interaction issues, proposes alternatives grounded in psychology and real-world patterns | `agents/ux-agent.md` |
| **Tech Agent** | Tech blocker at Decision + Code Scaffold | Proposes workarounds, builds prototypes with design tokens and interaction quality standards, structures fixture data, flags production concerns | `agents/tech-agent.md` |

**Handback protocol:** When the UX Agent or Tech Agent finishes their work, their output goes to the **Brief Agent** for a business alignment check before the next iteration starts. The Brief Agent verifies: does this still serve the hypothesis? Does it conflict with what we're trying to learn? This is a lightweight check (2-3 minutes), not a full Decision gate — just a "does this still make sense for the business question we're answering?"

**Every agent starts by reading context files.** Each agent has a "First Action" section specifying which files to read before doing anything. This ensures decisions are grounded in the latest briefing, constraints, and patterns.

Read the agent files for detailed prompts and behavior.

---

## MCP Tools (Optional, Recommended)

These MCP servers accelerate the pipeline when connected. None are required — the pipeline works without them — but they make design research and component building significantly faster.

**Design research & patterns:**
- **ui-ux-pro-mcp** (`npx ui-ux-pro-mcp`) — 1920+ curated design docs: styles, colors, typography, charts, UX guidelines, icons. Plus design system generation. Free, no API key. Used by UX Agent for diagnosis, inspiration, and design decisions.
- **ux-mcp-server** (`npx @elsahafy/ux-mcp-server`) — 23 tools + 28 knowledge bases. Pattern suggestion, colour/typography generation, dark pattern detection, accessibility analysis, IA evaluation. Free, no API key. Split across agents: UX Agent uses generative + UX validation tools; Tech Agent uses code-level validation tools.

**Component generation:**
- **magic-mcp / 21st.dev** (`npx -y @21st-dev/magic@latest`) — Generate production-ready React/TypeScript components from natural language. Speeds up Code Scaffold. Requires API key from 21st.dev console (free in beta). Setup: `claude mcp add magic -- npx -y @21st-dev/magic@latest` with `API_KEY` env var.

**When to use them:**
- Constraint Map → `ui-ux-pro-mcp` search_ux_guidelines for platform patterns
- Design Candidate → `ui-ux-pro-mcp` for reference patterns + color/typography; `ux-mcp-server` suggest_pattern + generate_color_palette for generation; reference screenshots in `sources/` for visual inspiration
- Code Scaffold → `magic-mcp` to generate components, `ui-ux-pro-mcp` get_design_system for token structure
- After Code Scaffold → `ux-mcp-server` check_contrast + analyze_accessibility + check_responsive on the build (Tech Agent)
- Decision → `ux-mcp-server` detect_dark_patterns for UX validation (UX Agent)

---

## Timing

Not every feature needs the full loop. At intake, the Brief Agent determines the speed tier:

**Quick (60 min)** — Low uncertainty. Clear hypothesis, existing patterns apply. 1 concept, 3 core scenarios, 1 iteration round. Use when the problem is well-understood and you're mainly testing execution.

**Standard (90-120 min)** — Moderate uncertainty. 2 concepts, 4-6 scenarios, 1-2 iteration rounds. The default for most features.

**Deep (120-180 min)** — High uncertainty. 3 concepts, 6+ scenarios, 2-3 iteration rounds. Use when the problem space is unclear, business assumptions are untested, or multiple valid directions compete.

| Step | Quick | Standard | Deep |
|---|---|---|---|
| Challenge + Constraint Map | 5-10 min | 10-20 min | 15-25 min |
| Iteration (per round) | 20-30 min | 30-40 min | 30-40 min |
| Alignment Check | 2-3 min | 2-3 min | 2-3 min |
| Decision | 5 min | 5-10 min | 10-15 min |
| Knowledge Capture | 5 min | 5-10 min | 10-15 min |

First feature for a new client: add ~20 min for context setup.
The system gets faster as patterns and context compound.

---

---

## Concept Validation — Dry Run Mode

Use Concept Validation when a concept already exists and the question is: **does it solve the right problem — and is it designable and buildable?** No prototyping. Evaluation only.

**When to use:**
- "Validate this concept before we build"
- "Does this direction hold up?"
- "Check if this is the right approach"
- A concept from a previous feature or stakeholder request needs pressure-testing

**What you ask (Concept Validation Intake):**

```
1. What is the concept? (one paragraph — direction, core flow, key decisions)
2. What problem does it claim to solve? (one sentence)
3. Who is the primary user? (role + context)
4. What does success look like? (the outcome, not the feature)
```

**What you evaluate — in sequence, no building:**

1. **Brief Agent** — Problem validity: does the concept answer the right question? Are the assumptions testable?
2. **UX Agent** — Designability: is the UX sound? Can this be designed without fundamental compromises? Use MCP to find precedent.
3. **Tech Agent** — Build feasibility: is this architecturally viable at prototype scale? Any showstoppers?

**Each agent delivers:**
- A focused verdict (2-3 sentences max)
- Top 2 supporting reasons
- One risk or open question

**Output — Concept Validation Report:**

```markdown
## Concept Validation Report

Concept: [name]
Problem claim: [what it says it solves]

### Problem dimension (Brief Agent)
[2-3 sentences]
Verdict: Valid ✓ / Misaligned ✗ / Partially ⚠️

### Design dimension (UX Agent)
[2-3 sentences]
Verdict: Sound ✓ / Compromised ✗ / Conditional ⚠️

### Build dimension (Tech Agent)
[2-3 sentences]
Verdict: Feasible ✓ / Blocked ✗ / Conditional ⚠️

### Overall verdict
- ✅ Validated — proceed to prototype
- ⚠️ Partially — [dimension] needs rework before building
- ✗ Off-target — concept doesn't solve the stated problem
```

Concept Validation is fast (15-20 min) and prevents wasted build cycles on concepts that don't hold up.


## When to Use This Skill

- Validating a concept direction before committing to a build

- Setting up a client context repo for the first time
- Resuming work on a feature after a business pivot
- Reviewing scenarios and edge cases for a prototype
- Capturing learnings after shipping a prototype
- When someone says "we need to build X" and you want to challenge whether X is right
