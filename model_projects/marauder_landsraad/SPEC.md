# Marauder - project notes

## What this project is

Vanilla Harkonnen Marauder unit converted to a portable .blend with all textures packed and KindJal dagger weapon. Also includes a Landsraad faction variant (gold/purple recolor).

| Variant | Model | Look |
|---|---|---|
| Vanilla | `Male01_Marauder` | Harkonnen red/black, KindJal dagger |
| Landsraad | `Male01_Marauder` | Gold/purple faction colors, KindJal dagger |

Source: `01_input/`

## Folder layout

| Folder | Contents |
|---|---|
| `01_input/` | the source model and its textures |
| `02_progress_photos/01_components/` | every component rendered alone |
| `02_progress_photos/02_removed/` | the result of the removal, and the closure proof |
| `02_progress_photos/03_recolour/` | the recolour iterations |
| `02_progress_photos/04_showcase/` | the final showcase angles |
| `03_blender/` | the finished .blend files |
| `04_textures/` | the recoloured textures and the region map |
| `05_fbx_export/` | the edited FBX |
| `06_game_ready/` | the shipped assets (HMD, prefab, materials.props) |
| `07_data_cdb/` | the data.cdb entries, if any |
| `08_scripts/` | the scripts used, for the record |

## What was done

### Vanilla Marauder (`Marauder.blend`)
1. **Analyzed mesh components** (01_analyse_mesh.py): 35 components identified, standard humanoid breakdown. No parts removed - keeping full body intact.
2. **Built .blend** (07_build_blend.py): Complete scene with:
   - Body: 3,833 verts, 6,260 tris, 46 bones, original Harkonnen textures
   - Weapon: KindJal dagger (258 verts, 264 tris), parented to B_Gun bone
   - All 10 textures packed (3 body + 3 weapon + 4 original references)
   - Camera, sun, fill light, world for immediate F12 rendering
3. **Verified** (08_verify_blend.py): PROBLEMS: none
4. **Showcase renders** (09_showcase.py): 5 angles rendered

### Landsraad Variant (`Marauder_Landsraad.blend`)
1. **Classified texture regions** (04_classify_regions.py): 6 regions found:
   - Region 1: Skin (65,355 px, 24.9%)
   - Region 2: Dark fabric (49,214 px, 18.8%)
   - Region 3: Leather (130,857 px, 49.9%)
   - Region 4: Accent plate (0 px)
   - Region 5: Armour plate (16,670 px, 6.4%)
   - Region 6: Small trim (48 px, 0.0%)
2. **Recolored to Landsraad palette** (05_recolour.py): Custom Landsraad palette applied:
   - Skin → skin tone (unchanged)
   - Dark fabric → Landsraad purple dark
   - Leather → leather (slightly adjusted)
   - Accent plate → Landsraad purple (not present)
   - Armour plate → Landsraad purple plate
   - Small trim → Landsraad gold
3. **Built .blend** (07_build_blend.py): Same structure with recolored textures
4. **Verified** (08_verify_blend.py): PROBLEMS: none
5. **Showcase renders** (09_showcase.py): 5 angles rendered

## Output files

- `03_blender/Marauder.blend` — Vanilla Harkonnen Marauder (1.33 MB)
- `03_blender/Marauder_Landsraad.blend` — Landsraad variant (1.71 MB)
- `02_progress_photos/04_showcase/Marauder_*.png` — Vanilla showcase (5 angles)
- `02_progress_photos/04_showcase/Marauder_Landsraad_*.png` — Landsraad showcase (5 angles)

## Unfinished / to check in game

- [ ] Export to HMD format for game integration
- [ ] Create prefab with faction assignment
- [ ] Add to data.cdb as unit variant
- [ ] Test in-game
