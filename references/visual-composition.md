# Visual Composition & Layout

Reference guide for the UX Agent and Tech Agent. Layout is not decoration — it's how the eye moves through information. Every redesign must specify where elements go and why.

---

## Reading Patterns

**F-pattern** — text-heavy and list-heavy screens (settings, search results, activity logs, sidebar nav). Users scan fully across the first row, then progressively shorter horizontal scans, then vertical down the left edge. Primary identifier goes left. Metadata and actions go right.

**Z-pattern** — sparse, high-hierarchy screens (onboarding, confirmations, modals, empty states). Eye starts top-left, sweeps top-right, diagonals to bottom-left, sweeps to bottom-right. Primary CTA goes bottom-right — it's the natural terminus.

**Gutenberg Diagram** — applies at component level too, not just pages. Every card, tile, table row, and modal has: primary info top-left (highest attention), status/glance top-right, primary action bottom-right (where the eye finishes), secondary actions bottom-left (low attention = harder to accidentally trigger).

---

## Surface-Specific Patterns

**Dashboards** — inverted-T scan. Users check page controls first (filters, date range), sweep section headings horizontally, then scan each column vertically looking for anomalies. Most critical KPI goes top-left content area. Design for anomaly-seeking: make outliers visually distinct.

**Tables** — fixed anchor scan. Users lock on leftmost column (primary identifier) and scan vertically. Numbers always right-aligned (can't compare left-aligned numbers at a glance). Status column before the primary identifier to break the scan path.

**Card grids** — pattern-matching scan. Professional users compare, they don't discover. Consistent card structure matters more than individual card expressiveness.

---

## The 8pt Grid

Every spacing, sizing, and layout decision snaps to 8px increments. This is the structural system that makes a design feel coherent.

- **8px** — base unit. Macro spacing: 8, 16, 24, 32, 40, 48, 64
- **4px** — micro-spacing inside components only: icon-to-label, label-to-input, badge padding
- **Component heights:** 32px (compact), 40px (default), 48px (large)
- **Touch targets:** minimum 44px (Apple HIG), round to 48px to stay on grid
- **Desktop viewport:** design for 1280px minimum. With sidebar (240-280px), content area is ~960-1100px

When proposing redesigns, specify spacing in grid units: "24px gap between sections, 8px between label and input, 48px CTA height." Not vague instructions like "add more space."

---

## Visual Weight

One element dominates per section. If everything competes, nothing wins.

- Size, color saturation, contrast, isolation, and motion all add weight
- Primary actions must be visually heavier than secondary actions
- Status indicators (errors, warnings) must have highest visual weight in their region — they interrupt the normal scan
- Whitespace is not empty — it controls the weight of everything around it
