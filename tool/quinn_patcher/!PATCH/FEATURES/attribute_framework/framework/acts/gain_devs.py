"""`add-developments`: the named development, else `val` random researchable ones, for free."""
from tools.project import guard
from tools.hlcode import argument_kinds
from framework import columns, forwhom
from framework.acts.gain_res import PAYEE, WHICH
from framework.foreignwalk import EVERY_ONE, FROM_FOREIGN, HOW_MANY, WHOSE_RULE
from framework.modifiers import ofdomain
from framework.narrowcount import LEFT_OUT, PICKED, every_group_mark
from framework.parammatch import NAMED as PARAMETER, number_of as parameter_number

STAGE = "add-developments"
NUMBER = 6
# its own loops, the store-walk check adds up: picks; out or among names 2 walks, 2 kinds of re-pick
LOOPS = 8
# the faction's developments, and the game's own four steps its effects take on them
THROUGH = "ent.Faction.get_developments"
VALID = "logic.faction.Developments.getValidDevelopmentKind"
HAS = "logic.faction.Developments.has"
ACQUIRE = "logic.faction.Developments.acquireDevelopment"
# handed a domain id or nothing; answers nothing once no development is left to research
RANDOM = "logic.faction.Developments.getRandomResearchableDev"
PICKED_ID, DOMAIN = "id", "domain"
# what is researchable now, of one domain or of all: how a left-out domain is known to leave any
LIST = "logic.faction.Developments.getResearchableDevs"
# `AnyTier`: the same two, over every development of the faction's own tree it does not own
ANY_TIER = "AnyTier"
MISSING = "logic.faction.Developments.getRandomMissingDev"
MISSING_LIST = "logic.faction.Developments.getMissingDevs"
# where the effect's own `OfTDomain` group opens in the row's names, found without a loop of ours
FIND = "hl.types.ArrayObj.indexOf"
# what the group's read says when it holds several names: the pick is from any of them
SEVERAL = 2
# what each takes past the thing it is called on
TAKES = ((THROUGH, 0), (VALID, 1), (HAS, 1), (ACQUIRE, 1), (RANDOM, 1), (FIND, 2), (LIST, 1),
         (MISSING, 1), (MISSING_LIST, 1))
OWNER_PICKS = (WHOSE_RULE, FROM_FOREIGN, EVERY_ONE, HOW_MANY)
# `GainNotTDev`: the pick is made again while it lands on the named one, this many times at most
TURNED, TRIES = "effect.turned", 16
READS = (PAYEE, "columns.named", "value", forwhom.JUST_ONE, WHICH, "name.%s" % PARAMETER,
         columns.PART_FOR_COUNT, TURNED) + OWNER_PICKS
# the words said while `respath` is on, one per way out
ENTERED = "SPINE a development row reached the acquiring act"
GAINED = "SPINE a development row acquired a development"
OWNED = "SPINE a development row named one the faction owns"
EMPTY = "SPINE a development row found nothing left to research"
NOBODY = "SPINE a development row had no faction to give it to"


def check_what_we_borrow(bc):
    """Each borrowed function takes what this hands it, or the build stops."""
    from tools.hlcode import name_of_kind
    for name, takes in TAKES:
        got = len(argument_kinds(bc, name))
        guard(got == takes, "%s takes %d argument(s) and this hands it %d" % (name, got, takes))
    # `GainNotTDev` weighs two developments as texts
    kind = name_of_kind(bc, argument_kinds(bc, ACQUIRE)[0])
    guard(kind == "String", "a development is a %s, not a text to weigh" % kind)


def emit_act(place):
    """The named development, or the row's number of random ones, if the row named THIS act."""
    return acting(place, NUMBER, ENTERED, NOBODY, [], _acquired, _random_ones)


def acting(place, number, entered, nobody_word, prelude, give, randomly):
    """Gate on `number`, find the faction's developments, then `give` the named one or pick."""
    mine = place.scratch_like(place.row[WHICH])
    past = place.here("this row names another act")
    nobody = place.here("this row has no faction to give a development to")
    random = place.here("this row names no development, so it picks")
    developments = place.scratch_return(THROUGH)
    unturned = place.scratch_like(place.row[TURNED])
    return [place.op("Int", dst=unturned, ptr=place.number(0)),
            place.op("Int", dst=mine, ptr=place.number(number)),
            (place.op("JNotEq", a=place.row[WHICH], b=mine), past),
            ] + _asking(place, entered) + (prelude(past) if callable(prelude) else prelude) + [
            (place.op("JNull", reg=place.row[PAYEE]), nobody),
            place.op("Call1", dst=developments, fun=place.named_function(THROUGH),
                     arg0=place.row[PAYEE]),
            (place.op("JNull", reg=developments), nobody),
            (place.op("JNull", reg=place.row["columns.named"]), random),
            (place.op("JNotEq", a=place.row[TURNED], b=unturned), random),
            ] + the_named_one(place, developments, past, give) + [
            random + ":", place.op("Label"),
            ] + randomly(place, developments) + [
            (place.op("JAlways"), past),
            nobody + ":", place.op("Label")] + _asking(place, nobody_word) + [
            past + ":", place.op("Label")]


