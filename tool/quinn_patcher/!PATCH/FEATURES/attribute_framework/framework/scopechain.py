#!/usr/bin/env python3
"""Which of a road's words a row named, asked by one call: a function per word, none per gate."""
from copy import deepcopy

from tools.project import gv, guard
from tools.hlcode import SHARED_ON, assemble, kind_named, slot_global, written

# what one word's function is called, and the one that ends a road's chain
CHECK, LAST_CHECK = "scope check, %s", "scope check, nothing more"
# what one answers: the row named a word and the thing passed its question, or it did not
PASSES, REFUSED = 1, 0
# the road's table, one asking word's question, and the function filing it under its number
TABLE, QUESTION, FILED = "the `%s` road's questions", "a scope's question, %s", "filed, %s"
# each road's one shape of question, so every entry is handed back as the same kind
KINDS_ON = "_spine_scope_question_kinds"


def emit_named(place, road, chain, part, mine, questions, through):
    """Each word of `chain` matched against the row and asked; inline on a Void road."""
    parts = [p for p in place.row if place.row[p] is not None]
    kinds = [place.kind_of(place.row[p]) for p in parts]
    if 0 in kinds:
        return _inline(place, chain, part, mine, questions, through)
    answer, none = place.scratch_of("I32"), place.scratch_of("I32")
    return _calling(place, road, chain, part, mine, questions, parts, kinds, answer) + [
        place.op("Int", dst=none, ptr=place.number(REFUSED)),
        (place.op("JEq", a=answer, b=none), place.refused),
        through + ":", place.op("Label")]


def _inline(place, chain, part, mine, questions, through):
    """The words one after another in the gate itself, for a road no function may be handed."""
    wanted, out = place.scratch_like(place.row[part]), []
    for spelling in chain:
        not_this = place.here("it is not `%s`" % spelling)
        out += [place.op("Int", dst=wanted, ptr=place.number(mine[spelling])),
                (place.op("JNotEq", a=place.row[part], b=wanted), not_this)]
        out += questions(place, spelling) + [(place.op("JAlways"), through),
                                             not_this + ":", place.op("Label")]
    # nothing this road answers for was named -- said, never silent
    return out + [(place.op("JAlways"), place.refused), through + ":", place.op("Label")]


def _calling(place, road, chain, part, mine, questions, parts, kinds, answer):
    """A call to the first word's function, which calls the next when the row named another."""
    from framework.parsed import loaded
    from framework.pipeline import Place
    renamed = place.looked["renamed"]
    named = CHECK % chain[0] if chain else LAST_CHECK
    key = ((named,) + tuple(str(one) for one in road)
           + (("after the trigger",) if renamed else ()) + tuple(kinds))

    def body(hands):
        made = Place(named, {p: i for i, p in enumerate(parts)}, {}, None, None, None,
                     "%s: refused" % named, hands)
        made.looked["renamed"] = renamed
        said, ops = made.scratch_of("I32"), []
        if chain:
            not_this = made.here("it is not `%s`" % chain[0])
            wanted = made.scratch_like(made.row[part])
            ops = [made.op("Int", dst=wanted, ptr=made.number(mine[chain[0]])),
                   (made.op("JNotEq", a=made.row[part], b=wanted), not_this)] + questions(
                made, chain[0]) + [made.op("Int", dst=said, ptr=made.number(PASSES)),
                                   made.op("Ret", ret=said), not_this + ":", made.op("Label")]
            ops += _calling(made, road, chain[1:], part, mine, questions, parts, kinds,
                            said) + [made.op("Ret", ret=said)]
        return assemble(loaded(made, ops) + [
            made.refused + ":", made.op("Label"),
            made.op("Int", dst=said, ptr=made.number(REFUSED)), made.op("Ret", ret=said)])
    shared = place._hands["shared"](key, kinds, place.kind_of(answer), body)
    return [place.op("CallN", dst=answer, fun=shared, args=[place.row[p] for p in parts])]


def _map():
    from framework.acts.gain_res_prod import MAKE, MAP, READ, TELL
    return MAP, MAKE, READ, TELL


def install(bc, roads):
    """One empty place per road that has asking words; filled the first time a row asks."""
    for scope in roads:
        slot_global(bc, TABLE % scope, kind_named(bc, _map()[0]))


def _register(fn, kind):
    """A register of a kind no function of the game declares (a question's own shape)."""
    reg = deepcopy(list(fn.regs)[0])
    reg.value = kind
    fn.regs.append(reg)
    fn.nregs.value = len(fn.regs)
    return len(fn.regs) - 1


def _calling_closure(bc):
    """The game's own closure call with an argument to copy, since ours always hands one."""
    found = next((o for f in bc.functions for o in (f.ops or [])
                  if o.op == "CallClosure" and len(o.df["args"].value) >= 1), None)
    guard(found is not None, "the game never calls a closure with an argument")
    return found


def _place(name, hands):
    from framework.pipeline import Place
    return Place(name, {}, {}, None, None, None, "%s: refused" % name, hands)


def _question(place, scope, spelling, asks, asks_of, about, ask):
    """The word's own question as a function of one thing: 1 when it passes, 0 when not."""
    from framework.parsed import loaded
    bc = place._hands["bc"]()
    i32, kind = kind_named(bc, "I32"), kind_named(bc, about)

    def body(hands):
        made = _place(QUESTION % spelling, hands)
        said = made.scratch_of("I32")
        answer, asking = ask(made, asks, 0, asks_of, about)
        return assemble(loaded(made, asking + [(made.op("JFalse", cond=answer), made.refused)]) + [
            made.op("Int", dst=said, ptr=made.number(PASSES)), made.op("Ret", ret=said),
            made.refused + ":", made.op("Label"),
            made.op("Int", dst=said, ptr=made.number(REFUSED)), made.op("Ret", ret=said)])
    key = (QUESTION % spelling, scope, kind)
    return one_shape(place, scope, key, place._hands["shared"](key, [kind], i32, body))


