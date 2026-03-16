# Revert House Idualis Mod Injection (Rollback Guide)

This document describes how to fully revert the changes made to `res/data.cdb` and the workspace when the House **Idualis** faction was injected in the current mod session.

---

## 1) Restore the original database (recommended)

### ✅ Preferred method: Restore from backup
1. Open the `res/backups/` folder.
2. Locate the most recent backup created before the Idualis injection, e.g.:
   - `res/backups/data_pre_idualis_YYYYMMDD_HHMMSS.cdb`
3. Replace `res/data.cdb` with that backup file (overwrite).
   - **Windows PowerShell example:**
     ```powershell
     Copy-Item res\backups\data_pre_idualis_20260315_192711.cdb res\data.cdb -Force
     ```
4. Restart the editor or the game to confirm the modded faction no longer appears.

---

## 2) Manual rollback (if you do not want to restore the whole file)

> Use this approach only if you understand the data structure and just want to remove the injected entries.

### 2.1 Remove the Idualis faction entry
- Open `res/data.cdb` (JSON) and locate the `faction` sheet.
- Find and delete the entire object where:
  - `id` is **`"Idualis"`**

### 2.2 Remove the playable unit entries
- In the `unit` sheet, delete these entries:
  - `"Playable_I_Trooper"`
  - `"Playable_I_Elite"`
  - `"Playable_I_Demo"`

### 2.3 Remove the Idualis HQ structure
- In the `structure` sheet, delete the object with:
  - `id` = **`"Idualis_HQ"`**

### 2.4 Remove the Idualis region entry
- In the `region` sheet, delete the object with:
  - `id` = **`"SIdualis"`**

### 2.5 Remove YAML design documents (optional)
If you want to remove the mod design documents created during this session, delete these files:
- `mod/idualis_faction.yml`
- `mod/idualis_units.yml`
- `mod/idualis_hq.yml`
- `mod/idualis_localization.yml`

---

## 3) Verify the rollback
1. Validate `res/data.cdb` is valid JSON (e.g., using VS Code JSON tools or the CastleDB editor).
2. Confirm that no `Idualis` entries exist by searching for `"Idualis"` in `res/data.cdb`.

---

## 4) Notes / Cautions
- If you restore only part of the changes (manual deletions), the game may still reference residual IDs (e.g., `Idualis_HQ` in the faction `landmarks` object), which can cause errors.
- The easiest and safest method is **restoring the backup** rather than editing JSON by hand.

---

If you want, I can also provide a one-line PowerShell rollback script that automates the restore using the latest backup file in `res/backups/`.
