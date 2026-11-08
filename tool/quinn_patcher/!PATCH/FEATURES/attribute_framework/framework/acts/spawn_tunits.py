"""`spawn-units` -- the row's number of a named unit at the faction's main base (not reconciled)."""
from tools.project import guard, gv
from tools.hlcode import argument_kinds
from framework import columns, forwhom
from framework import firedin as placed
from framework.parsed import READ
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.acts.gain_res import PAYEE, WHICH
from framework.ofthekind import IS_REALLY as ANSWERS_A_TRUTH
from framework.parammatch import NAMED as PARAMETER, NOTHING_SPELLED, number_of as parameter_number
# a thing's traits, asked the way `HasTrait` asks
from framework.questions.carries_trait import THROUGH as TRAITS_OF

# a truth's kind is borrowed off a question the build already names (a truth is no class)

# what this act is called on a road, and which act it is as a number of ours
STAGE = "spawn-units"
NUMBER = 3
# its own loops, which the store-walk check adds up: one round per unit made, the pick's tries
LOOPS = 2
# `SpawnNotTUnit`: a pick landing on the named kind is made again, this many times at most
TRIES = 16
TURNED = "effect.turned"
# the game's own way of putting one unit on the map at a structure
RECRUIT = "ent.Structure.recruitUnit"
# what it takes past the structure: unit id, faction, a refusal place, and three it fills itself
TAKES = 6
# which of those we hand something other than nothing to
NAMED, FOR_WHOM, REFUSAL, MODE = 0, 1, 2, 3
# `Here`: a unit given a spot lands on it with no shuttle, the mode the game's abilities hand over
SPAWN_MODE, DIRECT = "ent.SpawnMode", "NoShuttle"
# and where the payee's main base arrives, moved with the payee by the rider
from framework.forwhom import THE_BASE
# what an owner word in front of a multiplier reads to walk the factions it picks
OWNER_PICKS = (WHOSE_RULE, FROM_FOREIGN, EVERY_ONE, HOW_MANY)
READS = (PAYEE, "columns.named", "value", forwhom.JUST_ONE, WHICH, THE_BASE, TURNED,
         # AND THE TWO A PARAMETER NEEDS: which one the id spelled, and what its column named
         "name.%s" % PARAMETER, columns.PART_FOR_PARAMETER) + OWNER_PICKS + placed.PLACE_READS
# the bundle the door takes last, and its field holding the trait a unit is born with
THE_BUNDLE = 5
# `Here`: the spot the door puts the unit on, and the game's two ways to find a free one
POSITION, SPOT_TAKES = 4, 3
BESIDE, ANYWHERE_IN = "ent.Entity.getSafePosition", "ent.Zone.getSafeSpawnPoint"
# a zone with no area (zone 0) has nowhere to spawn in: its unit goes to the rally point
AREA = "innerArea"
PLACED = "SPINE a spawn row put its unit where it happened"
HERE = "the spot a unit is made on"
BASED, ARRIVING = "the structure a unit is made at", "how a unit made on a spot arrives"
THE_TRAIT_IN_IT = "spawnTrait"
# the words said while `respath` is on, one per way out; none means the road never reached it
ENTERED = "SPINE a spawn row reached the spawning act"
# said INSIDE the loop, once per unit made
SPAWNED = "SPINE a spawn row put a unit on the map"
NO_BASE = "SPINE a spawn row had no main base to spawn at, or no unit to spawn"
PICKED = "SPINE a spawn row named no unit and was handed a random kind"
NONE_RECRUITABLE = "SPINE a spawn row named no unit and the faction could recruit none"
# with no unit named: the game's own list of what the faction may recruit now, and a row's id
RECRUITABLE, ITS_ID = "ent.Faction.getRecruitableUnits", "id"
PICK = "a random recruitable kind"
# and a fourth, for the parameter, said where the bundle is made
HANDED_OVER = "SPINE a spawn row handed the door a trait"
# what the door is called ON, named as the class it is
CALLED_ON = "ent.Structure"
# EVERY TRAIT PAST THE FIRST: the door's own call for its one (TAKES, the faction third), after it
APPLY, APPLY_TAKES, FACTION_AT = "logic.TraitsManager.apply", 7, 2
ANOTHER = "SPINE a spawn row gave a unit another trait"
# a row's value is a FRACTION: the counter is a whole-number place, the value converted in