def one_shape(place, road, key, findex):
    """The shared function `key` given its road's one shape; `findex` handed straight back."""
    bc = place._hands["bc"]()
    # ⛔ ONE SHAPE PER ROAD: the table hands back any entry as the road's first question's kind
    kinds = getattr(bc, KINDS_ON, None)
    if kinds is None:
        kinds = {}
        setattr(bc, KINDS_ON, kinds)
    made = getattr(bc, SHARED_ON)[key]
    made.type.value = kinds.setdefault(road, gv(made.type))
    return findex


def shape_of(place, road):
    """The one kind every entry of a road's table is handed back as."""
    return getattr(place._hands["bc"](), KINDS_ON)[road]


def _filer(place, road, asked, question):
    """Files the first word's question under its number, then hands the table to the next."""
    MAP, _MAKE, _READ, TELL = _map()
    bc = place._hands["bc"]()
    spelling, number = asked[0]
    question_of = question(spelling)
    shape = shape_of(place, road)
    after = _filer(place, road, asked[1:], question) if asked[1:] else None
    table_kind, i32 = kind_named(bc, MAP), kind_named(bc, "I32")

    def body(hands):
        made = _place(FILED % spelling, hands)
        closure = _register(hands["fn"](), shape)
        boxed, key = made.scratch_arg(TELL, 1), made.scratch_arg(TELL, 0)
        told, said = made.scratch_return(TELL), made.scratch_of("I32")
        ops = [made.op("StaticClosure", dst=closure, fun=question_of),
               made.op("UnsafeCast", dst=boxed, src=closure),
               made.op("Int", dst=key, ptr=made.number(number)),
               made.op("Call3", dst=told, fun=made.named_function(TELL), arg0=0, arg1=key,
                       arg2=boxed)]
        if after is not None:
            ops.append(made.op("Call1", dst=said, fun=after, arg0=0))
        return assemble(ops + [made.op("Int", dst=said, ptr=made.number(PASSES)),
                               made.op("Ret", ret=said)])
    return place._hands["shared"]((FILED % spelling, road, table_kind), [table_kind], i32, body)


def table_of(place, road, name, asked, question):
    """The table `name`: each (spelling, number) in `asked` filed with `question(spelling)`."""
    MAP, MAKE, _READ, _TELL = _map()
    bc = place._hands["bc"]()
    first = _filer(place, road, asked, question)
    table_kind = kind_named(bc, MAP)
    slot_global(bc, name, table_kind)

    def body(hands):
        made = _place(name, hands)
        table, said = made.scratch_of(MAP), made.scratch_of("I32")
        have = made.here("it is made")
        return assemble([
            made.op("GetGlobal", **{"dst": table, "global": made.slot(name)}),
            (made.op("JNotNull", reg=table), have),
            made.op("New", dst=table),
            made.op("Call1", dst=made.scratch_return(MAKE), fun=made.named_function(MAKE),
                    arg0=table),
            made.op("Call1", dst=said, fun=first, arg0=table),
            made.op("SetGlobal", **{"global": made.slot(name), "src": table}),
            have + ":", made.op("Label"),
            made.op("Ret", ret=table)])
    return place._hands["shared"]((name, table_kind), [], table_kind, body)


def emit_entry(place, table, number, missing):
    """What `table` filed under `number`, as a closure; nothing filed goes to `missing`."""
    MAP, _MAKE, READ, _TELL = _map()
    mine, got = place.scratch_of(MAP), place.scratch_return(READ)
    return got, [place.op("Call0", dst=mine, fun=table),
                 place.op("Call2", dst=got, fun=place.named_function(READ), arg0=mine,
                          arg1=number),
                 (place.op("JNull", reg=got), missing)]


def emit_called(place, road, got, answer, args):
    """The closure in `got`, as its road's shape, called with `args` into `answer`."""
    question = _register(place._hands["fn"](), shape_of(place, road))
    return [place.op("UnsafeCast", dst=question, src=got),
            written(_calling_closure(place._hands["bc"]()), dst=answer, fun=question, args=args)]


def emit_asked(place, scope, part, holder, asked, about, ask, through):
    """The row's word looked up in this road's table: found, it answers its own question."""
    if not asked:
        return []
    by_word = {one[0]: one for one in asked}
    table = table_of(place, scope, TABLE % scope, [one[:2] for one in sorted(asked)],
                     lambda s: _question(place, scope, s, by_word[s][2], by_word[s][3], about,
                                         ask))
    answer, none = place.scratch_of("I32"), place.scratch_of("I32")
    elsewhere = place.here("its word asks no question")
    thing, narrowing = place.narrowed(holder, place.scratch_of(about))
    got, finding = emit_entry(place, table, place.row[part], elsewhere)
    return finding + narrowing + emit_called(place, scope, got, answer, [thing]) + [
        place.op("Int", dst=none, ptr=place.number(REFUSED)),
        (place.op("JEq", a=answer, b=none), place.refused),
        (place.op("JAlways"), through),
        elsewhere + ":", place.op("Label")]
