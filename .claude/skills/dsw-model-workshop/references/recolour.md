# The recolour method, in detail

## Why hue replacement and not a repaint

A vanilla model's albedo is a **painted** texture: every crease, shadow,
highlight and dirt streak is already baked into the RGB values. Repainting
it pixel by pixel destroys all of that.

The game's own faction tints work the same way: they shift the hue of a
region and leave the value alone. So the recolour:

1. converts the region to HSV,
2. replaces the **hue** with the target's hue,
3. replaces the **saturation** with the target's saturation (scaled by the
   base's own variation, so the region is not a flat sticker),
4. keeps the **value**, except for the compression below.

## The three corrections

### 1. Value compression

The problem: the base's value range inside one region is far wider than the
target colour allows.

Take a cream armour plate at value 250 and replace its hue with plum's hue.
Plum's brightness is about 0.4, so 250 becomes 0.4*255 = 102 - the plate
turns from near-white to mid-plum, and the *whole* region collapses to a
single flat tone. All the shading is lost, and the model looks like a
sticker.

The fix: within each region, take the robust value range (3rd..97th
percentile, so a few stray pixels cannot widen it) and **map it onto a band
around the target's brightness**:

```
rel    = (v - lo) / (hi - lo)          clipped to 0..1
rel    = 0.18 + 0.82 * rel ** 0.85     gentle S-curve, keeps midtones
v_new  = target_v * band_lo + rel * (target_v * band_hi - target_v * band_lo)
```

with `band_lo = 0.46` and `band_hi = 1.32`. The shading survives, the hue
stays, and the region reads as the target colour.

### 2. Residual hue snap

The base texture has mottled camo-ish patches - green straps on the chest,
for example. A region whose pixels are not on the target hue keeps that old
colour, so the result looks dirty.

Fix: after the hue replacement, any pixel more than `residual_snap` degrees
(18 by default) from its target hue is snapped onto the target, keeping its
own value and calming its saturation.

Skin is excluded from the snap.

### 3. Metallic override

New colours must still read as the right material. Each region gets a
multiplier and an additive push on the metallic channel:

```json
"metallic": {
  "4": [0.30, 0.0],      // the accent plate is painted, not metal
  "5": [0.55, 0.0],      // armour plate
  "6": [1.00, 60.0]      // gold trim: keep it metal and push it bright
}
```

The channel is `metallic = clip(metallic * mul + add, 0, 1)`.

## Region classification

The classifier works on the **whole texture by colour**, then floods the
leftovers from their neighbours. The result has **zero unknown pixels**.

Region ids:

| id | region | typical target |
|---|---|---|
| 0 | unknown | - |
| 1 | skin (face, hands) | left alone |
| 2 | dark fabric (scarf, bodysuit) | very dark accent |
| 3 | leather / straps | deep brown |
| 4 | accent plate (the game's own tint mask) | the hero colour |
| 5 | large armour | armour colour |
| 6 | small trim | gold / bright metal |

### Why size matters

The big cream/steel plates and the small bright trim are the **same colour**
in the base texture. Colour alone cannot separate them.

They are separated by **connected-component size**: a large blob is an armour
plate, a small one is trim. The threshold is 420 pixels for a 512x512 atlas
(`--trim-max`).

> Gold must stay a thin accent. If the big plates also become gold, the model
> turns into a gold statue - which is exactly what happened before the size
> split was added.

### The game's faction-tint mask

The game already knows which pixels it tints per faction. That mask is the
best possible source for the "accent plate" region, because it is the game's
own choice. Pass it with `--tint <mask.npy>` and it wins over everything it
overlaps.

## The palette file

```json
{
  "palette": {
    "plum":        [104, 54, 66],
    "plum_dark":   [42, 26, 33],
    "plum_plate":  [72, 42, 52],
    "gold":        [196, 154, 78],
    "leather":     [92, 48, 38],
    "skin":        [150, 104, 84]
  },
  "recipe": {
    "1": ["skin", 0.0],
    "2": ["plum_dark", 0.0],
    "3": ["leather", 0.15],
    "4": ["plum", 0.0],
    "5": ["plum_plate", 0.0],
    "6": ["gold", 0.0]
  },
  "metallic": {
    "2": [0.60, 0.0],
    "3": [0.70, 0.0],
    "4": [0.30, 0.0],
    "5": [0.55, 0.0],
    "6": [1.00, 60.0]
  }
}
```

`recipe` maps a region id to `[palette key, how much of the base's own hue to
keep]`. A value of `0.0` gives the target hue exactly; `0.15` blends 15% of
the base's hue back in, which keeps some of the original's character.

A ready-made House palette is in `assets/house_palette.json`.

## Where the colours come from

Sample them from the concept art, not by eye. The art is a **lit render**,
so the albedo is a bit brighter than the painted sample - take the lit value
and brighten it slightly, then check the result on the model.

## Verification

The recolour is deterministic: the same inputs give byte-identical output.
That makes it easy to check a refactor - compare the new output against a
known-good one:

```python
a = np.array(Image.open("new_Albedo.png").convert("RGBA")).astype(np.int16)
b = np.array(Image.open("old_Albedo.png").convert("RGBA")).astype(np.int16)
print("identical: %.2f%%" % (100.0 * (np.abs(a - b).max(axis=-1) == 0).mean()))
```
