#!/usr/bin/env python3
"""`add-hegemony`: the game's own `THegemony_Gain` -- the amount, modified, added under a row."""
from tools.project import guard
from tools.hlcode import argument_kind, argument_kinds, text_object
from framework.acts import gain_res

STAGE = "add-hegemony"
NUMBER = 5
# the game's own three steps: the faction's hegemony, the row's modifiers, and the add
HELD = "ent.Faction.get_hegemonyData"
MODIFIED = "ent.HegemonyData.getModifiedValue"
ADD = "ent.HegemonyData.addValue"
# what the tray draws it as: the resource, as the game's own effect draws it
SHOWN_AS = "Hegemony"
ENTERED = "SPINE a hegemony row reached the paying act"
PAID = "SPINE a hegemony row paid"
NOBODY = "SPINE a hegemony row had nobody to pay"
READS = gain_res.READS


def check_what_we_borrow(bc):
    """Each borrowed call takes what this hands it, and the amount is the kind they count in."""
    for name, takes in ((HELD, 0), (MODIFIED, 2), (ADD, 3)):
        got = len(argument_kinds(bc, name))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (name, got, takes))
    guard(argument_kind(bc, MODIFIED, 1) == argument_kind(bc, gain_res.GAIN, 1),
          "%s counts in t@%s and the paying act in t@%s"
          % (MODIFIED, argument_kind(bc, MODIFIED, 1), argument_kind(bc, gain_res.GAIN, 1)))


def emit_act(place):
    """Pay the row's amount under its hegemony row, if the row named THIS act."""
    return gain_res.emit_paying(place, NUMBER, _pay, (ENTERED, PAID, NOBODY))


def _pay(place, paid, amount):
    """The faction's hegemony, the amount as the game modifies it, and the add under the row."""
    held = place.scratch_return(HELD)
    modified = place.scratch_return(MODIFIED)
    count = place.scratch_arg(ADD, 2)
    done = place.scratch_return(ADD)
    name = place.scratch_arg(MODIFIED, 0)
    none = place.here("the faction carries no hegemony")
    return ([place.op("GetGlobal", **{"dst": name, "global": place.text_object(SHOWN_AS)})],
            # unmodified until the game has modified it, so a faction with none shows the row's
            [place.op("Mov", dst=modified, src=amount),
             place.op("Call1", dst=held, fun=place.named_function(HELD), arg0=paid),
             (place.op("JNull", reg=held), none),
             place.op("Call3", dst=modified, fun=place.named_function(MODIFIED), arg0=held,
                      arg1=place.row["columns.named"], arg2=amount),
             place.op("Null", dst=count),
             place.op("Call4", dst=done, fun=place.named_function(ADD), arg0=held,
                      arg1=place.row["columns.named"], arg2=modified, arg3=count),
             none + ":", place.op("Label")],
            name, modified)


def install(bc):
    """Check the three calls this borrows and mint the name the tray draws it as."""
    check_what_we_borrow(bc)
    text_object(bc, SHOWN_AS)
    return ("ADD HEGEMONY: `%s`, then `%s`, then `%s` under the row's hegemony row"
            % (HELD, MODIFIED, ADD))
