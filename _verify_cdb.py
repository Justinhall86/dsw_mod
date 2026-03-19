import json, sys

with open(r'res\data.cdb', 'rb') as f:
    raw = f.read()

print(f"First byte: {raw[0]} (expect 123 = {{)")
print(f"BOM present: {raw[:3] == b'\\xef\\xbb\\xbf'}")
print(f"File size: {len(raw):,} bytes")

try:
    data = json.loads(raw.decode('utf-8'))
except Exception as e:
    print(f"JSON INVALID: {e}")
    sys.exit(1)

sheets = {s['name']: s for s in data['sheets']}
print(f"Total sheets: {len(sheets)}")
print(f"compress: {data.get('compress')}")
print()

key_sheets = ['faction', 'character', 'unit', 'quest', 'resource', 'gameMode']
for k in key_sheets:
    if k in sheets:
        count = len(sheets[k]['lines'])
        print(f"  [{k}] OK - {count} rows")
    else:
        print(f"  [{k}] MISSING!")

print()
# LandsraadFaction
lf = next((r for r in sheets['faction']['lines'] if r['id'] == 'LandsraadFaction'), None)
print(f"LandsraadFaction entry: {'FOUND' if lf else 'MISSING'}")
if lf:
    print(f"  color: {lf.get('color')}")

# Councillors
councillors = ['Landsraad_Jakob', 'Landsraad_Siora', 'Landsraad_Herbert', 'Landsraad_Nier']
char_ids = {r['id'] for r in sheets['character']['lines']}
print()
print("Landsraad councillors:")
for c in councillors:
    print(f"  {c}: {'FOUND' if c in char_ids else 'MISSING'}")

# playableFactions
print()
gm = next((r for r in sheets['gameMode']['lines'] if r['id'] == 'Conquest'), None)
pf = gm['props']['playableFactions'] if (gm and 'props' in gm and 'playableFactions' in gm['props']) else []
print(f"playableFactions ({len(pf)} entries):")
for x in pf:
    # key may be 'faction' or the first key in the object
    val = x.get('faction') or x.get('id') or str(x)
    print(f"  - {val}")

print()
print("VERIFICATION COMPLETE - JSON is VALID")
