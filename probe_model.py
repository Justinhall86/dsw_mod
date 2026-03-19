import json

with open('res/data.cdb', encoding='utf-8-sig') as f:
    data = json.load(f)

# Get the model sheet and examine a few entries
model_sheet = next(s for s in data['sheets'] if s['name'] == 'model')
print('Model sheet columns:')
for c in model_sheet['columns']:
    print(f"  {c['name']}: typeStr={c['typeStr']}")

print(f"\nTotal model entries: {len(model_sheet['lines'])}")

# Find 3 sample entries - an infantry, a drone/flying, and a Landsraad one
samples = []
for line in model_sheet['lines']:
    lid = line.get('id', '')
    if 'LandsraadSoldiers_Faufreluches' == lid or 'Landsraad_Soldier' == lid:
        samples.append(line)
    elif 'Drone' in lid or 'drone' in lid:
        samples.append(line)

# Also get first Atreides model
atreides_models = [l for l in model_sheet['lines'] if 'A_' in l.get('id','')][:1]
samples.extend(atreides_models)

for s in samples[:5]:
    print(f"\n--- Model: {s['id']} ---")
    print(json.dumps(s, indent=2)[:1000])

# Check mesh sub-sheet
mesh_sheet = next(s for s in data['sheets'] if s['name'] == 'model@mesh')
print('\nmodel@mesh columns:')
for c in mesh_sheet['columns']:
    print(f"  {c['name']}: typeStr={c['typeStr']}")

# Find Landsraad model entries  
print('\nLandsraad-related model entries:')
for line in model_sheet['lines']:
    lid = line.get('id', '')
    if 'landsraad' in lid.lower() or 'Landsraad' in lid:
        print(' ', lid)

# Check Sardaukar-related models
print('\nSardaukar-related model entries:')
for line in model_sheet['lines']:
    lid = line.get('id', '')
    if 'ardaukar' in lid or 'sardaukar' in lid.lower():
        print(' ', lid)

# Check Fedaykin models
print('\nFedaykin/feydakin-related model entries:')  
for line in model_sheet['lines']:
    lid = line.get('id', '')
    if 'edayk' in lid.lower() or 'feydak' in lid.lower():
        print(' ', lid)