def check_what_we_borrow(bc):
    """Each borrowed function takes what we are about to hand it, or the build stops."""
    from tools.hlcode import name_of_kind
    for door, takes in ((RECRUIT, TAKES), (APPLY, APPLY_TAKES)):
        kinds = argument_kinds(bc, door)
        guard(len(kinds) == takes,
              "%s takes %d argument(s) and this hands it %d" % (door, len(kinds), takes))
    # `SpawnNotTUnit` weighs two unit kinds as texts
    unit = name_of_kind(bc, argument_kinds(bc, RECRUIT)[NAMED])
    guard(unit == "String", "a unit kind is a %s, not a text to weigh" % unit)


def emit_act(place):
    """One call per unit the row asks for, at the road's base, if the row named THIS act."""
    mine = place.scratch_like(place.row[WHICH])
    past = place.here("this row names another act")
    nowhere = place.here("this row has no main base to spawn at")
    out = [place.op("Int", dst=mine, ptr=place.number(NUMBER)),
           (place.op("JNotEq", a=place.row[WHICH], b=mine), past)]
    out += _asking(place, ENTERED)
    # ⛔ THE DOOR'S ARGUMENT PLACES ARE MADE HERE, ONCE, so filling and call share them
    args = [place.scratch_arg(RECRUIT, which) for which in range(TAKES)]
    # the structure it is called on, in a place of its own kind: the road's base, else the payee's
    base = place.scratch_of(CALLED_ON)
    out += (_shared(place, (BASED, _basing), [place.row[PAYEE], place.row[THE_BASE]], base)
            or [place.op("Mov", dst=base, src=place.row[THE_BASE])])
    # no base, no faction, or no unit named nor recruitable: one test each, and not a fault
    out += [(place.op("JNull", reg=base), nowhere)] + _the_unit(place, args[NAMED])
    out += [(place.op("JNull", reg=args[NAMED]), nowhere)]
    out += _handing_over(place, args) + _one_call_per_unit(place, base, args) + [
        (place.op("JAlways",), past),
        nowhere + ":", place.op("Label")] + _asking(place, NO_BASE) + [
        past + ":", place.op("Label")]
    return out


def _handing_over(place, args):
    """The four the call is given (the refusal a reference to a falsehood) and three it is not."""
    told = place.scratch_return(ANSWERS_A_TRUTH)
    out = [place.op("Bool", dst=told, value=False),
           place.op("Ref", dst=args[REFUSAL], src=told),
           place.op("Mov", dst=args[FOR_WHOM], src=place.row[PAYEE])]
    # the rest the game fills when handed nothing; a parameter fills the last, `Here` the spot
    for which in range(REFUSAL + 1, TAKES):
        if which not in (MODE, POSITION):
            out.append(place.op("Null", dst=args[which]))
    # and a unit given a spot comes straight onto it
    return out + _with_what_the_row_said(place, args) + _here(place, args[POSITION]) + (_shared(
        place, (ARRIVING, _arriving), [args[POSITION]], args[MODE])
        or [place.op("Null", dst=args[MODE])])


def _shared(place, job, handed, into):
    """One call to our shared `job` (name, body) over `handed`; None on a case's Void road."""
    kinds = [place.kind_of(r) for r in handed]
    # ⛔ A CASE'S ROAD OVER VOID PLACES: a function made for it would land in the game file
    if 0 in kinds + [place.kind_of(into)]:
        return None
    made = place._hands["shared"]((job[0],) + tuple(kinds), kinds, place.kind_of(into), job[1])
    return [place.op("CallN", dst=into, fun=made, args=handed)]


def _basing(hands):
    """The road's main base; else, only the faction's road bringing one, the payee's own."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    from framework.storewalk import THE_BASE_THROUGH
    at = Place(BASED, {}, {}, None, None, None, "%s: done" % BASED, hands)
    payee, base, done = 0, 1, at.here("done")
    return assemble([
        (at.op("JNotNull", reg=base), done),
        (at.op("JNull", reg=payee), done),
        at.op("Call1", dst=base, fun=at.named_function(THE_BASE_THROUGH), arg0=payee),
        done + ":", at.op("Label"), at.op("Ret", ret=base)])


def _arriving(hands):
    """How a unit arrives: on a spot, the mode the game's abilities use; else the usual way."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    at = Place(ARRIVING, {}, {}, None, None, None, "%s: done" % ARRIVING, hands)
    mode, done = at.scratch_arg(RECRUIT, MODE), at.here("done")
    return assemble([
        at.op("Null", dst=mode),
        (at.op("JNull", reg=0), done),
        at.op("GetGlobal", **{"dst": mode, "global": _no_shuttle(at._hands["bc"]())}),
        done + ":", at.op("Label"), at.op("Ret", ret=mode)])


