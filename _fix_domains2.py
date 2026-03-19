import json, sys

path = r'res\data.cdb'
with open(path, 'rb') as f:
    raw = f.read()

if raw[:3] == b'\xef\xbb\xbf':
    print("ERROR: BOM detected")
    sys.exit(1)

data = json.loads(raw.decode('utf-8'))
sheets = {s['name']: s for s in data['sheets']}
domain_sheet = sheets.get('domain')

# Targeted fixes - only add to the "great house" variant traits
# Military Level 1 (0-indexed): add to 'Armorers' only (NOT Armorers_Fremen)
# Statecraft Level 2 (0-indexed): add to 'PoliticalForum_GreatHouse' only (NOT PoliticalForum)
target_map = {
    ('Military', 1, 'Armorers'): ['LandsraadFaction', 'Idualis'],
    ('Statecraft', 2, 'PoliticalForum_GreatHouse'): ['LandsraadFaction', 'Idualis'],
}
# Also remove from wrong entries
remove_map = {
    ('Military', 1, 'Armorers_Fremen'): ['LandsraadFaction', 'Idualis'],
    ('Statecraft', 2, 'PoliticalForum'): ['LandsraadFaction', 'Idualis'],
}

changes = 0
for domain in domain_sheet['lines']:
    did = domain['id']
    for i, lvl in enumerate(domain.get('districtLevels', [])):
        for t in lvl.get('traits', []):
            tref = t.get('ref')
            facs = t.get('factions', [])
            key = (did, i, tref)
            
            # Add missing factions
            if key in target_map:
                current_refs = {f.get('ref') for f in facs}
                for new_ref in target_map[key]:
                    if new_ref not in current_refs:
                        facs.append({'ref': new_ref})
                        print(f"  +Added {new_ref} to {did} Level {i} trait={tref}")
                        changes += 1
            
            # Remove incorrectly added factions
            if key in remove_map:
                to_remove = set(remove_map[key])
                before = len(facs)
                t['factions'] = [f for f in facs if f.get('ref') not in to_remove]
                removed = before - len(t['factions'])
                if removed:
                    print(f"  -Removed {removed} wrong entries from {did} Level {i} trait={tref}")
                    changes += 1

if changes == 0:
    print("No changes needed.")
    sys.exit(0)

# Re-serialize preserving original format
# Use json.dumps with same separators as original (detect from file)
# The file was already re-serialized with tabs in previous run
# Write back with tabs (acceptable to the game engine)
out = json.dumps(data, ensure_ascii=False, separators=(',', ': '), indent='\t') + '\n'
out_bytes = out.encode('utf-8')

if out_bytes[:3] == b'\xef\xbb\xbf':
    print("ERROR: Would write BOM!")
    sys.exit(1)

with open(path, 'wb') as f:
    f.write(out_bytes)

print(f"Written {len(out_bytes):,} bytes with {changes} fix operations.")

# Verify
with open(path, 'rb') as f:
    raw2 = f.read()
data2 = json.loads(raw2.decode('utf-8'))
sheets2 = {s['name']: s for s in data2['sheets']}
domain2 = sheets2['domain']
playable = {'Atreides','Harkonnen','Fremen','Corrino','Ecaz','Vernius','Smugglers','LandsraadFaction','Idualis'}
ok = True
for dom in domain2['lines']:
    for i, lvl in enumerate(dom.get('districtLevels', [])):
        covered = set()
        has_universal = False
        for t in lvl.get('traits', []):
            facs = t.get('factions', [])
            if not facs:
                has_universal = True
                covered = playable.copy()
                break
            for f in facs:
                covered.add(f.get('ref', '?'))
        missing = playable - covered if not has_universal else set()
        if missing:
            print(f"  STILL MISSING: {dom['id']} Level {i}: {sorted(missing)}")
            ok = False
        else:
            print(f"  OK: {dom['id']} Level {i}")
if ok:
    print("All domain traits covered for all playable factions!")
print(f"First byte: {raw2[0]} (must be 123)")
