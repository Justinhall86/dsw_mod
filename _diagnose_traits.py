import json

with open(r'res\data.cdb', 'rb') as f:
    data = json.loads(f.read().decode('utf-8'))

sheets = {s['name']: s for s in data['sheets']}
trait_lines = {r['id']: r for r in sheets['trait']['lines']}

def show_trait(tid):
    t = trait_lines.get(tid)
    if not t:
        print(f"  [{tid}] NOT FOUND")
        return
    print(f"  id: {tid}")
    print(f"  name: {t.get('name')}")
    print(f"  type: {t.get('type')}")
    print(f"  props: {t.get('props')}")
    attrs = t.get('attributes', [])
    print(f"  attributes ({len(attrs)}):")
    for a in attrs:
        print(f"    {a}")
    print()

# Our Landsraad passive traits
print("=== Landsraad Passive Traits ===")
for tid in ['Landsraad_JakobPassive','Landsraad_SioraPassive','Landsraad_HerbertPassive','Landsraad_NierPassive']:
    show_trait(tid)

# Find Atreides councillors for comparison
print("=== Reference: Finding Atreides councillor passive traits ===")
char_lines = sheets['character']['lines']
atreides_councillors = [c for c in char_lines if 'Atreides' in c.get('id','') or str(c.get('faction','')).startswith('Atr')]
if not atreides_councillors:
    # try by faction field
    atreides_councillors = [c for c in char_lines if 'Atreides' in str(c)]
print(f"Atreides councillors found: {[c['id'] for c in atreides_councillors[:6]]}")
for c in atreides_councillors[:3]:
    pt = c.get('passiveTrait')
    if pt:
        print(f"\n{c['id']} -> passiveTrait: {pt}")
        show_trait(pt)
