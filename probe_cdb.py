import json

with open('res/data.cdb', encoding='utf-8-sig') as f:
    data = json.load(f)

sheet_names = [s['name'] for s in data['sheets']]

# Check for model/gfx/mesh related sheets
model_sheets = [n for n in sheet_names if 'model' in n.lower()]
gfx_sheets = [n for n in sheet_names if any(x in n.lower() for x in ['gfx','mesh','visual','render','prefab','asset'])]
print('Sheets with model in name:', model_sheets)
print('GFX-like sheets:', gfx_sheets)

# Sample Atreides unit - check effects/gfx structure
unit_sheet = next(s for s in data['sheets'] if s['name'] == 'unit')
atreides_units = [l for l in unit_sheet['lines'] if l.get('faction') == 'Atreides'][:2]
for u in atreides_units:
    print(f"\nUnit: {u['id']}")
    keys = list(u.keys())
    print('  keys:', keys)
    if 'effects' in u:
        eff = u['effects']
        print('  effects type:', type(eff).__name__)
        if isinstance(eff, dict):
            print('  effects keys:', list(eff.keys()))
            if 'models' in eff:
                print('  effects.models sample:', str(eff['models'])[:300])
    if 'gfx' in u:
        print('  gfx:', str(u['gfx'])[:300])

# Check LandsraadHQ in structure sheet
struct_sheet = next((s for s in data['sheets'] if s['name'] == 'structure'), None)
if struct_sheet:
    landsraad_hq = next((l for l in struct_sheet['lines'] if 'Landsraad' in l.get('id','') and 'HQ' in l.get('id','')), None)
    if landsraad_hq:
        print('\nLandsraadHQ found:', landsraad_hq['id'])
        print('  startUnits:', landsraad_hq.get('startUnits', 'NOT FOUND'))
        print('  keys:', list(landsraad_hq.keys()))
    else:
        print('\nNo LandsraadHQ found. Landsraad-related structures:')
        for l in struct_sheet['lines']:
            if 'Landsraad' in l.get('id','') or 'landsraad' in l.get('id','').lower():
                print(' ', l['id'])
else:
    print('\nNo structure sheet found')

# Check LandsraadSoldiers_Faufreluches unit
ls = next((l for l in unit_sheet['lines'] if l.get('id') == 'LandsraadSoldiers_Faufreluches'), None)
print('\nLandsraadSoldiers_Faufreluches found:', ls is not None)
if ls:
    print('  inherits:', ls.get('inherits','N/A'))
    print('  faction:', ls.get('faction','N/A'))
    print('  flags:', ls.get('flags','N/A'))
