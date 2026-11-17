# House Thorvald portrait image requests

Written for: you, to paste into an AI image generator (Midjourney, Firefly, Gemini, Flux, SDXL, etc.). Machine-readable copy: `requests.json`.

## How to use

1. Attach `STYLE_REFERENCE_atreides.jpg` as the **style reference** (not as a content reference) to every request. It shows the vanilla Atreides councillors (top), agents (middle) and leader (bottom).
2. Paste the **STYLE BLOCK**, then the request's own block. Paste the **NEGATIVE** block if the tool has a negative-prompt field, otherwise append it as "avoid: ...".
3. Generate at the **master size** listed (tall 9:16, or square for agents), on a **flat pure green background `#00FF00`**. Green is not used in the Thorvald palette, so I can cut the figure out cleanly into transparent PNG. If your tool does real transparent PNG, use that instead.
4. Send me the chosen images. I cut them out, crop to every game size (menu, tutorial, icon), build the atlases, and wire the cdb. Generating at 2x or more of the game size is ideal; do not upscale small outputs, I do that.

## What corrected from my last message
The Atreides `short_portrait.png` is the **leader's** render (Leto), not a councillor. So the missing Thorvald one is **Memnon**. The "mentat / Suk-doctor" overlay sheets are small lip-stain overlays on the agent faces, not portraits, so they are not requested. The agent atlas has 10 cells and Atreides fills all 10; Thorvald has 7 (A8-A10 equivalents missing).

## STYLE BLOCK (paste into every request)

> Stylised digital painting for a strategy-game character portrait, in the look of *Dune: Spice Wars* UI art. Painterly, **faceted flat colour planes with soft cel-shading**, visible broad brush facets on faces and cloth, **no outlines, no line art**. Simplified anatomy with slightly elongated proportions and angular jaws. Muted, desaturated palette with **one bright metallic trim colour** as the only high-contrast accent. Soft ambient occlusion in folds, a cool rim light from upper left, warm skin undertones. Serious, composed, dignified expressions, never smiling. Three-quarter view, shoulders slightly turned. Clean readable silhouette. Not photographic, not realistic skin pores, not a 3D render, not anime.

## HOUSE LOOK BLOCK (councillors, leader, agents' clothing)

> House Thorvald: industrial-aristocratic. Cloth is **polished charcoal and gunmetal** (`#23201C` to `#3A3631`). Trim is **bold copper-bronze** (`#B26E3C`), broad enough to read at thumbnail size (the Atreides gold piping is the model for weight). Accents of **oxblood** (`#5A1A1E`) in linings and inner collars. High stand-up collars, structured shoulders, layered coat plates, riveted metal panels. A small **copper gear ring with a star inside** as a pin or patch (not a large print). No rust-brown, no bone, no green, no blue, no gold. No hats or masks on councillors.

## NEGATIVE block

> photorealistic, photograph, 3D render, anime, manga, outlines, text, watermark, logo, signature, frame, border, banner, extra fingers, deformed hands, hat, mask, helmet, glasses (unless stated), cape over the face, busy background, green clothing, gold trim, Sardaukar, Atreides hawk, Corrino lion

## Framing rules (same for all 4 councillors and the leader)

- Aspect **9:16** tall. Master size **1152 x 2048** (game sizes 336x624 menu and 180x320 tutorial are cut from it).
- Figure cropped **at the waist**. Shoulders run nearly to both side edges (like the Atreides busts).
- **Top of the head at 8 to 10 % from the top, eyes at about 22 to 26 % from the top.** Leave a little air above the hair; never cut the head.
- Body slightly turned, face toward the viewer's left or right as noted. Hands only if stated; if shown, folded or still.
- Keep the whole subject inside the middle 92 % of the width so both crops keep the shoulders.
- Flat `#00FF00` background, no floor, no shadow on the background.

---

## C1: Adjutant Nobru (political), councillor bust