def _no_shuttle(bc):
    """The one spawn mode `RECRUIT` skips its shuttle for, read off the game's own test."""
    from tools.hlcode import enum_case, function_named, kind_named
    enum_case(bc, SPAWN_MODE, DIRECT)
    fn, mode = function_named(bc, RECRUIT), kind_named(bc, SPAWN_MODE)
    # the mode it is handed sits after `this`; the one it skips for is the one compared with it
    handed = 1 + argument_kinds(bc, RECRUIT).index(mode)
    read = {gv(op.df["global"]) for op, nxt in zip(fn.ops, fn.ops[1:])
            if op.op == "GetGlobal" and gv(fn.regs[gv(op.df["dst"])]) == mode
            and nxt.op == "JEq" and {gv(nxt.df["a"]), gv(nxt.df["b"])} == {
                handed, gv(op.df["dst"])}}
    guard(len(read) == 1, "%s tests its spawn mode against %d modes, expected the one it skips "
          "the shuttle for" % (RECRUIT, len(read)))
    return read.pop()


def _the_unit(place, into):
    """The unit the row names, else a random kind its faction may recruit; none, nothing."""
    handed = [place.row["columns.named"], place.row[PAYEE], place.row[TURNED]]
    kinds = [place.kind_of(r) for r in handed]
    # ⛔ A CASE'S ROAD OVER VOID PLACES: a pick made for it would land in the game file
    if 0 in kinds + [place.kind_of(into)]:
        return [place.op("Mov", dst=into, src=handed[0])]
    pick = place._hands["shared"]((PICK,) + tuple(kinds), kinds, place.kind_of(into),
                                  _picking)
    return [place.op("CallN", dst=into, fun=pick, args=handed)]


def _picking(hands):
    """The unit named; else a recruitable kind's id, picked again while it is the one turned."""
    from tools.hlcode import assemble
    from framework.acts.start_quest import SAME, SHUFFLE
    from framework.pipeline import Place
    from framework.rowreader import READ_COLUMN
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    at = Place(PICK, {}, {}, None, None, None, "%s: done" % PICK, hands)
    named, faction, turned, listed = 0, 1, 2, at.scratch_return(RECRUITABLE)
    unit = at.scratch_arg(RECRUIT, NAMED)
    count_at, count = at.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = at.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    zero, picked = at.scratch_like(count), at.scratch_return(SHUFFLE)
    tries, most, same = at.scratch_like(count), at.scratch_like(count), at.scratch_return(SAME)
    got, cell = at.scratch_of("Dyn"), at.scratch_arg(READ_COLUMN, 1)
    read, none = at.scratch_return(READ_COLUMN), at.here("none recruitable")
    nobody, given = at.here("no faction"), at.here("the unit named")
    pick, again, landed = (at.here("a random kind, %s" % w) for w in ("asked", "again", "kept"))
    return assemble([
        at.op("Mov", dst=unit, src=named),
        (at.op("JNull", reg=faction), nobody),
        at.op("Int", dst=zero, ptr=at.number(0)),
        (at.op("JNull", reg=unit), pick),
        (at.op("JEq", a=turned, b=zero), given),
        pick + ":", at.op("Label"),
        at.op("Call1", dst=listed, fun=at.named_function(RECRUITABLE), arg0=faction),
        (at.op("JNull", reg=listed), none),
        at.op("Field", dst=count, obj=listed, field=count_at),
        (at.op("JSGte", a=zero, b=count), none),
        at.op("Field", dst=backing, obj=listed, field=backing_at),
        at.op("Int", dst=tries, ptr=at.number(0)),
        at.op("Int", dst=most, ptr=at.number(TRIES)),
        again + ":", at.op("Label"),
        (at.op("JSGte", a=tries, b=most), none),
        at.op("Incr", dst=tries),
        at.op("Call1", dst=picked, fun=at.named_function(SHUFFLE), arg0=count),
        at.op("GetArray", dst=got, array=backing, index=picked),
        (at.op("JNull", reg=got), none),
        at.op("GetGlobal", **{"dst": cell, "global": at.text_object(ITS_ID)}),
        at.op("Call2", dst=read, fun=at.named_function(READ_COLUMN), arg0=got, arg1=cell),
        (at.op("JNull", reg=read), none),
        at.op("SafeCast", dst=unit, src=read),
        # ⛔ `SpawnNotTUnit`: the named kind is never the one handed back
        (at.op("JNull", reg=named), landed),
        (at.op("JEq", a=turned, b=zero), landed),
        at.op("Call2", dst=same, fun=at.named_function(SAME), arg0=unit, arg1=named),
        (at.op("JEq", a=same, b=zero), again),
        landed + ":", at.op("Label")] + _asking(at, PICKED) + [
        given + ":", at.op("Label"),
        at.op("Ret", ret=unit),
        none + ":", at.op("Label")] + _asking(at, NONE_RECRUITABLE) + [
        nobody + ":", at.op("Label"),
        at.op("Null", dst=unit),
        at.op("Ret", ret=unit)])


