"""Let the GAME draw every numbered column a row carries, with the code that draws its own two."""
from tools.hlcode import (argument_kind, argument_kinds, assemble, function_named, number,
                          register_like, returns_type, template, text_object, written)
from tools.project import gv, guard
from tools.splice import insert
from standalone import kit, onoff
from standalone.kit import Anchors, C, _guard, _gv  # noqa: F401
from framework import atload, columns, traps, widen
from framework.rowreader import reader_for

NAME = "targetn"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("attributes",)

# the one drawer this reaches: it is handed the record the registration made
HANDED_A_RECORD = "byDesc"
NEEDS = {
    HANDED_A_RECORD: "static $HText.attributeByDesc (",
}

# the game's own substitution, and the converter that makes what it wants out of a raw column
TAGS = "$HText.replaceTargetTags"
CONVERT = "$HAttributes.convertTargetDescToTargetKind"
# how a place the game did not compile is written and read: by name (`framework/widen.py` says why)
WRITE_BY_NAME = widen.WRITE_BY_NAME
# the first number that is ours. The game answers one and two, in a thousand of its own rows
LOWEST_OURS = 3


def install(bc):
    if not onoff.on(NAME):
        return "targetn: OFF"
    resolved = kit.context(bc)
    return "targetn: %s; %s" % (carry_the_row(bc), ask_on_the_record(bc, resolved))


