import json, sys

path = r'res\data.cdb'
with open(path, 'rb') as f:
    raw = f.read()

# BOM check
if raw[:3] == b'\xef\xbb\xbf':
    print("ERROR: BOM detected - would corrupt file")
    sys.exit(1)

data = json.loads(raw.decode('utf-8'))
sheets = {s['name']: s for s in data['sheets']}
domain_sheet = sheets.get('domain')

new_factions = [{'ref': 'LandsraadFaction'}, {'ref': 'Idualis'}]
changes = 0

for domain in domain_sheet['lines']:
    did = domain['id']
    for i, lvl in enumerate(domain.get('districtLevels', [])):
        for t in lvl.get('traits', []):
            facs = t.get('factions', [])
            if not facs:
                continue  # universal trait, no change needed
            current_refs = {f.get('ref') for f in facs}
            for new_f in new_factions:
                if new_f['ref'] not in current_refs:
                    facs.append(new_f)
                    print(f"  Added {new_f['ref']} to {did} Level {i} trait={t.get('ref')}")
                    changes += 1

if changes == 0:
    print("No changes needed — all factions already covered.")
    sys.exit(0)

# Write back without BOM, preserving original indentation style (spaces)
out = json.dumps(data, ensure_ascii=False, separators=(',', ': '), indent='\t') + '\n'
# The file uses spaces not tabs - detect indentation from original
# Actually use the same indent as original - check first few chars
sample_line = raw.decode('utf-8').split('\n')[2]
leading = len(sample_line) - len(sample_line.lstrip())
indent_char = '\t' if '\t' in sample_line[:leading] else ' '
if indent_char == '\t':
    indent_val = '\t'
else:
    # count spaces per level
    indent_val = '\t'  # default, will re-detect

# Re-serialize preserving the original structure
# Use the same serialization as the original file
# Sample: check line 3 indentation in original
lines = raw.decode('utf-8').split('\n')
sample = next((l for l in lines[1:20] if l.strip().startswith('"')), '')
indent_size = len(sample) - len(sample.lstrip())
# Use tab-based indentation as game engine expects
out = json.dumps(data, ensure_ascii=False, separators=(',', ': '), indent='\t') + '\n'
out_bytes = out.encode('utf-8')

with open(path, 'wb') as f:
    f.write(out_bytes)

print(f"Written {len(out_bytes):,} bytes with {changes} changes.")
# Quick re-verify
with open(path, 'rb') as f:
    raw2 = f.read()
data2 = json.loads(raw2.decode('utf-8'))
sheets2 = {s['name']: s for s in data2['sheets']}
domain2 = sheets2['domain']
for dom in domain2['lines']:
    for i, lvl in enumerate(dom.get('districtLevels', [])):
        for t in lvl.get('traits', []):
            facs = t.get('factions', [])
            if not facs:
                continue
            refs = {f.get('ref') for f in facs}
            for target in ['LandsraadFaction', 'Idualis']:
                if target not in refs:
                    print(f"STILL MISSING: {dom['id']} Level {i} trait={t.get('ref')} missing {target}")
print("Verification done.")