Master 1152x2048, 9:16. Outputs: menu 336x624, tutorial 180x320, icon 128x128 (head and collar).
Face turned slightly to the viewer's left.

> Portrait of **Adjutant Nobru**, a man in his 40s, Landsraad political aide. Short dark wavy hair swept back, trimmed full beard with a few grey hairs, calm, calculating eyes, a faint half-smile held back, composed. Wears a **long black coat with a very high folded collar with broad copper-bronze piping**, structured shoulders trimmed in copper along the edge, a dark stillsuit-style undershirt with an **oxblood inner collar**, a small copper gear-and-star pin on the left chest, a copper collar ring at the throat. A holstered pistol is **not** visible. Use the STYLE BLOCK and HOUSE LOOK BLOCK. Waist-up, 9:16, flat green background.

## C2: Envoy Theodoric Ein (military), councillor bust

Same specs as C1. Face turned slightly to the viewer's right.

> Portrait of **Envoy Theodoric Ein**, a War Academy graduate in his late 30s, field envoy. Short cropped dark hair, clean-shaven or very short stubble, strong jaw, direct and disciplined gaze. Wears an **upright knee-length charcoal frock coat with a stand-up collar, broad copper-bronze trim on collar, cuffs and shoulder seams**, a dark stillsuit torso showing under it with an oxblood inner collar, a small copper gear-and-star pin on the left chest and a smaller hammer-over-book Academy pin on the collar. Military bearing, shoulders square. No cape, no cane, no weapon in view. Use the STYLE BLOCK and HOUSE LOOK BLOCK. Waist-up, 9:16, flat green background.

## C3: Master Silva (economic), councillor bust

Same specs as C1. Face turned slightly to the viewer's left.

> Portrait of **Master Silva**, a master of works from the Heighforge foundries, a man in his 50s. Dark, tightly curled short hair going grey at the temples, weathered face with deep brow lines, an assessing, patient stare. Wears a **dark quilted leather-and-cloth work coat with one large riveted copper-bronze pauldron on the right shoulder**, a gunmetal collar plate, stitched panels, an oxblood lining at the neck, a small copper gear-and-star stamp on the left chest. Slightly soot-smudged hands are **not** shown. Use the STYLE BLOCK and HOUSE LOOK BLOCK. Waist-up, 9:16, flat green background.

## C4: Lady Haruka (covert), councillor bust

Same specs as C1. Face turned slightly to the viewer's right.

> Portrait of **Lady Haruka**, a spymaster, a woman in her 40s. Long dark braids pulled back, a thin scar through the left eyebrow, shrewd, guarded eyes, lips closed, a hint of tension. Wears a **dark charcoal high-collared jacket under a soft hooded cloak with the hood down, edged in copper-bronze and lined in oxblood**, a gunmetal gorget plate at the throat, narrow copper cord across the chest, a small copper gear-and-star clasp. Use the STYLE BLOCK and HOUSE LOOK BLOCK. Waist-up, 9:16, flat green background.

---

## L1: Earl Memnon Thorvald, leader (the missing `short_portrait`)

Master **1400 x 2200** (7:11). Outputs: `short_portrait.png` 700x1100, the HUD portrait 76x119 and leader banner cells (I downscale and crop). The existing `box_portrait.png` 700x1700 stays unless you want it redone at 7:17 from the same design.

This one follows the **vanilla leader style**, which differs from the councillors: **stylised 3D-render look** (soft clay-like PBR, subsurface skin, visible cloth weave, polished metal), game-engine character portrait with rim light, not a flat painting. Use the STYLE BLOCK but replace "faceted flat colour planes... no 3D render" with: "stylised realistic 3D game-character render, soft PBR materials, subsurface skin, fine cloth weave, polished metal trim, shallow rim light". Head and upper chest, three-quarter, large in frame (head fills about 30 % of the height), shoulders touching the edges, cropped at mid-chest, flat green background.

