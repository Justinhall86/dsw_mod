"""`add-development-days`: `val` research days on the named development, else on one random pick."""
from tools.project import guard
from tools.hlcode import argument_kinds
from framework import forwhom
from framework.acts import gain_devs
from framework.acts.gain_devs import PICKED_ID, READS, _asking

STAGE = "add-development-days"
NUMBER = 7
# the walks of left-out names and the re-pick, as `GainDevs` has them, without its picks' loop
LOOPS = gain_devs.LOOPS - 1
# the game's own day grant, the same one its random-days effect ends in
ADD_DAYS = "logic.faction.Developments.addDevDays"
ENTERED = "SPINE a development-days row reached its act"
GIVEN = "SPINE a development-days row added days"
NOTHING = "SPINE a development-days row had no days to add"
NOBODY = "SPINE a development-days row had no faction"
EMPTY = "SPINE a development-days row found nothing to add days to"


def emit_act(place):
    """Days on the named development, or on one pick, if the row named THIS act."""
    days = place.scratch_arg(ADD_DAYS, 1)
    zero = place.scratch_arg(ADD_DAYS, 1)
    whole = place.scratch_like(place.row[gain_devs.WHICH])
    as_is = place.kind_of(place.row["value"]) == place.kind_of(days)

    def prelude(past):
        some, as_written = place.here("days to add"), place.here("days as the row says")
        # ⛔ `GainDevDay` means one day, whatever `val` says
        return [place.op("Mov" if as_is else "ToSFloat", dst=days, src=place.row["value"]),
                place.op("Int", dst=whole, ptr=place.number(1)),
                (place.op("JNotEq", a=place.row[forwhom.JUST_ONE], b=whole), as_written),
                place.op("ToSFloat", dst=days, src=whole),
                as_written + ":", place.op("Label"),
                ] + forwhom.scaled(place, days) + [
                place.op("Int", dst=whole, ptr=place.number(0)),
                place.op("ToSFloat", dst=zero, src=whole),
                (place.op("JSGt", a=days, b=zero), some),
                ] + _asking(place, NOTHING) + [
                (place.op("JAlways"), past),
                some + ":", place.op("Label")]

    def give(place, developments, kind):
        done = place.scratch_return(ADD_DAYS)
        return [place.op("Call3", dst=done, fun=place.named_function(ADD_DAYS),
                         arg0=developments, arg1=kind, arg2=days)] + _asking(place, GIVEN)

    def randomly(place, developments):
        wide, widening = gain_devs.any_tier(place)
        reading, picked, one = gain_devs.picking(place, developments, wide)
        id_at, its_id = place.field_of(picked, PICKED_ID)
        empty, given = place.here("no pick for days"), place.here("days given to a pick")
        return widening + reading + one(empty) + [
            place.op("Field", dst=its_id, obj=picked, field=id_at),
        ] + give(place, developments, its_id) + [
            (place.op("JAlways"), given),
            empty + ":", place.op("Label")] + _asking(place, EMPTY) + [
            given + ":", place.op("Label")]
    return gain_devs.acting(place, NUMBER, ENTERED, NOBODY, prelude, give, randomly)


def install(bc):
    """Check the day grant takes a development and a number of days."""
    got = len(argument_kinds(bc, ADD_DAYS))
    guard(got == 2, "%s takes %d argument(s) and this hands it 2" % (ADD_DAYS, got))
    return "ADD DEVELOPMENT DAYS: `%s` on the named one unless owned, else on one pick" % ADD_DAYS