# ---------------------------------------------------------------- shared
def _places(game, fn, reader):
    """The places every ask needs, each typed from the signature it is handed to."""
    convert = function_named(game, CONVERT)

    def one(kind):
        fn.regs.append(C(register_like(game, kind, reader.prefer)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    # our lowest number, a column as converted, what it names, the ask's subject, the marker
    return {"lowest": one(reader.count_kind),
            "desc": one(argument_kind(game, CONVERT)),
            "kind": one(returns_type(convert, CONVERT)),
            "about": one(argument_kind(game, TAGS, 2)),
            "marker": one(argument_kind(game, TAGS, 3))}


def _asks(game, fn, *, row_reg, line_reg, reader):
    """The walk over one row's columns, and one ask per column numbered three or higher."""
    at = _places(game, fn, reader)
    walking = reader.registers(game, fn)
    tags = function_named(game, TAGS)
    convert = function_named(game, CONVERT)

    def op(name, **operands):
        return written(template(game, name), **operands)

    return columns.emit_walk(game, fn=fn, row_reg=row_reg, regs=walking, reader=reader, body=[
        # one and two are the game's own, and it has already asked for both
        op("Int", dst=at["lowest"], ptr=number(game, LOWEST_OURS)),
        (op("JSLt", a=walking["number"], b=at["lowest"]), "NEXT"),
        # the column, as the shape the game's own converter reads
        op("SafeCast", dst=at["desc"], src=walking["value"]),
        (op("JNull", reg=at["desc"]), "NEXT"),
        op("Call1", dst=at["kind"], fun=gv(convert.findex), arg0=at["desc"]),
        # a column naming nothing the game knows converts to nothing, and is left alone
        (op("JNull", reg=at["kind"]), "NEXT"),
        # the ask is about no thing here, exactly as it is at the game's own two
        op("Null", dst=at["about"]),
        op("ToDyn", dst=at["marker"], src=walking["number"]),
        op("Call4", dst=line_reg, fun=gv(tags.findex), arg0=line_reg, arg1=at["kind"],
           arg2=at["about"], arg3=at["marker"]),
    ])


def _the_games_own_asks(game, fn, what):
    """Where the drawer makes the game's own two asks, and the place its line is threaded in."""
    tags = function_named(game, TAGS)
    found = [i for i, o in enumerate(fn.ops)
             if o.op == "Call4" and gv(o.df["fun"]) == gv(tags.findex)]
    guard(len(found) == 2,
          "%s makes %d such ask(s), not the two the game writes for its own two columns"
          % (what, len(found)))
    return found[-1], gv(fn.ops[found[-1]].df["dst"])


# ---------------------------------------------------------------- at the load
def carry_the_row(game):
    """Put the authored row on the record the drawer is handed, the one moment both are in hand."""
    fn = atload.site(game)
    setter = function_named(game, WRITE_BY_NAME)
    takes = argument_kinds(game, WRITE_BY_NAME)
    guard(len(takes) == 3, "%s takes %d argument(s), not a thing, a name and a value"
          % (WRITE_BY_NAME, len(takes)))
    reader = reader_for(game)
    guard(takes[2] == reader.row_kind,
          "%s is not given the same kind of thing a row is read off" % WRITE_BY_NAME)

    # every route resolved FIRST, then written back to front: a block moves all after it
    sites = atload.routes(game, fn)
    bounds = [-1] + list(sites[:-1])
    rows = [atload.the_row_itself(game, fn, at, bounded_by=bound)
            for at, bound in zip(sites, bounds)]

    def place(kind):
        fn.regs.append(C(register_like(game, kind)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    asdyn, named = place(takes[0]), place(takes[1])
    discarded = place(returns_type(setter, WRITE_BY_NAME))
    word = text_object(game, widen.PLACE)

    def op(name, **operands):
        return written(template(game, name), **operands)

    went_in = 0
    for which, (at, (row, _narrowed)) in reversed(list(enumerate(zip(sites, rows)))):
        record = gv(fn.ops[at].df["dst"])
        guard(record != row,
              "route %d leaves the registration in the place the row is in" % (which + 1))
        went_in += insert(game, fn, at + 1, [
            # the record, as the kind a by-name write takes
            op("ToDyn", dst=asdyn, src=record),
            op("GetGlobal", **{"dst": named, "global": word}),
            op("Call3", dst=discarded, fun=gv(setter.findex),
               arg0=asdyn, arg1=named, arg2=row),
        ], "the row carried to the drawer, route %d of %d" % (which + 1, len(sites)),
            traps.AT_AUTHORED_DATA)
    return "%d instruction(s) into %d route(s) of the registration" % (went_in, len(sites))


# ---------------------------------------------------------------- the drawer handed a record
def ask_on_the_record(game, resolved):
    """The drawer that is handed a record: the row comes out of our own place on it."""
    fn = resolved["funcs"][HANDED_A_RECORD]
    what = "the drawer handed a record"
    code = fn.ops
    where = Anchors(fn, resolved["global_text"], what)
    made = where.first("CallN")
    line = gv(code[made].df["dst"])
    handed = where.first("Ret", after=made)
    guard(handed == made + 1, "%s does something between its line and handing it back" % what)
    guard(gv(code[handed].df["ret"]) == line, "%s hands back another line" % what)

    reader = reader_for(game)
    guard(reader.value_kind == reader.row_kind,
          "a column read by name does not come back as the kind a row is read off, so the row "
          "cannot be taken out of our place the way it was put in")

    def place(kind):
        fn.regs.append(C(register_like(game, kind, reader.prefer)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    asdyn = place(argument_kinds(game, WRITE_BY_NAME)[0])
    named = place(reader.text_kind)
    row = place(reader.row_kind)
    word = text_object(game, widen.PLACE)

    def op(name, **operands):
        return written(template(game, name), **operands)

    block = assemble([
        # the row out of our own place on the record the drawer was handed
        op("ToDyn", dst=asdyn, src=0),
        op("GetGlobal", **{"dst": named, "global": word}),
        op("Call2", dst=row, fun=gv(reader.reading.findex), arg0=asdyn, arg1=named),
        # a record the load never reached carries nothing there, and that is not a fault
        (op("JNull", reg=row), "DONE"),
    ] + _asks(game, fn, row_reg=row, line_reg=line, reader=reader))

    went_in = insert(game, fn, handed, block, "a numbered column asked for", traps.IN_PLAY)
    return "%d instruction(s) on the record's own drawer" % went_in

