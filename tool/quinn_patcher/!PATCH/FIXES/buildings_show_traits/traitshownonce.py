#!/usr/bin/env python3
"""One trait, one icon: the trait bar's grouping key is the id alone, dropping the style."""
from standalone import kit, onoff
from standalone.kit import C, _guard, _gv, _sv  # noqa: F401

NAME = "traitshownonce"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ()

# the targets this change needs resolved, by name; `kit.every_need()` merges them
NEEDS = {
    'aggregate': 'logic.TraitsManager.getAllAggregated',
    'joins': '$String.__add__',
    'groups': 'haxe.ds.StringMap.get',
}
# what the key is joined from beyond the trait's own id: the separator and the style
JOINED_ON = 2


def install(game):
    if not onoff.on(NAME):
        return "traitshownonce: OFF -- the base this build starts from already carries it"
    return "traitshownonce: " + str(one_entry_per_trait(game, kit.context(game)))


def one_entry_per_trait(game, resolved):
    fn = resolved["funcs"]["aggregate"]
    joins = _gv(resolved["funcs"]["joins"].findex)
    groups = _gv(resolved["funcs"]["groups"].findex)
    ops = fn.ops

    # WHERE THE KEY IS USED says which place holds it: the first grouping lookup here
    lookup = next((i for i, o in enumerate(ops)
                   if o.op == "Call2" and _gv(o.df["fun"]) == groups), None)
    _guard(lookup is not None,
           "`%s` never looks a key up, so the grouping is not where it was" % NEEDS['aggregate'])
    key = _gv(ops[lookup].df["arg1"])

    # and every join onto it before that lookup. What is left when they are gone is the trait's id
    onto_the_key = [i for i in range(lookup)
                    if ops[i].op == "Call2" and _gv(ops[i].df["fun"]) == joins
                    and _gv(ops[i].df["dst"]) == key and _gv(ops[i].df["arg0"]) == key]
    _guard(len(onto_the_key) == JOINED_ON,
           "the key is joined from %d piece(s) beyond the trait's id, and the bar joins %d -- the "
           "separator and the style" % (len(onto_the_key), JOINED_ON))

    # each becomes the key put back where it already is: one instruction wide, so nothing moves
    pattern = next(o for o in ops if o.op == "Mov")
    for at in onto_the_key:
        one = C(pattern)
        _sv(one, "dst", key)
        _sv(one, "src", key)
        ops[at] = one
    return "one entry per trait (%d join(s) dropped from the key)" % len(onto_the_key)
