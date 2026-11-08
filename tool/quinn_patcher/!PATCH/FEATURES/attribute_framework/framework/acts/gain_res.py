#!/usr/bin/env python3
"""`add-resource`: `ent.Faction.addResource` gets faction, resource and amount (negated to take)."""
from tools.project import guard
from tools.hlcode import argument_kinds
from framework.ownermatch import ASKED_AS
from framework.scopematch import PAYEE
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.ridermatch import NAMED as RIDER, emit_walks
from framework.tray import SHOWN_TO
from framework import forwhom

# what this act is called on a road, spelled once here
STAGE = "add-resource"
# which act this is, as a number of ours; a row names one and every other act steps over itself
NUMBER = 1
# the game's own way of changing what a faction has: hand it a name and an amount
GAIN = "ent.Faction.addResource"
# and the game's own way from a number to text, so a payment can say what it was WORTH
AS_TEXT = "$Std.string"
# and WHO it changes it for, the class the payee is checked against (from the owner words)
PAYS = ASKED_AS
# what it takes after the faction, and how many answers it may write (COUNTED, alike)
TAKES = ("the resource's name", "how much")
ANSWERS = 2
# what the act needs off the row; `columns.named` is the ONE column this effect's number picked
WHICH = "effect.does"
# the three words said while `respath` is on, one per way out; none means never reached
ENTERED = "SPINE a resource row reached the paying act"
PAID = "SPINE a resource row paid"
NOBODY = "SPINE a resource row had nobody to pay"
READS = (PAYEE, "columns.named", "value", "effect.adds", WHICH, EVERY_ONE, HOW_MANY,
         # AND THE TWO A RIDER NEEDS (here it moves WHO GETS PAID), and whom the number is shown
         "name.%s" % RIDER, WHOSE_RULE, FROM_FOREIGN,
         SHOWN_TO)


def check_what_we_borrow(bc):
    """The one borrowed function takes what we are about to hand it, or the build stops."""
    kinds = argument_kinds(bc, GAIN)
    guard(len(kinds) == len(TAKES) + ANSWERS,
          "%s takes %d argument(s) and this hands it %d"
          % (GAIN, len(kinds), len(TAKES) + ANSWERS))


def emit_act(place):
    """Hand the faction, resource and amount over (negated to take), if the row named THIS act."""
    return emit_paying(place, NUMBER, _pay, (ENTERED, PAID, NOBODY))


def _pay(place, paid, amount):
    """One `addResource` call: what to empty first, the call, and what the tray shows."""
    answers = [place.scratch_arg(GAIN, len(TAKES) + which) for which in range(ANSWERS)]
    got = place.scratch_return(GAIN)
    return ([place.op("Null", dst=answer) for answer in answers],
            [place.op("CallN", dst=got, fun=place.named_function(GAIN),
                      args=[paid, place.row["columns.named"], amount] + answers)],
            place.row["columns.named"], amount)


