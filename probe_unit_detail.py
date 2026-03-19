import json

with open('res/data.cdb', encoding='utf-8-sig') as f:
    data = json.load(f)

unit_sheet = next(s for s in data['sheets'] if s['name'] == 'unit')

# Check for Drone base unit
for base_id in ['Drone', 'DroneBase', 'Drone_Base']:
    entry = next((l for l in unit_sheet['lines'] if l.get('id') == base_id), None)
    if entry:
        print(f"=== Unit: {base_id} ===")
        print(json.dumps(entry, indent=2)[:500])

# Check A_Drone unit as template
a_drone = next((l for l in unit_sheet['lines'] if l.get('id') == 'A_Drone'), None)
if a_drone:
    print("\n=== A_Drone unit ===")
    print(json.dumps(a_drone, indent=2)[:600])

# Find what models already point to MilitarySardaukar
model_sheet = next(s for s in data['sheets'] if s['name'] == 'model')
sardaukar_inheritors = [l for l in model_sheet['lines'] if l.get('inherit') == 'MilitarySardaukar']
print(f"\nModels inheriting MilitarySardaukar: {[l['id'] for l in sardaukar_inheritors]}")
if sardaukar_inheritors:
    print(json.dumps(sardaukar_inheritors[0], indent=2))

# Find what models inherit DroneCommon
drone_common_inheritors = [l for l in model_sheet['lines'] if l.get('inherit') == 'DroneCommon']
print(f"\nModels inheriting DroneCommon: {[l['id'] for l in drone_common_inheritors]}")

# Confirm gfx on LandsraadSoldiers_Faufreluches
ls = next((l for l in unit_sheet['lines'] if l.get('id') == 'LandsraadSoldiers_Faufreluches'), None)
if ls:
    print(f"\nLandsraadSoldiers_Faufreluches full entry:")
    print(json.dumps(ls, indent=2))

# Check Landsraad_Soldier for reference
landsraad_soldier = next((l for l in unit_sheet['lines'] if l.get('id') == 'Landsraad_Soldier'), None)
if landsraad_soldier:
    print(f"\nLandsraad_Soldier keys: {list(landsraad_soldier.keys())}")
    if 'effects' in landsraad_soldier:
        print('  effects.models:', landsraad_soldier['effects'].get('models', 'N/A'))
    if 'gfx' in landsraad_soldier:
        print('  gfx:', landsraad_soldier['gfx'])
