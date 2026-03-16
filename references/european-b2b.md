# European B2B Context

Reference guide for all agents. The products in this pipeline serve European users in professional/B2B contexts. Apply these defaults in both design and code.

---

## Localisation

- **String expansion:** Dutch/German/French text runs 20-30% longer than English. Never assume fixed-width labels or buttons.
- **Date formats:** DD/MM/YYYY across Europe. Never MM/DD/YYYY.
- **Number formats:** 1.000,00 (dot as thousands, comma as decimal) for NL/DE and most of continental Europe.

## Information Density

European B2B users prefer higher density than US defaults. A "clean and spacious" screen can feel "empty and unfinished" to a Dutch or German professional. Earn whitespace, don't default to it.

## Copy Tone

Direct and functional, not cheerleader-y. "Save" not "Save your progress." "Opslaan" not "Sla je voortgang op." Drop superlatives.

## Privacy (GDPR)

Cookie consent with equal-weight Accept/Decline. Data collection labels adjacent to fields explaining what and why.

---

## How to Apply

**UX Agent:** When proposing redesigns, account for string expansion. A layout that works with English labels may break with Dutch translations. Test with realistic NL/DE copy.

**Tech Agent:** When building prototypes, use localised formats for dates and numbers. Use direct, functional copy. Design for higher information density than US component library defaults.
