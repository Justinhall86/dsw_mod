import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}
ability_lines = {r['id']: r for r in sheets['ability']['lines']}
trait_lines = {r['id']: r for r in sheets['trait']['lines']}

# Inspect the 4 referenced abilities
print("=== Referenced Abilities ===")
for aid in ['GuildTransitContract', 'ImposeSanctions', 'CallToArms', 'InternationalTreaty']:
    a = ability_lines.get(aid)
    if not a:
        print(f"  {aid}: MISSING")
        continue
    print(f"\n[{aid}]")
    for k, v in a.items():
        if k not in ('id',):
            print(f"  {k}: {str(v)[:150]}")

print()
print("=== Landsraad Passive Trait GFX Check ===")
for tid in ['Landsraad_JakobPassive','Landsraad_SioraPassive','Landsraad_HerbertPassive','Landsraad_NierPassive']:
    t = trait_lines[tid]
    print(f"  {tid}: gfx={t.get('gfx')} | displayed={t.get('displayed')}")

print()
print("=== Checking Agt_StartingTrait_Flat attribute definition ===")
# What does Agt_StartingTrait_Flat actually do? Does it need a target trait?
# Find any real trait using Agt_StartingTrait_Flat with a non-empty target
count = 0
for t in trait_lines.values():
    for a in t.get('attributes', []):
        if a.get('ref') == 'Agt_StartingTrait_Flat':
            if a.get('target') and a['target'] != {}:
                print(f"  Non-empty target example in [{t['id']}]: {a}")
                count += 1
                if count >= 5:
                    break
    if count >= 5:
        break
if count == 0:
    print("  No non-empty targets found for Agt_StartingTrait_Flat — all use empty target {}")

# Is there a 'trait' key needed in any of these targets?
print()
print("=== Check any Atreides passiveTrait that uses Agt_StartingTrait_Flat ===")
char_lines = sheets['character']['lines']
for c in char_lines:
    pt = c.get('passiveTrait')
    if not pt:
        continue
    t = trait_lines.get(pt)
    if not t:
        continue
    for a in t.get('attributes', []):
        if a.get('ref') == 'Agt_StartingTrait_Flat':
            print(f"  {c['id']} -> {pt}: {a}")
            break
