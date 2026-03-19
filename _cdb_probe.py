import json, sys

with open(r'c:\dsw_mod\D4XEditor\res\data.cdb', encoding='utf-8-sig') as f:
    data = json.load(f)

mode = sys.argv[1] if len(sys.argv) > 1 else 'help'

if mode == 'character_cols':
    for s in data['sheets']:
        if s['name'] == 'character':
            print('=== character sheet columns ===')
            for c in s['columns']:
                print('  ' + repr(c))

elif mode == 'character_rows':
    for s in data['sheets']:
        if s['name'] == 'character':
            print('=== character rows (id + faction) ===')
            for row in s['lines']:
                fac = row.get('faction', row.get('factions', ''))
                print('  ' + str(row.get('id','')).ljust(50) + ' faction=' + str(fac))

elif mode == 'character_detail':
    target = sys.argv[2] if len(sys.argv) > 2 else 'Thufir'
    for s in data['sheets']:
        if s['name'] == 'character':
            for row in s['lines']:
                if target.lower() in str(row.get('id','')).lower():
                    print(json.dumps(row, indent=2))
                    print()

elif mode == 'faction_chars':
    for s in data['sheets']:
        if s['name'] == 'faction':
            for row in s['lines']:
                chars = row.get('characters', {})
                print('FACTION: ' + str(row.get('id','')))
                print('  characters field: ' + json.dumps(chars)[:400])
                print()

elif mode == 'corrino_faction':
    for s in data['sheets']:
        if s['name'] == 'faction':
            for row in s['lines']:
                if 'corrino' in str(row.get('id','')).lower():
                    print('=== CORRINO FULL ===')
                    print(json.dumps(row, indent=2))

elif mode == 'landsraad_faction':
    for s in data['sheets']:
        if s['name'] == 'faction':
            for row in s['lines']:
                if 'landsraad' in str(row.get('id','')).lower():
                    print('=== LANDSRAAD FACTION ===')
                    print(json.dumps(row, indent=2))

elif mode == 'faction_keys':
    all_keys = set()
    for s in data['sheets']:
        if s['name'] == 'faction':
            for row in s['lines']:
                all_keys.update(row.keys())
    print('All faction row keys: ' + str(sorted(all_keys)))

elif mode == 'ability_ids':
    kw = sys.argv[2].lower() if len(sys.argv) > 2 else ''
    for s in data['sheets']:
        if s['name'] == 'ability':
            for row in s['lines']:
                rid = str(row.get('id', ''))
                if not kw or kw in rid.lower():
                    print(rid)

elif mode == 'char_corrino':
    for s in data['sheets']:
        if s['name'] == 'character':
            for row in s['lines']:
                if 'corrino' in str(row.get('id','')).lower() or 'corrino' in str(row.get('faction','')).lower():
                    print(json.dumps(row, indent=2))
                    print('---')
