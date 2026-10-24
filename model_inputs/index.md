# model_inputs/ — Index

Quick reference for AI agents to locate assets. Run `grep -r "keyword" model_inputs/` to search.

## Folder Structure

```
model_inputs/
├── A_Ranger/                    # Atreides Ranger (female)
├── A_Trooper/                   # Atreides Trooper (male)
│   └── Soldier/                 # Soldier variant
├── Bannerjee/                   # Smuggler Bannerjee (male)
├── CaravanKulon/                # Fremen Kulon Trooper (female)
│   └── Kulon/                   # Kulon variants + animations
├── Common/                      # Shared / vanilla units
│   ├── Assassin/
│   ├── Commando/                # Commando (Male01)
│   ├── Dummy_Character/
│   ├── Landsraad/               # Landsraad Guard + weapons
│   ├── Marauder/                # Marauder variants
│   ├── Mercenary/
│   ├── Militia/                 # Militia variants
│   ├── Raider/                  # Raider variants
│   ├── Ravager/                 # Ravager melee/demo + missile launcher
│   ├── Ravager_Leader/          # Ravager Leader + sniper weapon  ← CURRENT WORK
│   ├── Weapon/                  # Shared weapons (Gun, Halberd, MaulaRifle, Shield, Sniper)
├── Drisq/                       # Smuggler Drisq (female)
├── Duncan/                      # Atreides Duncan (male)
├── Feydakin/                    # Feydakin variants
├── FreeCompany/                 # Free Company (female)
├── Gurney/                      # Atreides Gurney (male)
├── Idualis_Trooper/             # Idualis Trooper variants
├── Imperial/                    # Imperial / Corrino units
│   ├── Aramsham/
│   ├── FlameThrower/
│   ├── HouseGuard/
│   ├── LazaTiger/
│   ├── Leader/                  # Shaddam
│   ├── Sardaukar/               # Sardaukar variants
│   ├── Trooper/
│   ├── Wensicia/
│   └── Weapon/                  # AramshamSword, SardaukarSword
├── Otheym/                      # Fremen Otheym (male)
├── Skirmisher/                  # Skirmisher
├── Wensicia/                    # Imperial Wensicia
├── Gabarit_Test01.fbx
├── Gabarit_Test02.fbx
├── Gabarit_Test03.fbx
├── Male01_HouseGuard02_ascii.fbx
├── ginaz_swordmaster.fbx
└── house_ginaz_roster.jpg
```

## Key File Types

| Extension | Purpose |
|-----------|---------|
| `.fbx` | Source model (often HMD masquerading as FBX — use `hmd_to_true_fbx.py`) |
| `_TRUE_FBX.fbx` | Converted true binary FBX (Blender-readable) |
| `.prefab` | Prefab definition (body + weapon constraints) |
| `.props` / `props.json` | Animation paths, PBR settings |
| `materials.props` | PBR material config (emissive, culling, etc.) |
| `_Albedo.png` / `_MetallicGlossAO*.png` / `_Normal.png` | Textures |

## Current Work: Ravager_Leader

```
Common/Ravager_Leader/
├── Ravager_Leader.fbx                    # Original (HMD)
├── Ravager_Leader_TRUE_FBX.fbx           # Converted
├── Ravager_Leader_Albedo.png
├── Ravager_Leader_MetallicGlossAOEmiss.png
├── Ravager_Leader_Normal.png
├── Prefab_RavagerLeader.prefab
├── materials.props
└── Weapon/
    ├── RavagerLeaderSniper.fbx
    ├── RavagerLeaderSniper_TRUE_FBX.fbx
    ├── RavagerLeaderSniper_Albedo.png
    ├── RavagerLeaderSniper_MetallicGlossAO.png
    ├── RavagerLeaderSniper_Normal.png
    ├── Prefab_RavagerLeaderSniper.prefab
    └── materials.props
```

## Project Output (model_projects/Ravager_Leader/)

```
model_projects/Ravager_Leader/
├── 01_input/                              # Copied from model_inputs
├── 02_progress_photos/
│   ├── 01_source_cleanup/                 # 51 component renders
│   └── 02_backpack_removed/               # 7 angle renders + closeup
├── 03_blender/
│   ├── Ravager_Leader.blend               # Original with backpack
│   └── Ravager_Leader_no_backpack.blend   # Backpack removed ✓
├── 05_fbx_export/
│   └── Ravager_Leader_no_backpack.fbx     # Clean FBX for convert_model.py
└── SPEC.md
```

## Common Commands

```bash
# Convert HMD→FBX for a folder
python .claude/skills/dsw-model-modding/scripts/hmd_to_true_fbx.py model_inputs/Common/Ravager_Leader

# Analyze mesh components
blender -b --python .claude/skills/dsw-model-workshop/scripts/01_analyse_mesh.py -- model_inputs/Common/Ravager_Leader/Ravager_Leader_TRUE_FBX.fbx --shots model_projects/Ravager_Leader/02_progress_photos/01_source_cleanup

# Remove parts (with 3-way proof)
blender -b --python .claude/skills/dsw-model-workshop/scripts/02_remove_parts.py -- model_inputs/Common/Ravager_Leader/Ravager_Leader_TRUE_FBX.fbx model_projects/Ravager_Leader/05_fbx_export/Ravager_Leader_no_backpack.fbx --components 7,8,15,17,18 --shots model_projects/Ravager_Leader/02_progress_photos/02_backpack_removed --probe -0.4,0.4,-0.3,0.2,0.9,1.8

# Build portable .blend
blender -b --python .claude/skills/dsw-model-workshop/scripts/07_build_blend.py -- --body model_projects/Ravager_Leader/05_fbx_export/Ravager_Leader_no_backpack.fbx --textures model_inputs/Common/Ravager_Leader --weapon model_inputs/Common/Ravager_Leader/Weapon/RavagerLeaderSniper_TRUE_FBX.fbx --weapon-textures model_inputs/Common/Ravager_Leader/Weapon --out model_projects/Ravager_Leader/03_blender/Ravager_Leader_no_backpack.blend --title "Ravager Leader (No Backpack)" --weapon-bone B_Gun --grip-bone B_rWristJ --weapon-rot 90,0,0
```