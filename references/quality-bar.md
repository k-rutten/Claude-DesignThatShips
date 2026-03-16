# Quality Bar — Reference Products

Calibration points for evaluating output quality. Use these at the Decision gate and during Design Candidate review. Ask the Test question for each reference that matches your context.

---

## Revolut — Precision at Scale
Dark-first UI. Extreme visual density without clutter. Numeric data displayed with confidence: right-aligned, tabular figures, consistent decimal handling. Color used with purpose: semantic, never decorative.
**Test:** Does every data point have unambiguous visual weight? Is the IA immediately scannable?
**Would NOT do:** Misaligned numbers. Colour as decoration. Competing visual weights. Vague empty states.

## Apple — Reduction to Essence
Every element has a reason. Typography does the work of hierarchy — not boxes, not backgrounds, not borders. Interaction is invisible until you need it.
**Test:** Remove 20% of the visible elements. Does the layout still communicate? If yes, you have too much.
**Would NOT do:** Decorative dividers. Redundant labels. Hover states that feel unearned. Animations that don't communicate state.

## Framer — Refined Minimalism with Character
Content hierarchy: white for primary, muted greys for secondary, near-invisible for tertiary. Spring-based motion: physics-driven, not eased. Narrow content columns. Generous line-height. White space as a design element.
**Test:** Does the typography alone communicate the hierarchy? Is every motion physics-grounded?
**Would NOT do:** System fonts as primary. Blue buttons on white backgrounds. Decorative gradients. Motion that loops for effect.

## Linear — Speed-First Interaction
Keyboard-first design, near-zero chrome, interface as tool. Performance is a design feature. Reduce the distance between intent and action.
**Test:** Can a power user complete their task without touching the mouse? Does the UI get out of the way?
**Would NOT do:** Decorative motion. Modal where inline editing works. Loading spinner where skeleton UI is possible.

## Stripe — Invisible Infrastructure
The API IS the product. Documentation as interface. Developer-first means respect for the user's intelligence.
**Test:** Is the complexity in the right place (backend) and the simplicity in the right place (surface)?
**Would NOT do:** Over-explain in the UI. Add a wizard when a single well-designed form suffices.

---

## How to Use

- **At Design Candidate review:** pick 1-2 references relevant to the feature type and apply the Test question
- **At Decision gate:** use the "Would NOT do" lists as red flags — if the prototype does something on a Would NOT list, flag it
- **When uncertain about quality level:** compare the prototype against these references. If it would embarrass you next to Revolut's number handling or Linear's speed, it's not ready

These references grow over time. After shipping features, add references that proved useful for your specific client domain.
