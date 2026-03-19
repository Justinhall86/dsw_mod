import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}

# Raw dump of domain structure for each domain
domain_sheet = sheets.get('domain')
for domain in domain_sheet['lines']:
    did = domain['id']
    levels = domain.get('districtLevels', [])
    print(f"\n=== Domain: {did} ===")
    for i, lvl in enumerate(levels):
        traits = lvl.get('traits', [])
        print(f"  Level {i+1} raw traits[0]: {traits[0] if traits else 'EMPTY'}")
        if len(traits) > 1:
            print(f"  Level {i+1} raw traits[1]: {traits[1]}")

# Also check the sub-sheets for domain
print("\n\nSubsheets for domain@districtLevels@traits:")
dl_traits = sheets.get('domain@districtLevels@traits')
if dl_traits:
    print("  columns:", [c['name'] for c in dl_traits['columns']])

dl_traits_fac = sheets.get('domain@districtLevels@traits@factions')
if dl_traits_fac:
    print("  domain@districtLevels@traits@factions columns:", [c['name'] for c in dl_traits_fac['columns']])

dl_traits_dom = sheets.get('domain@districtLevels')
if dl_traits_dom:
    print("  domain@districtLevels columns:", [c['name'] for c in dl_traits_dom['columns']])
