# Lessons from the Ginaz Swordmaster (2026-10-18)

Read before debugging "unit not appearing / not recruitable / black model".

| Symptom | Wrong guesses (disproven) | Actual cause | Evidence |
|---|---|---|---|
| Changes not in game, results flip-flop between tests | data.cdb incomplete, prerequisites, wheel slots, pak naming | Installed to `C:\Users\justi\OneDrive\...\D4X`; Steam runs `C:\Users\raide\OneDrive\...\D4X` (junction from Program Files). OneDrive synced minutes later. | Same pak, different NTFS file IDs (`fsutil file queryfileid`); game.log lacked `Modified data.cdb` |
| Old builds overriding new | - | `res.compressed1_archived_*.pak` left in game folder | User report; keep only the 2 paks |
| Model all black | missing materials.props (vanilla folders have one; helmet guard worked without), RGB vs RGBA textures | 84% zero-length vertex normals in the HMD | `check_hmd.py` normal stats vs working helmet: 0 zero / 99.4% agree |
| Unit spawned but "not in recruit menu" (unresolved when the install bug was found - retest before trusting) | wheel slot collision 7/8 with A_Drone/A_Ship | unknown; moved to 10/11 anyway | editor schema: wheelPosition is the gamepad wheel |

## Facts verified
- The game loads res.compressed.pak, then res.compressed1.pak, res.compressed2.pak... (modding guide);
  later files override earlier ones.
- `[DataCache] Modified data.cdb` in game.log = our data.cdb was loaded.
- data.cdb re-serialises byte for byte with `json.dumps(indent='\t', ensure_ascii=False)`.
- CastleDB unit-sheet separators are keyed by id, so inserting lines doesn't break groups.
- Recruitment is open by default for plain Military units; Elite/Drone/Ship/Frigate are unlocked by
  `Unlock_TUnit*` effects (tech, hegemony, guild). `Block_TUnitRecruit` appears in tutorials/battles.
- The 52 "references" the editor lists for A_Trooper are tutorials/objectives/raids/traits - not
  required for a new unit to work.
- HMD strings are length-prefixed (byte before `Mat_...` = its length).

# materials.props / emissive lesson (Duncan Modified, 2026-10-19)
- **Model renders but is overall DARKER than vanilla -> missing `materials.props`** beside the HMD,
  not normals/textures (normals were fine: 0 zero-length, 99.4% agree). Vanilla model folders ship it
  keyed by the exact HMD material name with PBR settings incl. `emissive` (Duncan: `"emissive": 1`);
  the game renders the material dimmer without it. Fix = copy the vanilla folder's `materials.props`
  into `CharMOD/<Name>/`. `convert_model.py` now copies it from `--prefab-template` automatically;
  `check_hmd.py` prints a note when it's absent (absent is legal - the working helmet guard has none -
  but check whether the donor model ships one before accepting the note).
- Distinguish the two look-bugs: BLACK = broken vertex normals (fix_normals), DARK = materials.props.
- Heaps pak tool: `haxe -hl b.hl -lib heaps -main hxd.fmt.pak.Build` then
  `hl b.hl -diff -out res.compressed1` (build, in <editor>/res) or `hl b.hl -out <dir> -x <pak>` (extract).

# Blender pipeline lessons (Landsraad Elite, 2026-10-19)
Worked examples are in `scripts/blender_examples/` (bridge commands run in a live GUI Blender; `bridge.py`/`run.py` are the
command-file bridge: drop a .py in `bridge/cmd`, read the `.out`). They show: clean-up -> fit -> colour projection ->
decimate -> bake -> skin -> export. Re-use them as templates; coordinates are specific to that model.

- **Screenshots: render through a camera, not the viewport.** `bpy.ops.render.opengl(view_context=True)` and
  `screenshot_area` show the previous view (the viewport only redraws between bridge commands) and the user can rotate
  the object by accident. Use an ortho camera + `bpy.ops.render.render(write_still=True)` (see `elite_12_cam.py`).
  Workbench `TEXTURE` colour showed no texture; EEVEE with a sun light + bright world works for textured previews.
- **A model supplied as a bare sculpt (no rig/UVs/colours, ~100k tris) needs the full pipeline:** remove stray bone-shape
  spikes (measure thickness with BVH rays along -normal; delete <4 mm), scale/align to the Male01 rig (check elbow and wrist
  heights against the rig bones), cut to ~7.5k tris, UV smart-project, bake albedo/normal/MetallicGlossAO, skin.
- **Colours from a reference render:** project the picture's front/back/side views onto the sculpt (fit scale/offset from the
  silhouettes: ortho, same px-per-metre in every view), ray-cast visibility per vertex, reject orange selection-outline
  and light-neutral-grey bone-display pixels, diffuse into unseen vertices, smooth. Much better than guessing regions.
