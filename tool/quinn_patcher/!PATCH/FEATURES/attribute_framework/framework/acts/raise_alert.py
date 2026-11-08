"""`raise-alert`: the row's alert, added to the payee's alert column as the game adds one."""
from tools.project import guard
from tools.hlcode import argument_kinds
from framework.acts.gain_res import PAYEE, WHICH, _asking
from framework.acts.fail_quest import ALERT, ALERTS, FOCUS
from framework import firedin as placed
from framework.parsed import READ

STAGE, DOES = "raise-alert", "raise alert"
NUMBER = 11
# the alert points at its place: a thing, a region, or a faction as the game's own alerts do
ON_FACTION, ON_ENTITY, ON_REGION = "FFaction", "FEntity", "FRegion"
TAKES = ((ALERTS, 0), (ALERT, 4))
AIM = "where an alert points"
MAIN_BASE, OUTLINE = "ent.Faction.get_mainBase", "hull"
READS = (PAYEE, "columns.named", WHICH) + placed.PLACE_READS
ENTERED = "SPINE an alert row reached its act"
RAISED = "SPINE an alert row raised its alert"
NOBODY = "SPINE an alert row had nobody to show it to"
SILENT = "SPINE an alert row's faction keeps no alerts"


def emit_act(place):
    """If the row named THIS act: the named alert on the payee's column, pointing at the holder."""
    mine = place.scratch_like(place.row[WHICH])
    past = place.here("this row names no alert")
    nobody = place.here("nobody sees this row's alert")
    silent = place.here("the faction keeps no alerts")
    alerts = place.scratch_return(ALERTS)
    name, focus = place.scratch_arg(ALERT, 0), place.scratch_arg(ALERT, 1)
    nothing, none = place.scratch_arg(ALERT, 2), place.scratch_arg(ALERT, 3)
    shown = place.scratch_return(ALERT)
    guard(place.kind_of(place.row["columns.named"]) == place.kind_of(name),
          "the row names its alert as a t@%s and %s takes a t@%s"
          % (place.kind_of(place.row["columns.named"]), ALERT, place.kind_of(name)))
    return ([place.op("Int", dst=mine, ptr=place.number(NUMBER)),
             (place.op("JNotEq", a=place.row[WHICH], b=mine), past)]
            + _asking(place, ENTERED) + [
            (place.op("JNull", reg=place.row[PAYEE]), nobody),
            place.op("Call1", dst=alerts, fun=place.named_function(ALERTS),
                     arg0=place.row[PAYEE]),
            (place.op("JNull", reg=alerts), silent),
            place.op("Mov", dst=name, src=place.row["columns.named"])]
            + _pointing(place, focus) + [
            place.op("Null", dst=nothing),
            place.op("Null", dst=none),
            place.op("CallN", dst=shown, fun=place.named_function(ALERT),
                     args=[alerts, name, focus, nothing, none])]
            + _asking(place, RAISED) + [
            (place.op("JAlways"), past),
            silent + ":", place.op("Label")] + _asking(place, SILENT) + [
            (place.op("JAlways"), past),
            nobody + ":", place.op("Label")] + _asking(place, NOBODY) + [
            past + ":", place.op("Label")])


def _pointing(place, focus):
    """Where the alert points, worked out by one shared call so the act stays as small."""
    handed = [place.row[placed.THING], place.row[placed.APPLICATION], place.row[PAYEE]]
    kinds = [place.kind_of(r) for r in handed]
    aim = place._hands["shared"]((AIM,) + tuple(kinds), kinds, place.kind_of(focus), _aiming)
    return [place.op("CallN", dst=focus, fun=aim, args=handed)]


def _aiming(hands):
    """The act's place as a thing or a region; a faction's, its main base; none, the payee's."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    at = Place(AIM, {placed.THING: 0, placed.APPLICATION: 1}, {}, None, None, None,
               "%s: done" % AIM, hands)
    focus, into = at.scratch_arg(ALERT, 1), at.scratch_return(READ)
    base, thing = at.scratch_return(MAIN_BASE), at.scratch_of(placed.ENTITY)

    def aimed(case):
        return lambda it, done: [
            at.op("MakeEnum", dst=focus, construct=at.enum_case(FOCUS, case), args=[it]),
            (at.op("JAlways"), done)]

    # ⛔ THE GAME'S OWN CLICK on a faction focus goes nowhere on the map: its main base instead
    def at_base(faction, done):
        bare = at.here("no main base for %d" % faction)
        return [at.op("Call1", dst=base, fun=at.named_function(MAIN_BASE), arg0=faction),
                (at.op("JNull", reg=base), bare),
                at.op("UnsafeCast", dst=thing, src=base)] + aimed(ON_ENTITY)(thing, done) + [
                bare + ":", at.op("Label")] + aimed(ON_FACTION)(faction, done)

    # the game's click on a region centres on its outline; a zone with none goes to the base
    def in_zone(zone, done):
        outline, bare = at.field_of(placed.ZONE, OUTLINE), at.here("no outline for %d" % zone)
        return [at.op("Field", dst=outline[1], obj=zone, field=outline[0]),
                (at.op("JNull", reg=outline[1]), bare)] + aimed(ON_REGION)(zone, done) + [
                bare + ":", at.op("Label")]

    return assemble(placed.emit_where(at, into) + placed.emit_each_kind(
        at, into, ((placed.ENTITY, aimed(ON_ENTITY)), (placed.ZONE, in_zone),
                   (placed.FACTION, at_base)), at_base(2, at.here("pointed"))
        + [at.here("pointed") + ":", at.op("Label")]) + [at.op("Ret", ret=focus)])


def install(bc):
    """Check the two calls this borrows take what it hands them."""
    for called, takes in TAKES:
        got = len(argument_kinds(bc, called))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (called, got, takes))
    return "RAISE ALERT: `%s` with the row's alert, pointing at the rule's holder" % ALERT