def _acquired(place, developments, kind):
    """The game's own free acquiring of `kind`."""
    got = place.scratch_return(ACQUIRE)
    return [place.op("Call2", dst=got, fun=place.named_function(ACQUIRE), arg0=developments,
                     arg1=kind)] + _asking(place, GAINED)


def the_named_one(place, developments, past, give):
    """The faction's own version of the named development, unless it owns it already."""
    kind = place.scratch_return(VALID)
    owned = place.scratch_return(HAS)
    already = place.here("the faction owns the named development")
    return [place.op("Call2", dst=kind, fun=place.named_function(VALID), arg0=developments,
                     arg1=place.row["columns.named"]),
            place.op("Call2", dst=owned, fun=place.named_function(HAS), arg0=developments,
                     arg1=kind),
            (place.op("JTrue", cond=owned), already),
            ] + give(place, developments, kind) + [
            (place.op("JAlways"), past),
            already + ":", place.op("Label")] + _asking(place, OWNED) + [
            (place.op("JAlways"), past)]


def any_tier(place):
    """A place holding `AnyTier`'s own number, to weigh the row's parameter against."""
    held = place.scratch_like(place.row["name.%s" % PARAMETER])
    return held, [place.op("Int", dst=held, ptr=place.number(parameter_number(ANY_TIER)))]


def _pick(place, dst, researchable, missing, developments, arg, wide, tag):
    """`dst` from `researchable`, or from `missing` when the row's parameter is `AnyTier`."""
    other, done = place.here("%s, any tier's" % tag), place.here("%s, asked" % tag)
    return [(place.op("JEq", a=place.row["name.%s" % PARAMETER], b=wide), other),
            place.op("Call2", dst=dst, fun=place.named_function(researchable), arg0=developments,
                     arg1=arg),
            (place.op("JAlways"), done),
            other + ":", place.op("Label"),
            place.op("Call2", dst=dst, fun=place.named_function(missing), arg0=developments,
                     arg1=arg),
            done + ":", place.op("Label")]


def picking(place, developments, wide):
    """The pick's places and its domain read; then `one(empty)` puts one pick into `picked`."""
    left_out, first = (place.scratch_like(place.row[WHICH]) for _ in range(2))
    domain = place.scratch_arg(RANDOM, 0)
    picked = place.scratch_return(RANDOM)
    zero = place.scratch_like(place.row[WHICH])

    def one(empty):
        return _never_the_named(place, developments, picked, lambda: once(empty), empty)

    def once(empty):
        plain = place.here("development pick, unturned")
        turned = place.here("development pick, its names left out")
        return _pick(place, picked, RANDOM, MISSING, developments, domain, wide, "a pick") + [
            (place.op("JNull", reg=picked), empty),
            place.op("Int", dst=zero, ptr=place.number(0)),
            (place.op("JEq", a=left_out, b=zero), plain),
            place.op("Int", dst=zero, ptr=place.number(SEVERAL)),
            (place.op("JNotEq", a=left_out, b=zero), turned),
        ] + _elsewhere(place, developments, first, picked, empty, wide, among=True) + [
            (place.op("JAlways"), plain),
            turned + ":", place.op("Label"),
        ] + _elsewhere(place, developments, first, picked, empty, wide) + [
            plain + ":", place.op("Label")]
    return the_domain(place, domain, left_out, first), picked, one


def _never_the_named(place, developments, picked, pick, empty):
    """`pick()` into `picked`, made again while `Not` turned the row and it is the named one."""
    from framework.acts.start_quest import SAME
    tries, most, zero = (place.scratch_like(place.row[TURNED]) for _ in range(3))
    kind, same = place.scratch_return(VALID), place.scratch_return(SAME)
    id_at, its_id = place.field_of(picked, PICKED_ID)
    again, kept = place.here("a pick, again"), place.here("a pick, not the named one")
    return [place.op("Int", dst=tries, ptr=place.number(0)),
            place.op("Int", dst=most, ptr=place.number(TRIES)),
            place.op("Int", dst=zero, ptr=place.number(0)),
            again + ":", place.op("Label"),
            (place.op("JSGte", a=tries, b=most), empty),
            place.op("Incr", dst=tries)] + pick() + [
        (place.op("JEq", a=place.row[TURNED], b=zero), kept),
        (place.op("JNull", reg=place.row["columns.named"]), kept),
        place.op("Call2", dst=kind, fun=place.named_function(VALID), arg0=developments,
                 arg1=place.row["columns.named"]),
        place.op("Field", dst=its_id, obj=picked, field=id_at),
        place.op("Call2", dst=same, fun=place.named_function(SAME), arg0=its_id, arg1=kind),
        (place.op("JEq", a=same, b=zero), again),
        kept + ":", place.op("Label")]


