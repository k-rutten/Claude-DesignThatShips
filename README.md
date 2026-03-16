# Design That Ships

Compressed design process for building prototypes that validate feature assumptions through iterative constraint-driven design.

Inspired by Nolan Perkins' deploy-first philosophy. Sharpened for B2B prototyping where business changes course, tech has limits, and UX must work within platform realities.

## Pipeline

```
Feature Request → Challenge → Constraint Map → Iteration Cycle → Decision → Ship Ready → Knowledge Capture
```

## Structure

```
design-that-ships/
├─ SKILL.md              ← Pipeline instructions (use as Claude skill)
├─ agents/
│  ├─ brief-agent.md     ← Maintains living briefing, challenges assumptions
│  ├─ ux-agent.md        ← Redesigns interactions on UX friction
│  └─ tech-agent.md      ← Finds workarounds on tech blockers
└─ templates/
   ├─ client-context/    ← Copy per client, fill in, let it grow
   │  ├─ briefing.md
   │  ├─ constraints.md
   │  ├─ patterns.md
   │  ├─ ui-kit.md
   │  └─ features/
   ├─ feature-brief.md   ← Per feature: what we tested, what we found
   └─ feature-learnings.md ← Per feature: what worked, what didn't
```

## Usage

### As a Claude skill
Copy `design-that-ships/` to your skills directory. The skill triggers on prototype-related prompts and guides you through the pipeline.

### Per client
Copy `templates/client-context/` into your client project. Fill in the context. Every feature adds to `patterns.md` — the system gets smarter over time.

### Per feature
Start with a feature request. The pipeline challenges it, maps constraints, iterates through design candidates with scenario simulation, and delivers a ship-ready prototype with tested assumptions.

## Credits

Built by Kevin Rutten / Blis Digital. Pipeline philosophy from Nolan Perkins. Process compression concept from NN/g (Gibbons & Wang, 2026).
