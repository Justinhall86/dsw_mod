# Atreides portrait reference (for an AI image generator)

Vanilla House Atreides portraits, copied from `model_inputs/UI`. Make Thorvald versions at the same pixel size (or an exact multiple), same framing.
`atlases/` = the original sheets; `councillors/` and `agents/` = the same art cut into single images. `_contact_councillors_menu.png` shows the four councillors side by side.

## What Atreides has vs what Thorvald has

| Asset | Used for | Cell size | Atreides | Thorvald (built 2026-11-03) |
|---|---|---|---|---|
| Councillor menu bust | council screen | 336x624 | 4 (Thufir, Yueh, Jessica, Paul), full half-body on transparent bg | 4, but head-and-shoulder crops of photo-style art |
| Councillor tutorial bust | tutorial / popups | 180x320 | 4 (sheet has 6 cells) | 4 |
| Councillor icon | council list, passive trait icon | 128x128 | 4 (sheet `councillors_all.png`, 6 cells) | 4 |
| Agent portrait small | spying screen | 80x80 | 9 (A1-A9, 5x2 grid) | 7 (Th1-Th7) |
| Agent portrait large | agent window | 240x240 | 9 | 7 |
| Agent mentat / Suk-doctor overlays | upgraded agents | 80x80 | yes | none |
| Faction box portrait | faction select | 700x1700 | yes | yes |
| Faction short portrait | faction select (short layout) | 700x1100 | yes | MISSING |
| HUD portrait | in-game HUD | 76x119 | yes | MISSING (still Atreides) |
| Leader banner | leader button | 64x103 (x2 at 4k: 128x206) | Leto | Memnon (Corrino-based) |
| Heroes / Karlin | hero cards | | Duncan, Gurney | Karlin still Corrino's |

## Findings
- Dimensions of our councillor atlases already match Atreides (336x624, 180x320, 128x128, agents 80/240).
- Style is the gap: Atreides is painterly, flat-shaded, half-body, subject centred, transparent background; ours are photo-like tight face crops.
- Counts short: 2 agents (to reach 9), the mentat/Suk-doctor overlays, short_portrait, HUD portrait.

## Prompt hints
Painterly, flat colour planes, soft cel shading, 3/4 half-body to the waist, transparent or plain background, charcoal and copper, oxblood accents (see `house_thorvald/art_direction`).
Ask for the exact sizes above. Keep the head in the upper third as in the Atreides busts.