def _random_ones(place, developments):
    """The row's number of picks, each from what is researchable now; a blank `val` picks none."""
    at, step, how_many = (place.scratch_like(place.row[WHICH]) for _ in range(3))
    wide, widening = any_tier(place)
    reading, picked, one = picking(place, developments, wide)
    id_at, its_id = place.field_of(picked, PICKED_ID)
    again, enough, empty = (place.here("development picks, %s" % what)
                            for what in ("the next", "all made", "none left"))
    return widening + reading + forwhom.counted(place, how_many) + forwhom.scaled(
        place, how_many) + [
        place.op("Int", dst=at, ptr=place.number(0)),
        place.op("Int", dst=step, ptr=place.number(1)),
        again + ":", place.op("Label"),
        (place.op("JSGte", a=at, b=how_many), enough),
    ] + one(empty) + [
        place.op("Field", dst=its_id, obj=picked, field=id_at),
    ] + _acquired(place, developments, its_id) + [
        place.op("Add", dst=at, a=at, b=step),
        (place.op("JAlways"), again),
        empty + ":", place.op("Label")] + _asking(place, EMPTY) + [
        enough + ":", place.op("Label")]


def the_domain(place, domain, left_out, first):
    """The group's one name into `domain`; turned or several, none and names from `first`."""
    listed = place.row[columns.PART_FOR_COUNT]
    mark, start = place.scratch_like(domain), place.scratch_arg(FIND, 1)
    at, zero = place.scratch_return(FIND), place.scratch_return(FIND)
    named, left = place.scratch_like(domain), place.scratch_like(domain)
    after, other = place.scratch_like(at), place.scratch_like(domain)
    stops = [(text, place.scratch_like(domain)) for text in every_group_mark()]
    done, kept = place.here("the pick's domain"), place.here("the pick's domain, named")
    alone = place.here("the pick's domain, the only one named")
    return [
        place.op("Null", dst=domain),
        place.op("Int", dst=left_out, ptr=place.number(0)),
        place.op("Int", dst=first, ptr=place.number(0)),
        (place.op("JNull", reg=listed), done),
        place.op("GetGlobal", **{"dst": mark, "global": place.text_object(
            PICKED % ofdomain.WORD)}),
        place.op("GetGlobal", **{"dst": left, "global": place.text_object(
            LEFT_OUT % ofdomain.WORD)}),
        place.op("Null", dst=start),
        place.op("Call3", dst=at, fun=place.named_function(FIND), arg0=listed, arg1=mark,
                 arg2=start),
        place.op("Int", dst=zero, ptr=place.number(0)),
        (place.op("JSLt", a=at, b=zero), done),
        place.op("Incr", dst=at),
    ] + columns.emit_entry(place, listed, at, named, done) + [
        (place.op("JNotEq", a=named, b=left), kept),
        place.op("Int", dst=left_out, ptr=place.number(1)),
        place.op("Incr", dst=at),
        place.op("Mov", dst=first, src=at),
        (place.op("JAlways"), done),
        kept + ":", place.op("Label"),
        place.op("Mov", dst=domain, src=named),
        # ⛔ A SECOND NAME IN THE GROUP: the pick is from any of them, so no one domain is handed
        place.op("Mov", dst=after, src=at),
        place.op("Incr", dst=after),
    ] + columns.emit_entry(place, listed, after, other, alone) + [
        place.op("GetGlobal", **{"dst": stop, "global": place.text_object(text)})
        for text, stop in stops] + [
        (place.op("JEq", a=other, b=stop), alone) for _text, stop in stops] + [
        place.op("Null", dst=domain),
        place.op("Int", dst=left_out, ptr=place.number(SEVERAL)),
        place.op("Mov", dst=first, src=at),
        alone + ":", place.op("Label"),
        done + ":", place.op("Label")]