- **Decimate budget:** head+hands are protected sets; if the protected set alone exceeds the target the body collapses to
  giant triangles. Shrink head/hands first (protect body), then the body (protect head/hands). Do NOT `holes_fill` on a
  sculpt with open cloth hems - it bridges arms to the torso with web-like faces.
- **Skinning:** set prop bones (B_Weapon, B_Weapon_Add, B_Gun, B_Shield, B_Scabbard) non-deform before auto weights; separate
  pieces (pauldrons) -> weight 85% clavicle / 15% SpineTop or they float off in the run; smooth the weight matrix in numpy
  (the `vertex_group_smooth` operator needs a paint mode) so cloth doesn't tear between the legs; collar flanges ->
  Neck+SpineTop. Measure with the real game clips (guard_Run / AttackMelee / Idle FBX conversions): count triangles
  stretched >4x. After tuning, ~17-38 stretched tris in run/attack remained on the robe: acceptable, revisit after seeing it in game.
- **Vertex count:** exporting with custom normals gives 17.6k verts for 7.5k tris; clear custom normals
  (`bpy.ops.mesh.customdata_custom_splitnormals_clear`), export with smoothing FACE, and let convert_model/fix_normals repair
  the lighting normals -> 8k verts.
- **Prefab template body:** the body is the model the weapon constraints point at (Prefab_LandsraadGuard lists the
  halberd BEFORE the body) - make_prefab.py now detects it.
- **Modify vs add:** to change an existing unit's look, repoint the model entries (`N_LR_Guard`, `N_LR_Guard_Helmet`) at the new
  prefab - every instance changes. Add a free Atreides unit by cloning A_Trooper, `--model N_LR_Guard`, then restore the
  Landsraad guard's squad (squadSize 3 / spacing 2).

# Quality lessons (Landsraad Elite v2, 2026-10-19)
- **Compare against the vanilla unit before "upscaling":** vanilla Atreides Trooper = 512x512 DXT5 (+ mipmaps) textures, 8.9k tris, `materials.props` with `"mode": "PBR"` + an Emissive map. Check `DDS` headers (`struct.unpack('<II', b[12:20])` = h,w) and `H.load(...).geometries[0].indexCount/3`. Ours looked worse despite more pixels because the albedo content was soft (per-vertex colours), the mesh was faceted, and no materials.props existed.
- **Sharp albedo from a reference render:** do not transfer colour per vertex. Give the dense sculpt a material that samples the (cleaned) reference image through orthographic front/back/side projections and bake it (`scripts/blender_examples/elite_v2_02_bake.py`): per-vertex visibility weights in a colour attribute, `Mix` with the old vertex colour as fallback, 2048 atlas, margin 16. Clean the reference first: bone-display shapes are flat neutral grey (spread <= 2/255) while armor always has a tint; the selection outline is saturated orange; fill holes with a numpy push-pull pyramid (4-neighbour diffusion leaves streaks). Dilate the outline mask by ~7 px and ignore views at grazing angles (< 63 deg from edge-on) or the outline leaks into the bake.
- **materials.props:** `{"materials":{"PBR":{"<HMD material name>":{mode PBR, blend None, shadows true, culling, depthTest Less, colorMask 15, enableStencil false, emissive 0.1}}}}` in the model's folder, keyed by the exact HMD material name (`retexture_materials.py <hmd>` lists names). Use `"culling": "None"` for open cloth.
- **Weights - rig quirk:** `B_rWristJ`/`B_lWristJ` have a long tail pointing down to the thigh (tail ~ (-0.22, 0.10, 0.64)), and `B_?KneeJ` tails point 0.46 m backwards. Auto weights therefore give lower tabard/robe vertices large wrist weights. Always prune hand/finger bone weights from vertices > 0.35 m from the wrist head, then measure stretched triangles in the donor unit's real clips.
- **Bridge hygiene:** inside bridge commands never rebind `PH`/`shot` globals by accident; `blender` can fail with "Unable to make version backup" on OneDrive paths - wrap `save_as_mainfile` in try/except and keep going. Use forward-slash paths in `exec(open("C:/...").read())` so printf/heredocs don't eat backslashes.

