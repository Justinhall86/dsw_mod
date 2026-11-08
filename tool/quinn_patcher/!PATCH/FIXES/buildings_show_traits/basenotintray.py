"""A main base's traits stop appearing in its region's tray: the null-tested row is stepped over."""
from tools.hlcode import function_named
from standalone import buildingtraits, kit, onoff
from standalone.kit import C, _guard, _gv, _sv  # noqa: F401

NAME = "basenotintray"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("buildingtraits",)

NEEDS = {
    # the panel a region WITH a main base in it opens, from `ui/hud/RegionUI.hx`
    "bnt_panel": "ui.hud.CityRegionUI.init (",
}

# what a row asks its subject for, as the building row names it
ASKS_FOR_TRAITS = buildingtraits.ASKS_FOR_TRAITS
# how far back the game's "is there a base here" test may sit from the asking it guards
NEAR = 12


def install(game):
    if not onoff.on(NAME):
        return "basenotintray: OFF"
    return "basenotintray: " + str(step_over_the_second_row(game, kit.context(game)))


def step_over_the_second_row(game, resolved):
    fn = resolved["funcs"]["bnt_panel"]
    ops = fn.ops
    asking = _gv(function_named(game, ASKS_FOR_TRAITS).findex)

    rows = [i for i, o in enumerate(ops) if o.op == "Call1" and _gv(o.df["fun"]) == asking]
    _guard(len(rows) == 2,
           "the city region's panel asks for traits %d time(s), not twice -- one row is the "
           "region's own and one the base's, and this cannot tell which" % len(rows))

    # the base's row is the guarded one: the game already skips it where there is no base
    guarded = []
    for at in rows:
        subject = _gv(ops[at].df["arg0"])
        tests = [i for i in range(max(0, at - NEAR), at)
                 if ops[i].op == "JNull" and _gv(ops[i].df["reg"]) == subject]
        if tests:
            guarded.append((tests[-1], at))
    _guard(len(guarded) == 1,
           "%d of the two rows are guarded by a null test on what they ask, and exactly one "
           "should be -- a region is always there and a base is not" % len(guarded))

    test_at, asked_at = guarded[0]
    _guard(test_at < asked_at, "the test sits after the asking it is supposed to guard")

    # the same jump and distance, taken every time; one instruction wide, so nothing moves
    pattern = next((o for o in ops if o.op == "JAlways"), None)
    _guard(pattern is not None,
           "this panel holds no unconditional jump to copy, so the test cannot become one")
    always = C(pattern)
    _sv(always, "offset", _gv(ops[test_at].df["offset"]))
    ops[test_at] = always
    return ("the base's row is stepped over: the test at %d is now an always over %d "
            "instruction(s)" % (test_at, _gv(always.df["offset"])))
