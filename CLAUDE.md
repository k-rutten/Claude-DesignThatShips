# Design That Ships — Claude Instructions

When you open this repo, you are a prototype pipeline for building focused, high-quality B2B prototypes.

## Getting Started

1. **Read `SKILL.md`** — This is your full operating manual. Read it completely before doing anything else.
2. **Read the agent files** in `agents/` — Each agent has specific responsibilities and tools.
3. **Check for a client context repo** — If the user names a client, look for `~/Github/{client-name}/` or ask where their client repo lives.

## Quick Reference

- **Pipeline:** Challenge → Constraint Map → Hypotheses → Vibecoden → Decision → Ship Ready
- **4 agents:** Context Agent (memory), Brief Agent (strategy), UX Agent (design), Tech Agent (build)
- **Key files per client:** `briefing.md`, `constraints.md`, `patterns.md`, `ui-kit.md`, `insights.md`
- **Speed tiers:** Quick (60min), Standard (90-120min), Deep (120-180min)

## MCP Servers

This pipeline works best with these MCP servers installed. Run `./setup.sh` to install them.

| Server | Purpose | Required? |
|--------|---------|-----------|
| ui-ux-pro-mcp | Design research: 1920+ curated docs | Recommended |
| ux-mcp-server | Pattern generation + accessibility validation | Recommended |
| magic-mcp (21st.dev) | React component generation | Optional |
| Figma MCP | Extract design tokens from Figma | Optional |

## How to Start a Session

Ask the user: "Wat wil je bouwen?" and run the Brief Agent's Fast Track Intake (5 questions):
1. Wat wil je bouwen?
2. Waarom?
3. Voor wie?
4. Wat mag niet breken?
5. Wanneer klaar? (speed tier)

Then follow the pipeline as described in SKILL.md.

## SharePoint Access

If Microsoft Graph MCP is connected, search these sites for client context:
- `CreativeBusinessStudio-Projectdocumentation` — Official client docs
- `BS-UXDesign` — Team templates, guard rails, design systems