def emit_paying(place, number, pay, words):
    """A lump paid to a faction by `pay(place, paid, amount)`, if the row named act `number`."""
    entered, paid_word, nobody_word = words
    # ⛔ THE PAYEE IS CHECKED, NOT ASSUMED: a row's holder is not always the faction paid
    guard(place.kind_of(place.row[PAYEE]) == place.kind_of(place.scratch_of(PAYS)),
          "the payee is a t@%s and act %d pays a %s, which is a t@%s"
          % (place.kind_of(place.row[PAYEE]), number, PAYS,
             place.kind_of(place.scratch_of(PAYS))))
    amount = place.scratch_arg(GAIN, 1)
    # is this row ours? Every act asks, and the ones it is not for do nothing at all
    mine = place.scratch_like(place.row[WHICH])
    past = place.here("this row names another act")
    # WHO THIS ROW PAYS, which a rider moves; the road's own payee by default
    paid = place.scratch_of(PAYS)
    nobody = place.here("nobody is paid by this row")
    # the row's numbers follow the payment, so a `ForMe` row shows the holder

    skip = [place.op("Int", dst=mine, ptr=place.number(number)),
            (place.op("JNotEq", a=place.row[WHICH], b=mine), past)]
    # THE DIAGNOSIS (PRE-FLIGHT 6B): three words, one per outcome
    skip += _asking(place, entered) + _who_gets_paid(place, paid, past) + [
            # ⛔ AND NOBODY IS PAID WHEN THERE IS NOBODY (things `Neutral` reaches), and it says so
            (place.op("JNull", reg=paid), nobody)]
    # the row's value goes into that, so it has to already BE that kind of number
    guard(place.kind_of(place.row["value"]) == place.kind_of(amount),
          "the row's value is a t@%s and %s counts in t@%s"
          % (place.kind_of(place.row["value"]), GAIN, place.kind_of(amount)))
    preparing, paying, name, shown = pay(place, paid, amount)
    zero = place.scratch_like(place.row["effect.adds"])
    adds = place.row["effect.adds"]
    spare = place.scratch_like(place.row["name.%s" % RIDER])
    return skip + [
        # the amount as the row wrote it, times its multipliers, turned round when it does not add
        place.op("Mov", dst=amount, src=place.row["value"]),
    ] + forwhom.scaled(place, amount) + [
        place.op("Int", dst=zero, ptr=place.number(0)),
        (place.op("JNotEq", a=adds, b=zero), place.here("adds it")),
        place.op("Neg", dst=amount, src=amount),
        place.here("adds it") + ":",
        place.op("Label"),
    ] + preparing + paying + [
    # PAST THE PAYMENT, so a number is only shown for one that happened
    ] + _shown(place, paid, name, shown, spare) + _saying_what_it_paid(place, shown) + [
    ] + _saying_who_was_paid(place, paid) + _asking(place, paid_word) + [
        (place.op("JAlways"), past),
        nobody + ":", place.op("Label"),
    ] + _asking(place, nobody_word) + [
        past + ":", place.op("Label")]


def _asking(place, word):
    """One word, said where a question is about, and taken out with the answer."""
    return place.said("respath", lambda: place.said_now(word))


def _shown(place, paid, name, amount, spare):
    """A payment's number: a `ForAll` one drawn to whom it paid, any other kept for the row."""
    now = place.here("this payment's number is drawn to whom it paid")
    shown = place.here("this payment's number is in hand")
    # a walk over the factions (`ForAll`, `For<Owner>`) draws each number to whom it paid
    return emit_walks(place, place.row["name.%s" % RIDER], spare) + [
            (place.op("JEq", a=place.row["name.%s" % RIDER], b=spare), now),
            ] + place.show(name, amount) + [
            (place.op("JAlways"), shown),
            now + ":", place.op("Label"),
            ] + place.show(name, amount, drawn_to=paid) + [
            shown + ":", place.op("Label")]


def _who_gets_paid(place, paid, past):
    """The payee as the rider already settled it, who is the audience too."""
    return [place.op("Mov", dst=paid, src=place.row[PAYEE]),
            place.op("Mov", dst=place.row[SHOWN_TO], src=paid)]


def _saying_who_was_paid(place, paid):
    """WHICH faction the payment went to (its id), said where it happened."""
    from standalone import onoff
    if not onoff.on("respaidto"):
        return []
    at, uid = place.field_of(PAYS, "__uid")
    boxed = place.scratch_arg(AS_TEXT, 0)
    text = place.scratch_return(AS_TEXT)
    return place.said("respaidto", lambda: [
        place.op("Field", dst=uid, obj=paid, field=at),
        place.op("ToDyn", dst=boxed, src=uid),
        place.op("Call1", dst=text, fun=place.named_function(AS_TEXT), arg0=boxed)]
        + place.says(text))


def _saying_what_it_paid(place, amount):
    """The resource and the amount, said where the payment happened."""
    from standalone import onoff
    if not onoff.on("respaid"):
        return []
    boxed = place.scratch_arg(AS_TEXT, 0)
    text = place.scratch_return(AS_TEXT)
    # ⛔ THE AMOUNT ALONE: the road already names the resource, and a second saying collides
    return place.said("respaid", lambda: [
        place.op("ToDyn", dst=boxed, src=amount),
        place.op("Call1", dst=text, fun=place.named_function(AS_TEXT), arg0=boxed)]
        + place.says(text))


def install(bc):
    """Check the one function this borrows; the road runs this act in the game."""
    check_what_we_borrow(bc)
    return ("ADD RESOURCE: `%s` takes a faction, %s, and %d it may answer in -- and one call "
            "is the whole of the behaviour"
            % (GAIN, " and ".join(TAKES), ANSWERS))
