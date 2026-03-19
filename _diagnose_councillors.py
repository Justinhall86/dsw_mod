import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}

# Find trait-related sheets
trait_sheets = [n for n in sheets if 'trait' in n.lower()]
print("Trait-related sheets:", trait_sheets)
print()

# Check for our passive traits across all sheets
targets = {
    'Landsraad_JakobPassive',
    'Landsraad_SioraPassive',
    'Landsraad_HerbertPassive',
    'Landsraad_NierPassive',
}

found = set()
for sname, sheet in sheets.items():
    for line in sheet.get('lines', []):
        lid = line.get('id', '')
        if lid in targets:
            found.add(lid)
            print(f"FOUND {lid} in sheet [{sname}]")
            print(f"  keys: {list(line.keys())}")
            if 'props' in line:
                print(f"  props: {line['props']}")
            print()

missing = targets - found
if missing:
    print("MISSING passive traits (not in any sheet):")
    for m in missing:
        print(f"  - {m}")
else:
    print("All passive traits found.")

# Also look at a reference passive trait from a real councillor for comparison
print()
print("--- Reference: Atreides councillor passive traits ---")
# Find an Atreides councillor and look at their passiveTrait
atreides_chars = [r for r in sheets['character']['lines'] if r.get('faction') == 'Atreides' or 'Atreides' in str(r.get('id',''))]
for c in atreides_chars[:2]:
    pt = c.get('passiveTrait')
    if pt:
        print(f"Councillor {c['id']} -> passiveTrait: {pt}")
        # find it
        for sname, sheet in sheets.items():
            for line in sheet.get('lines', []):
                if line.get('id') == pt:
                    print(f"  Found in [{sname}]: keys={list(line.keys())}")
                    if 'props' in line:
                        print(f"  props sample: {str(line['props'])[:200]}")
