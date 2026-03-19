import json

with open('res/data.cdb', encoding='utf-8-sig') as f:
    data = json.load(f)

model_sheet = next(s for s in data['sheets'] if s['name'] == 'model')

# Get the MilitarySardaukar and Fedaykins entries (our templates)
for target in ['MilitarySardaukar', 'Fedaykins']:
    entry = next((l for l in model_sheet['lines'] if l['id'] == target), None)
    if entry:
        print(f"=== {target} ===")
        print(json.dumps(entry, indent=2))
    else:
        print(f"=== {target} NOT FOUND ===")

# Find a good drone/flying model to use as template (prefer one without heavy preload)
drone_models = [l for l in model_sheet['lines'] if 'Drone' in l.get('id','') or 'drone' in l.get('id','')]
print(f"\nAll drone models: {[l['id'] for l in drone_models]}")

# Show a clean drone (e.g., A_Drone or V_Drone)
for did in ['A_Drone', 'V_Drone', 'E_Drone']:
    entry = next((l for l in model_sheet['lines'] if l['id'] == did), None)
    if entry:
        print(f"\n=== {did} (template candidate) ===")
        print(json.dumps(entry, indent=2))
        break

# Check what unit inherits DroneBase or equivalent for drone units
unit_sheet = next(s for s in data['sheets'] if s['name'] == 'unit')
drone_units = [l for l in unit_sheet['lines'] if 'Drone' in l.get('id','') and l.get('faction') == 'LandsraadFaction']
print(f"\nLandsraad drone units: {[l['id'] for l in drone_units]}")

# Check for DroneBase or equivalent inheritable unit
for base_id in ['DroneBase', 'Drone_Base', 'A_Drone', 'L_Drone']:
    entry = next((l for l in unit_sheet['lines'] if l.get('id') == base_id), None)
    if entry:
        print(f"\nFound base unit: {base_id}, inherits={entry.get('inherits')}, faction={entry.get('faction')}")