# each label of the two walks, by whether the pick must land among the names or outside them
WALKS = {False: ("researchable inside", "a left-out domain's list", "a pick outside, asked",
                 "a pick outside, again", "a pick again", "a pick inside", None),
         True: ("researchable among its names", "a named domain's list", "a pick among, asked",
                "a pick among, again", "a pick among, again picked", "a pick among its names",
                "a pick among its names, kept")}


def _elsewhere(place, developments, first, picked, empty, wide, among=False):
    """`picked` again until its domain is none of the names from `first` (`among`: one of them)."""
    from framework.rowreader import READ_COLUMN
    from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
    listed = place.row[columns.PART_FOR_COUNT]
    stops = [place.scratch_arg(RANDOM, 0) for _ in every_group_mark()]
    name, nothing = place.scratch_arg(RANDOM, 0), place.scratch_arg(RANDOM, 0)
    at = place.scratch_like(first)
    got, researchable = place.scratch_return(READ_COLUMN), place.scratch_return(LIST)
    count_at, how_many = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    names_at, names = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    backing_at, backing = place.field_of(ARRAY_OF_ENTRIES, BACKING_ON)
    left_at, left = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    every_at, every = place.field_of(ARRAY_OF_ENTRIES, COUNT_ON)
    domain_at, its_domain = place.field_of(picked, DOMAIN)

    def each_name(tag, body):
        """`body(done)` per name of the group from `first`, past each one's step to `done`."""
        step, over = place.here("%s, the next name" % tag), place.here("%s, all named" % tag)
        past = place.here("%s, past this name" % tag)
        return [place.op("Mov", dst=at, src=first),
                place.op("Field", dst=names, obj=listed, field=names_at),
                place.op("Field", dst=backing, obj=listed, field=backing_at),
                step + ":", place.op("Label"),
                (place.op("JSGte", a=at, b=names), over),
                place.op("GetArray", dst=got, array=backing, index=at),
                place.op("Incr", dst=at),
                (place.op("JNull", reg=got), past),
                place.op("UnsafeCast", dst=name, src=got),
                ] + [(place.op("JEq", a=name, b=stop), over) for stop in stops] + body(past) + [
                past + ":", place.op("Label"),
                (place.op("JAlways"), step),
                over + ":", place.op("Label")]

    counting, listing, asked, again_at, picking_again, checking, keeping = WALKS[among]

    def counted(past):
        return _pick(place, researchable, LIST, MISSING_LIST, developments, name, wide,
                     listing) + [
                (place.op("JNull", reg=researchable), past),
                place.op("Field", dst=how_many, obj=researchable, field=count_at),
                place.op("Add", dst=left, a=left, b=how_many)]

    retry, again = place.here(asked), place.here(again_at)
    kept = place.here(keeping) if among else again

    def inside(past):
        return [(place.op("JNotEq", a=its_domain, b=name), past), (place.op("JAlways"), kept)]
    # AMONG ITS NAMES, none researchable in any is empty; OUTSIDE, all researchable inside them
    if among:
        none = place.scratch_like(left)
        enough = [place.op("Int", dst=none, ptr=place.number(0)),
                  (place.op("JEq", a=left, b=none), empty)]
    else:
        enough = _pick(place, researchable, LIST, MISSING_LIST, developments, nothing, wide,
                       "every list") + [
            (place.op("JNull", reg=researchable), empty),
            place.op("Field", dst=every, obj=researchable, field=every_at),
            (place.op("JSGte", a=left, b=every), empty)]
    landed = [(place.op("JAlways"), again), kept + ":", place.op("Label")] if among else []
    return [place.op("GetGlobal", **{"dst": stop, "global": place.text_object(text)})
            for text, stop in zip(every_group_mark(), stops)] + [
        place.op("Null", dst=nothing),
        place.op("Int", dst=left, ptr=place.number(0)),
    ] + each_name(counting, counted) + enough + [
        (place.op("JAlways"), retry),
        again + ":", place.op("Label"),
    ] + _pick(place, picked, RANDOM, MISSING, developments, nothing, wide, picking_again) + [
        (place.op("JNull", reg=picked), empty),
        retry + ":", place.op("Label"),
        place.op("Field", dst=its_domain, obj=picked, field=domain_at),
    ] + each_name(checking, inside) + landed


def _asking(place, word):
    """One word, said where a question is about, and taken out with the answer."""
    return place.said("respath", lambda: place.said_now(word))


def install(bc):
    """Check the nine calls this borrows; the road runs this act in the game."""
    check_what_we_borrow(bc)
    return ("ADD DEVELOPMENTS: `%s` on the named one unless `%s`, else `%s` (`%s` for `%s`) "
            "then `%s` per pick" % (ACQUIRE, HAS, RANDOM, MISSING, ANY_TIER, ACQUIRE))