# Kitbash lessons: vanilla body + new helmet/pauldrons (Landsraad guard v3, 2026-10-19)
When a full custom body keeps looking soft or rigs badly, KEEP THE VANILLA BODY (rig, weights, textures, tris) and add only the new parts:
- Convert the vanilla HMD to FBX (`hmd2fbx.convert`), delete the part you replace (here the head: faces with all verts above a cut height; taper the cowl below into a neck; the cap is hidden inside the new helmet), leave other vanilla pieces (shoulder plates) in place under new overlays so no holes can open.
- Check which bone the vanilla part is weighted to before binding yours (the Landsraad guard's head was `B_SpineTopJ`, not `B_HeadJ`): copy that.
- New parts come from the sculpt already in rig coordinates -> no re-fitting. Carve by connectivity/height, decimate per piece (helmet ~3.8k, pauldron ~2.3k tris), bake a small dedicated atlas (1024 is plenty for ~0.4 m^2) via the reference-image projection (`elite_v3_03_bake.py`).
- Two materials in one HMD: slot 0 vanilla body with PLACEHOLDER images named like the vanilla textures, slot 1 new parts with the real baked images. `convert_model.py --vanilla-material Mat_Body=Character/.../Name --own-textures <dir with *_Albedo/_MetallicGlossAO/_Normal.png>` rewrites the body's paths to the game's files and restores the parts textures (the converter wires every material to the same canonical file names, so the last embedded image wins otherwise). Add a weapon the same way as a third material (`--vanilla-material Mat_Sword=...`, `--share-textures` for a second variant).
- One body HMD can serve several prefabs: build them with `make_prefab.py --template <vanilla prefab with the weapon> --hmd <your hmd>` (halberd / gun / bazooka) and repoint each model entry's `mesh`. Free the exact material name first (`old_` rename) or Blender appends `.001`.
- "Edit the vanilla model directly" = new files + repointing the model entries, so every vanilla unit that uses that model changes; do not overwrite vanilla paths in the pak.

# Texture-wiring lessons (Commando TRUE_FBX, 2026-10-21)
Asked to "add the colour design (albedo)" onto `model_inputs/Commando/Male01_Commando_TRUE_FBX.fbx`.
It was **already wired** - inspect before rebuilding.

- **The TRUE_FBX already carries the texture wiring.** The binary holds both an absolute
  `FileName` (`Character/Common/Commando/Commando_Albedo.png`, a game path that does not exist
  locally) and a bare `RelativeFilename` (`Commando_Albedo.png`). Blender tries the absolute path,
  fails, then resolves the relative one next to the FBX - so dropping the 3 vanilla PNGs beside the
  FBX is enough. Grep the FBX for ASCII runs matching `Albedo|Metallic|Normal|Mat_` (read bytes,
  `Encoding.ASCII`, `[regex]::Matches($t,'[ -~]{8,}')`) to see the paths before opening Blender.
- **Inspect the links, don't trust the node list:** import, then dump
  `f"{l.from_node.name}.{l.from_socket.name} -> {l.to_node.name}.{l.to_socket.name}"`. Working
  material = `Image Texture.Color -> Principled BSDF.Base Color`,
  `Image Texture.001.Color -> Principled BSDF.Specular IOR Level`,
  `Image Texture.002.Color -> Normal Map.Color`, `Normal Map.Normal -> ...Normal`. That is exactly
  what `blender_export_fbx.py` and the HMD Toolkit map by, so a correct import = done.
- Harmless red herrings on import: a **duplicate** albedo Image Texture node (colour space
  Non-Color) linked to `Alpha` (alpha is 1.0 everywhere - fine); `image.has_data == False` on the
  MetallicGlossAO/Normal images just means they are lazily loaded, not missing; `Mat_Commando` plus
  stray `Material` / `Dots Stroke` materials with no mesh users.
- **Self-contained textured FBX:** re-export the selected armature+mesh with the standard
  `blender_export_fbx.py` settings (`path_mode="COPY"`, `embed_textures=True`) -> 290 KB becomes
  1.37 MB and no `.fbm` folder is left beside it; the PNGs are embedded. Verify by file size and by
  grepping the export log for the copy step. Original file left untouched; write
  `Male01_..._textured.fbx` next to it.
- **Blender 5.2 splash screen blocks every screenshot.** `bpy.ops.wm.splash_close` does not exist
  and SendKeys `{ESC}` did not close it. What works: `user32.SetForegroundWindow` +
  `Cursor.Position` to a point clearly left of the splash + `mouse_event` DOWN/UP
  (`0x0002`/`0x0004`) - i.e. a real click outside the splash. Get the window rect first
  (`GetWindowRect`) to compute a point outside it; the MCP screenshot is scaled, so map
  screenshot coords through the real width. Then `view3d.view_axis(FRONT)` +
  `view3d.view_selected()`, shading `MATERIAL`, overlays off.
- `execute_blender_code` requires `result` to be a **dict**; a trailing `result = "ok"` raises after
  the operators already ran - the scene is changed even though the call "failed".
- Several texture variants exist (`Commando_Atreides/Corrino/Fremen/Harkonnen/Ecaz/Smugglers/
  Vernius_Albedo.png` = hue replacements of the base). Ask which one with the question tool instead
  of guessing; default to the base `Commando_Albedo.png`.