> **Earl Memnon Thorvald**, ruler of Ipyr and master of Heighforge, late 50s. Black hair with grey streaks swept back, a trimmed grey-streaked black beard, deep-set grieving eyes, cold and patient expression. Wears a **long black high-collared coat with a very high folded collar edged in broad copper-bronze piping**, a black wrap and sash across the chest, structured shoulder plates edged in copper, an oxblood lining visible at the collar, a copper gear-and-star emblem on the chest and an arm patch. Use the HOUSE LOOK BLOCK. 3/4 view to the viewer's left.

---

## A1 to A10: agents, one sheet

The Atreides agent sheet is the reference: **head and collar only**, a cropped square, three-quarter turn, face lit from the upper left, plain background, a **dark high-collar tunic with a thin trim line along the bottom edge and a white inner collar**. Mixed ages, genders and skin tones; each agent is clearly a different person. Atreides uses 10 cells.

Generate **one square image per agent**, master **960 x 960**, flat `#00FF00` background (the game needs 240x240 and 80x80; I downscale). Or generate a 5x2 sheet at 4800x1920 if your tool is good at consistent grids.

Per-agent wardrobe for Thorvald: **charcoal high-collar tunic, thin copper-bronze piping along the bottom edge and down the front seam, white or oxblood inner collar, a tiny copper gear pin on the left collar.** Same on all 10, so they read as one organisation.

Use the STYLE BLOCK (the flat-plane painterly version) plus:

> Agent portrait, head and collar only, filling the frame, three-quarter turn, face lit from the upper left, plain green background, charcoal high-collar tunic with copper piping, small copper gear pin. Subject:

| Id | Status | Subject |
|---|---|---|
| A1 | existing (redo for style) | man, 30s, short side-parted dark hair, clean-shaven, level stare |
| A2 | existing (redo) | man, 40s, dark brown skin, short cropped hair, trimmed goatee, heavy brows |
| A3 | existing (redo) | man, 40s, black hair with a pomp, full dark beard, steady eyes |
| A4 | existing (redo) | man, 30s, shoulder-length wavy brown hair, light stubble, pale eyes, one small earring |
| A5 | existing (redo) | man, 50s, grey beard, short grey hair, scarred cheek, hard look |
| A6 | existing (redo) | woman, 30s, hair in a long ponytail, narrow face, composed |
| A7 | existing (redo) | woman, 30s, olive-brown skin, thick curly black hair to the jaw, a small mole |
| **A8** | **NEW** | woman, 40s, long straight honey-blond hair, pale, level gaze |
| **A9** | **NEW** | man or non-binary person, 20s, hair tied back with a shaved side, thin round glasses, small ear stud |
| **A10** | **NEW** | man, 50s, black hair with grey, short stubble, tired but sharp eyes |

Minimum ask: only A8 to A10 (**3 new**; Thorvald has 7 today and the sheet has 10 cells, so the cdb gets 3 new agent rows, and 2 are enough if you want to match Atreides' count of 9). Better ask: all 10 so the set is one style, because the 7 existing ones are photo-style crops and will look different next to the new ones.

---

## Delivery checklist (what I will produce from your images)

| Output | Size | From |
|---|---|---|
| `menuCouncilorsThorvald.png` | 4 x 336x624 (1344x624) | C1-C4 |
| `councillorsThorvald.png` | 4 x 180x320 (720x320) | C1-C4 |
| `councillors_thorvald.png` | 4 x 128x128 | C1-C4 heads |
| `agents_thorvald.png` | 5x2 of 80x80 (400x160) | A1-A10 |
| `agents_thorvald_big.png` | 5x2 of 240x240 (1200x480) | A1-A10 |
| `short_portrait.png` (Thorvald) | 700x1100 | L1 |
| HUD portrait, leader banner cell | 76x119, 64x103 | L1 |

Not packed or installed until you ask. Agents A8-A10 need three new `agent` rows (`Th8`-`Th10`) in `data.cdb`; I will add those next to `Th7`, after you pick the images.
