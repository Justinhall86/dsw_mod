"""An underworld headquarters' own traits in a row above its window, via `draw_own_traits`."""
from standalone import kit, mainbasetraits, onoff

NAME = "uhtraits"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("mainbasetraits",)

# ⛔ PREFIXED: every feature's names merge into ONE sheet, and a shared key hands this window away
NEEDS = {
    # the window an underworld headquarters opens, from `ui/hud/HeadquarterUI.hx`
    "uh_panel": "ui.hud.HeadquarterUI.init (",
    # the panel that already draws a trait strip above a unit, an army or a village
    "uh_wrapper": "ui.comp.EntitySelection.init (",
}

# what the window calls the thing it is about: `hq`, holding an `ent.Headquarter`
HOLDS_THE_HQ = "hq"

# the diagnosis, on its own switch, so the sheet stays the only door to a word of ours
SAYING = "uhtraitssaying"


def install(bc):
    if not onoff.on(NAME):
        return "uhtraits: OFF"
    return "uhtraits: " + str(apply_it(bc, kit.context(bc)))


def apply_it(game, resolved):
    """The headquarters' own case of the main base's row."""
    return mainbasetraits.draw_own_traits(
        game, resolved, "uh_panel", "uh_wrapper", HOLDS_THE_HQ,
        "an underworld headquarters window",
        "an underworld headquarters shows its own traits",
        SAYING, "UHTRAITS", "the headquarters panel")
