import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}
domain_sheet = sheets.get('domain')
playable = {'Atreides','Harkonnen','Fremen','Corrino','Ecaz','Vernius','Smugglers','LandsraadFaction','Idualis'}

print("=== Domain trait coverage check ===\n")
for domain in domain_sheet['lines']:
    did = domain['id']
    levels = domain.get('districtLevels', [])
    for i, lvl in enumerate(levels):
        traits = lvl.get('traits', [])
        # Which factions are covered by this level?
        covered = set()
        has_universal = False
        for t in traits:
            facs = t.get('factions', [])
            if not facs:
                has_universal = True
                covered = playable.copy()  # all factions covered
                break
            for f in facs:
                covered.add(f.get('ref', '?'))
        
        missing = playable - covered if not has_universal else set()
        if missing:
            print(f"  MISSING: Domain={did} Level={i} (0-indexed) -> missing factions: {sorted(missing)}")
            print(f"    Traits at this level:")
            for t in traits:
                facs = [f.get('ref','?') for f in t.get('factions',[])]
                print(f"    - ref={t.get('ref')} factions={facs}")
        else:
            print(f"  OK: Domain={did} Level={i} -> all playable factions covered")
