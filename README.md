# Design That Ships

Compressed design process for building B2B prototypes that prove whether a feature works — not just how it looks.

## What is this?

A 4-agent prototype pipeline that turns a feature request into a ship-ready prototype through iterative constraint-driven design. Built for Claude Code / Cowork.

**Agents:**
- **Context Agent** — Team memory. Maintains constraints, patterns, and client context across sessions.
- **Brief Agent** — Strategy. Challenges the request, writes the briefing, manages the decision gate.
- **UX Agent** — Design. Diagnoses, explores patterns, proposes design candidates with scenario simulation.
- **Tech Agent** — Build. Scaffolds code on Vercel, runs accessibility and performance validation.

## Getting Started

### 1. Clone and setup

```bash
git clone [repo-url]
cd Claude-DesignThatShips
./setup.sh    # Installs MCP servers for design research + component generation
```

### 2. Open in Claude Code

```bash
claude    # Claude reads CLAUDE.md automatically
```

### 3. Start prototyping

```
> Ik wil een feature bouwen voor [klantnaam]
```

Claude runs the intake, sets up a client context repo if needed, and starts the pipeline.

## Client Context

One repo per client. Multiple features compound shared context (constraints, patterns, UI kit).

```
client-name/
├─ briefing.md       ← Living strategy doc
├─ constraints.md    ← Tech + platform limits
├─ patterns.md       ← Confirmed patterns (grows per feature)
├─ ui-kit.md         ← Design tokens from Figma
├─ insights.md       ← Your own observations
├─ sources/          ← Meetings, screenshots, docs
└─ features/         ← One folder per prototype
```

## MCP Servers

| Server | What it does | Setup |
|--------|-------------|-------|
| ui-ux-pro-mcp | 1920+ design reference docs | `./setup.sh` |
| ux-mcp-server | Pattern generation + accessibility | `./setup.sh` |
| magic-mcp | React component generation | `./setup.sh` (needs API key) |
| Figma MCP | Design token extraction | Manual install |
| Microsoft Graph | SharePoint client docs | Manual install |

## Speed Tiers

- **Quick (60 min)** — Clear hypothesis, existing patterns. 1 concept, 3 scenarios.
- **Standard (90-120 min)** — Moderate uncertainty. 2 concepts, 4-6 scenarios.
- **Deep (120-180 min)** — High uncertainty. 3 concepts, 6+ scenarios.

## Repo Structure

```
├─ CLAUDE.md          ← Auto-read by Claude Code
├─ SKILL.md           ← Full pipeline instructions
├─ setup.sh           ← MCP server installation
├─ agents/            ← Agent definitions
│  ├─ context-agent.md
│  ├─ brief-agent.md
│  ├─ ux-agent.md
│  └─ tech-agent.md
├─ references/        ← Quality bar, design references
└─ templates/         ← Client context repo template
```
