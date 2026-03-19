import json

with open('res/data.cdb', encoding='utf-8-sig') as f:
    raw = f.read()

# JSON validity check
try:
    data = json.loads(raw)
    print("JSON: VALID")
except json.JSONDecodeError as e:
    print(f"JSON: INVALID — {e}")
    raise

model_sheet = next(s for s in data['sheets'] if s['name'] == 'model')
unit_sheet  = next(s for s in data['sheets'] if s['name'] == 'unit')
struct_sheet = next(s for s in data['sheets'] if s['name'] == 'structure')

# Verify models
for mid in ['ZO_Sardaukar', 'ZO_Feydakin', 'ZO_Drone']:
    m = next((l for l in model_sheet['lines'] if l['id'] == mid), None)
    if m:
        preload_present = 'preload' in m.get('props', {})
        print(f"MODEL {mid}: OK | mesh={m['mesh'][0]['path']} | inherit={m['inherit']} | rigName={m['rigName']} | preload_stripped={not preload_present}")
    else:
        print(f"MODEL {mid}: MISSING")

# Verify units
for uid in ['Test_Orphan_Sardaukar', 'Test_Orphan_Feydakin', 'Test_Orphan_Drone']:
    u = next((l for l in unit_sheet['lines'] if l['id'] == uid), None)
    if u:
        model_ref = u.get('effects', {}).get('models', [{}])[0].get('ref', 'N/A')
        print(f"UNIT {uid}: OK | faction={u['faction']} | flags={u['flags']} | inherits={u['inherits']} | model_ref={model_ref}")
    else:
        print(f"UNIT {uid}: MISSING")

# Verify LandsraadHQ startUnits
hq = next((l for l in struct_sheet['lines'] if l['id'] == 'LandsraadHQ'), None)
start_ids = [e['unit'] for e in hq.get('startUnits', [])]
print(f"\nLandsraadHQ.startUnits ({len(start_ids)} total):")
for sid in start_ids:
    marker = " ← TEST" if sid.startswith("Test_Orphan") else ""
    print(f"  {sid}{marker}")

# Weapon exclusion check
weapon_path = "Prefab_RavagerLeaderSniper"
all_model_meshes = [m2['path'] for l in model_sheet['lines'] for m2 in l.get('mesh', [])]
weapon_found = any(weapon_path in p for p in all_model_meshes)
print(f"\nWeapon prefab excluded (Prefab_RavagerLeaderSniper): {not weapon_found}")
