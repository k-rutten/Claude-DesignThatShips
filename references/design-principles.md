# Design Principles for Prototyping

Reference guide for the UX Agent. These principles are lenses, not rigid rules. Apply them when evaluating Design Candidates and proposing interaction redesigns.

---

## 1. One Primary Action Per Screen

**Source:** Apple Human Interface Guidelines

Every screen has one thing the user needs to do. Make that thing unmissable. Everything else is secondary and should look secondary.

**How to apply:**
- Ask: "What is the ONE thing the user must accomplish on this screen?"
- The primary action gets the most visual weight: largest button, highest contrast, most prominent position
- Secondary actions exist but never compete visually with the primary action
- If you can't identify one primary action, the screen is doing too much — split it

**In B2B context:**
B2B users expect information density. That's fine — density and focus aren't opposites. A dashboard can show 20 data points and still have one clear primary action ("Approve" or "Review next"). The key is visual hierarchy: the user's eye should land on the primary action without hunting.

**Test:** Show the screen to someone for 3 seconds. Can they tell you what they're supposed to do? If not, the hierarchy is wrong.

---

## 2. Clarity, Deference, Depth

**Source:** Apple HIG — three foundational pillars

**Clarity** — Every element is legible and purposeful. No decoration without function. Labels are precise. Icons are recognizable.

**Deference** — The interface stays out of the way. Content and user tasks are the star, not the chrome. Subtle UI, bold content.

**Depth** — Visual layers communicate hierarchy. What's on top is most important. Modals, shadows, and motion signal what's primary vs. contextual.

**How to apply in prototypes:**
- Strip out anything that doesn't help the user complete their task
- Make content (data, decisions, statuses) visually dominant over chrome (navigation, labels, borders)
- Use depth (modals, overlays, elevation) intentionally — a modal means "this needs your attention now"

---

## 3. Progressive Disclosure

**Source:** Nielsen Norman Group

Don't show everything at once. Show what's needed for the current step. Reveal complexity as the user goes deeper.

**How to apply:**
- Default view: minimum viable information for the primary task
- Detail on demand: click/expand to see more
- Advanced options: hidden until needed (settings, bulk operations, edge cases)

**In B2B context:**
This is especially important for configuration screens (like YIM role permissions). An admin configuring 15+ roles doesn't need to see all permissions for all roles at once. Start with a role list → click a role → see its permissions → expand a category for details.

**Anti-pattern:** Showing a 300-cell matrix on first load. Even if the data is correct, the cognitive load kills usability.

---

## 4. Consistent Patterns Within Product

Don't invent new interaction patterns when the product already has established ones. Users have expectations built from using the rest of the product.

**How to apply:**
- Check `ui-kit.md` and `patterns.md` before designing anything new
- If the product uses tables for lists, use tables — don't introduce cards without strong reason
- If the product uses modals for editing, use modals — don't switch to inline editing without testing
- New patterns are OK when existing ones genuinely don't work, but flag it as a conscious decision

**Test:** Does this interaction feel like it belongs in this product? Or does it feel like a different app?

---

## 5. State Visibility

**Source:** Nielsen's 10 Usability Heuristics — "Visibility of system status"

The user should always know: Where am I? What's happening? What can I do?

**How to apply in prototypes:**
- Every data field has a clear state: filled, empty, missing, masked, error
- "Empty" and "no data available" must look different (the YIM lesson)
- Loading states are visible — never leave the user wondering if something is happening
- After an action: confirm what happened (success message, state change, visual feedback)
- For consequential actions: show what will happen before it happens (confirmation)

---

## 6. Forgiving Interactions

**Source:** Apple HIG, NN/g — error prevention and recovery

Users make mistakes. The interface should make mistakes hard to make and easy to recover from.

**How to apply:**
- Undo for consequential actions (always — this is non-negotiable in prototypes)
- Confirmation for destructive actions (delete, overwrite, finalize)
- Inline validation over submit-and-fail
- "Are you sure?" only for truly irreversible actions — overuse trains users to click "yes" without reading

---

## 7. Design for the Edge Case First

This is specific to prototyping. The happy path is boring — everyone can design for it. The value of a prototype is in how it handles the weird stuff.

**How to apply:**
- When defining scenarios for the Scenario Simulator, start with edge cases:
  - What if there's no data?
  - What if there's too much data?
  - What if the user has conflicting permissions?
  - What if the action is already done?
  - What if the network fails mid-action?
- Design the edge case first, then simplify for the happy path
- If the edge case breaks the design, the design is wrong — not the edge case

---

## 8. Ship the Question, Not the Answer

**Source:** NN/g "Design Process Isn't Dead, It's Compressed" + Nolan Perkins' deploy-first philosophy

A prototype exists to answer a question. If you can't articulate which question, you're building the wrong thing.

**How to apply:**
- Before starting any Design Candidate, state the question in one sentence: "Does [user] understand [concept] well enough to [complete task] within [constraint]?"
- The prototype is done when the question is answered — not when the UI is polished
- "The answer is no" is a valid and valuable outcome
- If a prototype answers a question you didn't ask, capture that insight — it's often more valuable than the planned test

**Test:** After the iteration, can you fill in: "We asked [question]. The prototype showed [answer]. This means [implication]." If you can't, the prototype didn't answer a question — it just demonstrated a flow.

---

## Quick Reference: Design Candidate Checklist

Before moving from Design Candidate to Code Scaffold, verify these design principles are applied:

- [ ] Can I identify the ONE primary action on each screen? (Hick's Law)
- [ ] Does the visual hierarchy guide the eye to what matters? (Gestalt — Figure/Ground)
- [ ] Am I showing only what's needed for the current step? (Progressive Disclosure / Cognitive Load)
- [ ] Does this match existing product patterns? (check ui-kit.md, patterns.md)
- [ ] Are all states visible? (empty, loading, error, success, masked)
- [ ] Can the user undo or recover from mistakes? (Forgiving Interactions)
- [ ] Have I designed for edge cases, not just the happy path?
- [ ] Can I state the question this prototype answers in one sentence?

Note: The Brief Agent runs the full UX quality checklist at the Decision gate (see `agents/brief-agent.md`). This Design Candidate checklist is a lighter pre-flight check before building.
