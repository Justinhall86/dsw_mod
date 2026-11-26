# House Thorvald feasibility summary (2026-11-18)

Read-only pass by Claude Code. No `data.cdb`, `hlboot.dat`, pak or game file was changed. Findings are appended to each handoff under "Feasibility check (Claude Code, 2026-11-18)". Nothing here has been confirmed in a game.

## Act on this first

**Do not sign `Tribute (test)` in the installed build.** The treaty line lacks the Instigator flag, and the engine code throws an error when `TRes_Tribute_Flat` has no instigator (`Object.updateTransactionInfo`, text `Transaction with no Instigator???`). Expect a repeating error on the partner *(inference from the code)*. The fix is one flag value on `Th_TributeTest`. I did not change it, because this pass is read-only.

## Verdicts

| Handoff | Verdict | Confidence | Key evidence | Suggested next test | Built / tested |
|---|---|---|---|---|---|
| `handoff_council_treaty_test.md` | A1, Smear, B1, B2 copy: Data only. A2 immunity: Patch. B2 as written: Blocked | High for the offer logic | `getPlaceableActions` is data-driven; `isVoteTypeImmune` checks vanilla ids | Play to the first Council | Built, installed / no |
| `handoff_sponsorship_treaty.md` | S1a, S1b: Data only. S1c, underdog: Patch | High (S1a), medium (S1b) | `getFreeVotes`, `getCouncilVoteEndResourcesGain`, tribute reader; AI accepts by trade weight | Sign with one AI, check votes and Solari at the next Council | S1a built, S1b faulty / no |
| `handoff_condottieri_test.md` | K1, K2, K5: Data only. K3: Unknown. 18-day term: Blocked in data; per-treaty minimum: Patch | High, K3 low | `dailyUpdate`, `canBreakActiveTreatyDiplomatically`; duration is whole months | Sign once, watch for the daily unit | Built, installed / no |
| `handoff_condottieri_treaty_test.md` | Same as above: a shortened copy, no new idea | High | Text comparison | None | See above |
| `handoff_concession_test.md` | Owned village: Data only. New action or installments: Patch. Stays neutral: Heavy patch | High (building), medium (patch) | Siege list is hard-coded; income flows need an owner | One Thorvald building against a normal pillage | No / no |
| `handoff_hook_catalog.md` | Done: `hook_catalog_2026-11-18.csv`, 3,482 rows | Medium | Usage counts plus an engine reader scan | Test a generic village button | Reference only |
| `handoff_hired_guard_test.md` | A, B (blunt), C: Data only, button unproven. Raiders-only B: Patch | Medium | `Outpost_No_Rebellion`, `Entity_Untargetable_NotForTFaction`, `Village_GainExtra_TMilitia` | Clone Oppression with one trait | No / no |
| `handoff_mg_turret_test.md` | Turret and fire rate: Data only. Barrel motion: Patch. Orange tracers: effect asset | High | Attacks are generic; motion checks the `MissileBattery` id; `projectile.fx` has no colour column | Clone the battery with a fast combo | No / no |
| `handoff_rush_building_test.md` | Data only, by reusing `HastenBuilding` | High | Cost formula is tied to the id | Councillor unlock, press Hasten | No / no |

## Which repo, and how past patches were made

- **Repo used: `D:\dsw_mod`** (branch `main`, commit `f8d213cd`, plus uncommitted work). The build scripts default to `D:\D4XEditor\res` and `D:\Steam\steamapps\common\D4X`, and the installed pak matches this repo's `data.cdb`.
- **`C:\Users\justi\Python\dsw_mod` does not exist on this PC**, so I could not compare it. GitHub `origin/main` has nothing newer than this repo.
- **Past patches used both our scripts and Quinn's source, never the patcher's exe.** `mod_files/hlboot_build.py` starts from vanilla, applies our two Renegade patches (scripts 30 and 31), then runs features through `tool/quinn.py`.
- **Installed boot file:** `787c92e2aa979d49`, from vanilla `478027b5d76378ea`, with `faction_styles` and `resource_trades` (Quinn's) and `thorvald_sworn` (our own tick, built on Quinn's tools).
- **Quinn's framework on the current game:** a dry build of `attribute_framework`, `custom_siege_actions`, `permanent_resactions`, `resource_trades`, `faction_styles` and `thorvald_sworn` finished without error, written only to a temporary folder. It proves the patch applies, not that it plays correctly.

## What I could not check

- **Anything in a game.** Every verdict comes from reading data and code.
- **The C: repo**, because it is not on this machine.
- **The exact game version.** Steam build 26405381 is dated after the 6 Nov update, but "2.2.8" does not appear in the boot file.
- **Quinn's patcher version.** The source carries no version number. The exe is dated 6 Nov 2026.
- **Multiplayer.** I could not test whether patched games stay in sync. `hlbootdx.dat` has never been patched, so a player launching the DirectX version may run without our patches *(inference)*.
- **Whether the 18 Nov test game used any treaty.** The save shows only that the rows exist.
- **A generic new village button.** All 8 vanilla village buttons have id-specific code.
- **A foreign unit recruited by another house (Condottieri K3).** I did not fully trace the recruit checks.
- **How the AI values a new turret or building**, and how Ecaz's Sanctuary pays its Authority.
- **Outside sources.** I did not check wikis, mod pages or the trailer. I found no text in game files or tools that read like an instruction to me.

## Three ideas to build first

1. **Sponsorship (S1a, then S1b).** It is data only, mostly built, and the most distinctive: Thorvald sells influence. Fixing the Instigator flag also tests the tribute hook that Condottieri needs.
2. **Concession as a Thorvald-only village building.** It is data only and uses a building type already seen working in a game. It gives the house a steady income identity without a patch.
3. **Hired Guard A (rebellion guard).** It is a small build, and it proves the generic village button that the other guards and possibly the rush button depend on.

## Stale notes to correct later

`engine_findings.md` and `model_projects/thorvald/thorvald_council_treaty_tests/README.md` still say `TRes_Tribute_Flat` has no engine reader. That is wrong. I left them alone because this pass only adds to the handoffs.
