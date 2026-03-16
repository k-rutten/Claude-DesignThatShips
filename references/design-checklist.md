# Design Checklist

Pre-flight check for Design Candidates. Run this before moving to Code Scaffold. These are questions to verify, not theories to study — the MCP tools (`ui-ux-pro-mcp`, `studio-design-mcp`) provide the depth when you need to understand *why* something fails.

---

## Design Candidate Checklist

- [ ] **One primary action per screen?** Can you point to it immediately? If not, the screen is doing too much.
- [ ] **Visual hierarchy guides the eye?** Does the layout match the right reading pattern for this surface? (See `references/visual-composition.md` for surface-specific patterns.)
- [ ] **Only what's needed for the current step?** Progressive disclosure — hide complexity until the user needs it.
- [ ] **Matches existing product patterns?** Check `ui-kit.md` and `patterns.md`. Don't invent new patterns when existing ones work.
- [ ] **All states visible?** Empty, loading, error, success, masked — each looks different and tells the user what's happening.
- [ ] **User can undo or recover?** Undo for consequential actions. Confirmation for destructive ones. Inline validation over submit-and-fail.
- [ ] **Edge cases designed, not just happy path?** Start with: no data, too much data, conflicting permissions, action already done, network failure mid-action.
- [ ] **Can you state the question this prototype answers in one sentence?** If not, you're building a demo, not testing a hypothesis.

---

## When a Check Fails

Don't guess at the fix. Use the MCP tools to find the right principle:

1. **Identify which check failed** — be specific about the symptom
2. **Search for the relevant guideline** — `ui-ux-pro-mcp` → `search_ux_guidelines` with the specific problem (e.g., "choice overload in configuration screens", "table row action discoverability")
3. **Find real-world reference** — `studio-design-mcp` → search Mobbin/Dribbble for how others solved this pattern
4. **Apply the principle** — name it in your diagnosis and propose a fix grounded in evidence

This keeps the checklist universal while letting the MCP provide situation-specific depth.

---

## Fallback (No MCP Connected)

If no MCP tools are available, describe the failure in concrete behavioral terms:
- Not: "Gestalt violation"
- But: "The action button is visually grouped with the status section instead of the form it belongs to — users will associate it with the wrong context"

The behavior description is the diagnosis. The principle name is a label, not a requirement.

---

Note: The Brief Agent runs a UX quality checklist at the Decision gate (see `agents/brief-agent.md`). This Design Candidate checklist is a lighter pre-flight check before building.
