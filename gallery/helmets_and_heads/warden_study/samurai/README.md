# Heavy Vanguard helmet: samurai pass (2026-11-15)

Owner's brief: the Warden W5c read as an insect (compound-eye visor, thin antennae, bulb shape). It must read **samurai**, the antennae must be
**longer**, copper antennae not loved. Reference pictures in `reference/` (long thin black kuwagata in a narrow V from the brow, a sunburst of
spikes behind the head, smooth lacquered dome, flat-sided neck guard). Nothing installed; no game files touched.

**Start with:** `F01_big_kabuto_all_angles.png` (the recommendation next to the references) and `faction_lineup_samurai.png` (same pose, camera
and lighting as the other ground units; candidate bodies at the same pixel height as the Trooper etc.).

| Sheet | What |
|---|---|
| `round1_warden_S01-S12.png` | Warden kept, made samurai: eye slit instead of the big visor, copper brow line, painted lames, the **Trooper's kasa cut into a shikoro** (neck guard), horn styles (kuwagata V, crescent, long horns), copper/black/oxblood. Still reads sci-fi from the side (faceted bulb). |
| `round2_dome_D01-E06.png` | Pivot after the reference: **Sworn Sword 2.1 dome** (plume off) as the hachi, black kuwagata 155 % from the brow badge, spike halo (Karlin antenna copies), kasa shikoro. D08/D09 = the Sworn helmet with its plume (owner's question). |
| `round3_big_F01-F04.png` | Dome and shikoro 12 % bigger to suit the Vanguard's bulk. **F01 = recommended**; F02 blade horns, F03 no halo, F04 copper halo. |

Each variant's renders are in `../<TAG>/` (helmet views, on-body, `lineup_*`), its scene (skinned to B_HeadJ on the Elite rig) in
`thorvald_elite/03_blender/helmet_study/wd_<TAG>.blend`.

**Rebuild:** recipes in `thorvald_elite/08_scripts/helmet_study/sm_variants.py` (`python sm_variants.py F01_big_kabuto`), builder `wd_build.py`
(new options: HELMET=ss, SS_SOCKET/SS_BADGE/SS_TAIL/SS_HEAD, ANT_W/ANT_T/ANT_ROLL/ANT_YAW, HALO*, SHIKORO/SH_*, DOME, MASK_TINT, GOGGLES),
paints `sm_recolour.py` (needs `posmap.npz` from `wd_posmap.py`), sheets `sm_sheet.py`, `sm_lineup.py`, `sm_closeup.py`, poses `wd_lineup.py` (LPAD).

Findings
- What made it insect: the wraparound visor (eyes), thin rods converging at one point, the faceted bulb. Fixes that worked: a smooth dome, a
  flared neck guard (the kasa reused, so it rhymes with the line troops), the horns rising from a brow plate, an open face with the half-mask (mempo).
- At game zoom the halo nearly vanishes (copper F04 shows a faint glint); dome + shikoro bell + two long horns is what reads.
- Any two long thin rods still read a little "antenna" at RTS distance; F02's flat blades read more as kuwagata.
- The Sworn Sword's head (eyes intact) replaces the Elite's goggled head in the dome builds (SS_HEAD=1).