def _with_what_the_row_said(place, args):
    """The bundle the door takes last, made only when a row spelled a parameter: its FIRST trait."""
    past = place.here("this row hands the door nothing")
    where, _holds = place.field_of(args[THE_BUNDLE], THE_TRAIT_IN_IT)
    first, trait = place.scratch_like(place.row[WHICH]), place.scratch_arg(APPLY, 0)
    return _unless_it_spelled_traits(place, past) + [
        place.op("Int", dst=first, ptr=place.number(0)),
    ] + _the_trait_at(place, first, trait, past) + [
        place.op("New", dst=args[THE_BUNDLE]),
        place.op("SetField", obj=args[THE_BUNDLE], field=where, src=trait),
    ] + _asking(place, HANDED_OVER) + [
        past + ":", place.op("Label"),
    ]


def _unless_it_spelled_traits(place, past):
    """Leave for `past` unless the row spelled `WithTrait`."""
    spelled = place.row["name.%s" % PARAMETER]
    spare = place.scratch_like(spelled)
    return [
        place.op("Int", dst=spare, ptr=place.number(NOTHING_SPELLED)),
        (place.op("JEq", a=spelled, b=spare), past),
        place.op("Int", dst=spare, ptr=place.number(parameter_number("WithTrait"))),
        (place.op("JNotEq", a=spelled, b=spare), past)]


def _here(place, at):
    """The spot the door puts the unit on: one shared call, so the act grows by nothing."""
    handed = [place.row["name.%s" % PARAMETER], place.row[placed.THING],
              place.row[placed.APPLICATION]]
    kinds = [place.kind_of(r) for r in handed]
    # ⛔ A CASE'S ROAD OVER VOID PLACES: a pick made for it would land in the game file
    if 0 in kinds + [place.kind_of(at)]:
        return [place.op("Null", dst=at)]
    spot = place._hands["shared"]((HERE,) + tuple(kinds), kinds, place.kind_of(at), _spotting)
    return [place.op("CallN", dst=at, fun=spot, args=handed)]


def _spotting(hands):
    """`Here`: a free spot by the act's thing, or anywhere free in its region; else the rally."""
    from tools.hlcode import assemble
    from framework.pipeline import Place
    at = Place(HERE, {placed.THING: 1, placed.APPLICATION: 2}, {}, None, None, None,
               "%s: done" % HERE, hands)
    spot, into, done = at.scratch_arg(RECRUIT, POSITION), at.scratch_return(READ), at.here("done")
    spare, area = at.scratch_like(0), at.field_of(placed.ZONE, AREA)

    def beside(asked, needs=()):
        def body(it, done):
            point, rest = at.scratch_return(asked), [at.scratch_arg(asked, i)
                                                    for i in range(SPOT_TAKES)]
            return [op for f, held in needs for op in (
                at.op("Field", dst=held, obj=it, field=f), (at.op("JNull", reg=held), done))] + [
                at.op("Null", dst=r) for r in rest] + [
                at.op("Call4", dst=point, fun=at.named_function(asked), arg0=it,
                      arg1=rest[0], arg2=rest[1], arg3=rest[2]),
                (at.op("JNull", reg=point), done),
                at.op("ToVirtual", dst=spot, src=point)] + _asking(at, PLACED) + [
                (at.op("JAlways"), done)]
        return body

    return assemble([
        at.op("Null", dst=spot),
        at.op("Int", dst=spare, ptr=at.number(parameter_number("Here"))),
        (at.op("JNotEq", a=0, b=spare), done)] + placed.emit_where(at, into) + (
        placed.emit_each_kind(at, into, ((placed.ENTITY, beside(BESIDE)),
                                         (placed.ZONE, beside(ANYWHERE_IN, (area,)))), [])) + [
        done + ":", at.op("Label"), at.op("Ret", ret=spot)])


