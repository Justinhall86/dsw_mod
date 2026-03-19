import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}

# Show domain sheet structure
domain_sheet = sheets.get('domain')
print(f"domain sheet columns: {[c['name'] for c in domain_sheet['columns']]}")
print(f"domain rows: {[r['id'] for r in domain_sheet['lines']]}")
print()

# For each domain, show districtLevels structure
for domain in domain_sheet['lines']:
    did = domain['id']
    levels = domain.get('districtLevels', [])
    print(f"=== Domain: {did} ({len(levels)} levels) ===")
    for i, lvl in enumerate(levels):
        traits = lvl.get('traits', [])
        factions_covered = [t.get('factions', []) for t in traits]
        # Flatten faction refs
        all_factions = set()
        for t in traits:
            for f in t.get('factions', []):
                all_factions.add(f.get('faction', '?'))
        print(f"  Level {i+1}: {len(traits)} trait entries, factions: {sorted(all_factions)}")
        if i < 3:  # Show detail for first few levels
            for j, t in enumerate(traits):
                fac_list = [f.get('faction', '?') for f in t.get('factions', [])]
                print(f"    trait[{j}]: id={t.get('trait')} factions={fac_list}")
    print()