def _the_trait_at(place, at, trait, gone):
    """The trait the row's `at`-th `WithTrait` names, into `trait`; none there leaves for `gone`."""
    return columns.emit_entry(place, place.row[columns.PART_FOR_PARAMETER], at, trait, gone)


def _the_next_trait(place, made, nxt, step, bottom):
    """Trait `nxt` put on the unit just made, the door's own way; none left sets `nxt` to 0."""
    trait, traits = place.scratch_arg(APPLY, 0), place.scratch_return(TRAITS_OF)
    given = [place.scratch_arg(APPLY, which) for which in range(1, APPLY_TAKES)]
    applied = place.scratch_return(APPLY)
    done = place.here("this unit is born with every trait")
    nothing = [place.op("Null", dst=one) for i, one in enumerate(given) if i != FACTION_AT - 1]
    return _unless_it_spelled_traits(place, done) + [
        (place.op("JNull", reg=made), done),
    ] + _the_trait_at(place, nxt, trait, done) + [
        place.op("Call1", dst=traits, fun=place.named_function(TRAITS_OF), arg0=made),
        (place.op("JNull", reg=traits), done),
    ] + nothing + [
        place.op("Mov", dst=given[FACTION_AT - 1], src=place.row[PAYEE]),
        place.op("CallN", dst=applied, fun=place.named_function(APPLY),
                 args=[traits, trait] + given),
    ] + _asking(place, ANOTHER) + [
        place.op("Add", dst=nxt, a=nxt, b=step),
        (place.op("JAlways",), bottom),
        done + ":", place.op("Label"),
        place.op("Int", dst=nxt, ptr=place.number(0))]


def _one_call_per_unit(place, base, args):
    """The row's number of calls at `base`, counted out. A row saying nothing spawns nothing."""
    # all are taken like a place holding a whole number, never like the row's value
    at, step, how_many, nxt, zero = (place.scratch_like(place.row[WHICH]) for _ in range(5))
    made = place.scratch_return(RECRUIT)
    again = place.here("the next unit this row asks for")
    enough = place.here("this row has spawned all it asks for")
    giving, bottom = place.here("a trait for the unit just made"), place.here("round again")
    first = place.here("the first unit, its kind already picked")
    # the structure it is called on goes first
    handed = [base] + args
    # ONE LOOP, TWO STEPS: `nxt` 0 spawns the next unit, above 0 gives the last one that trait
    return forwhom.counted(place, how_many) + forwhom.scaled(place, how_many) + [
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=nxt, ptr=place.number(0)),
        place.op("Int", dst=zero, ptr=place.number(0)),
        place.op("Int", dst=step, ptr=place.number(1)),
        again + ":", place.op("Label"),
        (place.op("JNotEq", a=nxt, b=zero), giving),
        (place.op("JSGte", a=at, b=how_many), enough),
        # ⛔ ONE PICK PER UNIT: `SpawnUnits` with `val` 3 is three random kinds, not three of one
        (place.op("JEq", a=at, b=zero), first),
    ] + _the_unit(place, args[NAMED]) + [
        (place.op("JNull", reg=args[NAMED]), enough),
        first + ":", place.op("Label"),
        place.op("CallN", dst=made, fun=place.named_function(RECRUIT), args=handed),
    ] + _asking(place, SPAWNED) + [
        place.op("Add", dst=at, a=at, b=step),
        place.op("Mov", dst=nxt, src=step),
        (place.op("JAlways",), bottom),
        giving + ":", place.op("Label"),
    ] + _the_next_trait(place, made, nxt, step, bottom) + [
        bottom + ":", place.op("Label"),
        (place.op("JAlways",), again),
        enough + ":", place.op("Label"),
    ]


def _asking(place, word):
    """One word, said where a question is about, and taken out with the answer."""
    return place.said("respath", lambda: place.said_now(word))


def install(bc):
    """Nothing to mint: the act borrows one function and reads five parts of a row."""
    check_what_we_borrow(bc)
    return ("SPAWN UNITS: one call to `%s` per unit a row asks for, at the main base the road "
            "worked out -- the first act whose column names a unit and the first whose result "
            "nothing reconciles" % RECRUIT)
