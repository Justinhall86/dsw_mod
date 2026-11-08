#!/usr/bin/env python3
"""Words the bake looks up in one table at run time: one branch per shape of word, none per word."""
from tools.project import gv, guard
from tools.hlcode import (argument_kind, field_by_name, function_named, kind_named, number,
                          returns_type, shared_function, slot_global, template, text_object,
                          written)
from framework import tray
from framework.rowreader import reader_for

# the families whose words are read off the table; every other word keeps its own comparison
FAMILIES = ("narrowing", "modifiers", "multipliers", "comparisons")
# where the table is kept once it is built, and what builds it
MAP, NUMBERS, BUILT = "the word table", "the word table's numbers", "the word table, built"
# the owner words' table; each one's record: number, only-before, may sit in front, after, inside
OWNERS = ("the owner table", "the owner table's numbers", "the owner table, built")
NUMBER_AT, ONLY_AT = 0, 1
# what parts one entry of the table's text from the next
SEP = ","
# a way of writing a word that word does not have
ABSENT = -1
# the four ways of writing one word, in the order the table keeps them: marked twice, plural once
SLOTS = ((False, False), (False, True), (True, False), (True, True))


def looked_up(groups):
    """The groups the table holds: every way of writing them one of its families', text unshared."""
    texts = [g.text for g in groups]
    return [g for g in groups if texts.count(g.text) == 1
            and all(one.word.family in FAMILIES for one, _ in g.slots.values())]


def steps(groups, looked):
    """The groups in their order, the looked-up ones read as one step (None) where the first sat."""
    out = []
    for group in groups:
        if group not in looked:
            out.append(group)
        elif None not in out:
            out.append(None)
    return out


def _plain(value):
    value = gv(value)
    if isinstance(value, list):
        return tuple(_plain(one) for one in value)
    return value if isinstance(value, (int, str, float, type(None))) else repr(value)


def _ops(items):
    return [item[0] if isinstance(item, tuple) else item
            for item in items if not isinstance(item, str)]


def shape_of(items):
    """What a branch does with its numbers left out: two words alike in all else share it."""
    inside = {item[:-1]: n for n, item in enumerate(i for i in items if isinstance(i, str))}
    out = []
    for item in items:
        if isinstance(item, str):
            out.append(("place", inside[item[:-1]]))
            continue
        op, to = item if isinstance(item, tuple) else (item, None)
        out.append((op.op, tuple(sorted(
            (k, "a number" if op.op == "Int" and k == "ptr" else _plain(v))
            for k, v in op.df.items() if k != "offset")), inside.get(to, to)))
    return tuple(out)


def numbers_in(bc, items):
    """The numbers a branch writes, in the order it writes them."""
    pool = bc.ints.value if hasattr(bc.ints, "value") else bc.ints
    return [gv(pool[gv(op.df["ptr"])]) for op in _ops(items) if op.op == "Int"]


def _jumps_stay_home(branches):
    """No way jumps into another way's code: there it would read the other's numbers off its own."""
    owned = {}
    for _text, ways in branches:
        for items in filter(None, ways):
            owned.update({i[:-1]: id(items) for i in items if isinstance(i, str)})
    for text, ways in branches:
        for items in filter(None, ways):
            away = [i[1] for i in items if isinstance(i, tuple) and owned.get(i[1], id(items))
                    != id(items)]
            guard(not away, "`%s` jumps into another word's code at %s" % (text, away[:1]))


def layout(bc, branches):
    """Each shape once, and the table's text: a word's text, its four ways, each way's numbers."""
    _jumps_stay_home(branches)
    shapes, keyed, tokens, at = [], {}, [], 0
    for text, ways in branches:
        guard(SEP not in text and not text.lstrip("-").isdigit(),
              "`%s` cannot be told apart from the table's numbers" % text)
        records = []
        for items in ways:
            if items is None:
                records.append(None)
                continue
            shape = shape_of(items)
            if shape not in keyed:
                keyed[shape] = len(shapes)
                shapes.append(items)
            records.append([keyed[shape]] + numbers_in(bc, items))
        cursor, offsets = at + len(SLOTS), []
        for record in records:
            offsets.append(ABSENT if record is None else cursor)
            cursor += len(record or [])
        tokens += [text] + [str(n) for n in offsets] + [str(n) for rec in records if rec
                                                         for n in rec]
        at = cursor
    return shapes, SEP.join(tokens)


def _op(bc, name, **operands):
    return written(template(bc, name), **operands)


def _place(bc, fn, kind):
    from framework.parsed import a_new_place
    return a_new_place(bc, fn, kind)


def _kinds(bc, reader):
    made = tray.recipe(bc)
    return {"map": kind_named(bc, tray.ONE_PER_RESOURCE), "list": reader.listing_kind,
            "held": returns_type(function_named(bc, tray.LOOK_UP), tray.LOOK_UP), "made": made}


def _slots(bc, reader, names=(MAP, NUMBERS, BUILT)):
    kinds = _kinds(bc, reader)
    return slot_global(bc, names[0], kinds["map"]), slot_global(bc, names[1], kinds["list"])


def _building(bc, made, reader, text, names=(MAP, NUMBERS, BUILT), listed=False):
    """The builder's body: the text's entries into a list; a word into the map, or `listed` too."""
    from framework.atload import emit_a_new_list
    k = _kinds(bc, reader)
    at_map, at_list = _slots(bc, reader, names)

    def place(kind):
        return _place(bc, made, kind)
    the_map, the_list = place(k["map"]), place(k["list"])
    whole, sep, piece = (place(reader.text_kind) for _ in range(3))
    start, found, size, length, n, zero, one, ret = (place(reader.count_kind) for _ in range(8))
    boxed, maybe = place(reader.optional_kind), place(reader.number_kind)
    pushed_as = place(argument_kind(bc, tray.PUSH, 0))
    stored_as = place(argument_kind(bc, tray.RECORD, 1))
    pushed = place(returns_type(function_named(bc, tray.PUSH), tray.PUSH))
    stored = place(returns_type(function_named(bc, tray.RECORD), tray.RECORD))
    built = place(returns_type(function_named(bc, tray.A_NEW_ONE), tray.A_NEW_ONE))
    typed, raw, backing = (place(k["made"]["of"][w]) for w in ("typed", "raw", "backing"))
    counted, _c = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.COUNT_ON, "a list")
    op = lambda name, **o: _op(bc, name, **o)  # noqa: E731
    return [op("New", dst=the_map),
            op("Call1", dst=built, fun=gv(function_named(bc, tray.A_NEW_ONE).findex),
               arg0=the_map)] + emit_a_new_list(
        bc, op, k["made"], k["held"], the_list, size, typed, raw, backing) + [
        op("GetGlobal", **{"dst": whole, "global": text_object(bc, text)}),
        op("GetGlobal", **{"dst": sep, "global": text_object(bc, SEP)}),
        op("Field", dst=size, obj=whole, field=reader.text_length_field),
        op("Int", dst=zero, ptr=number(bc, 0)),
        op("Int", dst=one, ptr=number(bc, 1)),
        op("Mov", dst=start, src=zero),
        "the next entry:", op("Label"),
        (op("JSGte", a=start, b=size), "read"),
        op("ToDyn", dst=boxed, src=start),
        op("Call3", dst=found, fun=gv(reader.finding.findex), arg0=whole, arg1=sep, arg2=boxed),
        (op("JSGte", a=found, b=zero), "its end"),
        op("Mov", dst=found, src=size),
        "its end:", op("Label"),
        op("Sub", dst=length, a=found, b=start),
        op("ToDyn", dst=boxed, src=length),
        op("Call3", dst=piece, fun=gv(reader.tailing.findex), arg0=whole, arg1=start,
           arg2=boxed),
        op("Call1", dst=maybe, fun=gv(reader.numbering.findex), arg0=piece),
        (op("JNull", reg=maybe), "a word"),
        op("SafeCast", dst=n, src=maybe),
        op("ToDyn", dst=pushed_as, src=n),
        op("Call2", dst=pushed, fun=gv(function_named(bc, tray.PUSH).findex), arg0=the_list,
           arg1=pushed_as),
        (op("JAlways"), "past it"),
        "a word:", op("Label")] + ([
        # ⛔ THE TEXT ITSELF ON THE LIST, an object, so cast and not boxed
        op("UnsafeCast", dst=pushed_as, src=piece),
        op("Call2", dst=pushed, fun=gv(function_named(bc, tray.PUSH).findex), arg0=the_list,
           arg1=pushed_as)] if listed else [
        op("Field", dst=n, obj=the_list, field=counted),
        op("ToDyn", dst=stored_as, src=n),
        op("Call3", dst=stored, fun=gv(function_named(bc, tray.RECORD).findex), arg0=the_map,
           arg1=piece, arg2=stored_as)]) + [
        "past it:", op("Label"),
        op("Add", dst=start, a=found, b=one),
        (op("JAlways"), "the next entry"),
        "read:", op("Label"),
        op("SetGlobal", **{"global": at_map, "src": the_map}),
        op("SetGlobal", **{"global": at_list, "src": the_list}),
        op("Mov", dst=ret, src=zero),
        op("Ret", ret=ret)]


def branches_of(bc, r, looked, places, negated, fits):
    """Each looked-up group's text and its four ways' branches, all leaving to one place."""
    from framework.pieceword import SHARES_ITS_PLAIN, emit_branch, slotted
    past = "%s NOT IN THE TABLE" % places

    def ways(g):
        made = {}
        for slot in SLOTS:
            if slot not in g.slots:
                made[slot] = None
            elif g.slots[slot][0].text in SHARES_ITS_PLAIN and made.get((False, slot[1])):
                # ⛔ ONE WORD, ONE BRANCH: the marked way is the plain way's record again
                made[slot] = made[(False, slot[1])]
            else:
                made[slot] = emit_branch(bc, r, slotted(g, slot), "%s TABLE %s %d%d" % (
                    places, g.text, *slot), past, places, negated, fits)
        return [made[slot] for slot in SLOTS]
    return past, [(g.text, ways(g)) for g in looked]


def read_back(text):
    """The table's text read as the builder reads it: each word's place, and the numbers."""
    where, numbers = {}, []
    for piece in text.split(SEP):
        if piece.lstrip("-").isdigit():
            numbers.append(int(piece))
        else:
            where[piece] = len(numbers)
    return where, numbers


def builder(bc, like, reader, text, names, listed=False):
    """The function that builds the table `names` from `text`, made once per file."""
    from tools.hlcode import assemble
    _slots(bc, reader, names)
    return shared_function(bc, like, lambda _bc, made: made, (names[2],), [reader.count_kind],
                           reader.count_kind, lambda made: assemble(
                               _building(bc, made, reader, text, names, listed)))


def emit_ready(bc, fn, reader, text, names, places, zero, listed=False):
    """The table `names` built from `text` on first use: its map, its numbers, a reading place."""
    k = _kinds(bc, reader)
    at_map, at_list = _slots(bc, reader, names)
    the_map, the_list, got = (_place(bc, fn, k[w]) for w in ("map", "list", "held"))
    array = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON, "a list")
    backing, spare = _place(bc, fn, array[1]), _place(bc, fn, reader.count_kind)
    made = builder(bc, fn, reader, text, names, listed)
    op = lambda name, **o: _op(bc, name, **o)  # noqa: E731
    ready = "%s %s READY" % (places, names[0])
    return [op("GetGlobal", **{"dst": the_map, "global": at_map}),
            (op("JNotNull", reg=the_map), ready),
            op("Call1", dst=spare, fun=made, arg0=zero),
            op("GetGlobal", **{"dst": the_map, "global": at_map}),
            ready + ":", op("Label"),
            op("GetGlobal", **{"dst": the_list, "global": at_list}),
            op("Field", dst=backing, obj=the_list, field=array[0])], the_map, backing, got


def emit_read(bc, backing, got, cursor, which, into, spots):
    """The number `which` places past `cursor` in a table's numbers, into `into`."""
    spare, at = spots
    # the first number sits at the cursor itself
    stepped = [_op(bc, "Int", dst=spare, ptr=number(bc, which)),
               _op(bc, "Add", dst=at, a=cursor, b=spare)] if which else []
    return stepped + [_op(bc, "GetArray", dst=got, array=backing, index=at if which else cursor),
                      _op(bc, "SafeCast", dst=into, src=got)]


def emit_looked_up(bc, fn, r, reader, looked, places, negated, fits):
    """The piece's stem looked up once; its way of writing picks a shape, read with its numbers."""
    from tools.hlcode import assemble
    past, branches = branches_of(bc, r, looked, places, negated, fits)
    shapes, text = layout(bc, branches)
    k = _kinds(bc, reader)
    at_map, at_list = _slots(bc, reader)
    the_map, the_list, got = (_place(bc, fn, k[w]) for w in ("map", "list", "held"))
    backing = _place(bc, fn, field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES),
                                           tray.BACKING_ON, "a list")[1])
    held_in = field_by_name(bc, kind_named(bc, tray.ARRAY_OF_ENTRIES), tray.BACKING_ON,
                            "a list")[0]
    cursor, record, shape, spare, at = (_place(bc, fn, reader.count_kind) for _ in range(5))
    builder = shared_function(bc, fn, lambda _bc, made: made, (BUILT,), [reader.count_kind],
                              reader.count_kind,
                              lambda made: assemble(_building(bc, made, reader, text)))
    op = lambda name, **o: _op(bc, name, **o)  # noqa: E731
    ready = "%s TABLE READY" % places

    def read(into):
        return [op("GetArray", dst=got, array=backing, index=cursor),
                op("SafeCast", dst=into, src=got)]
    out = [op("GetGlobal", **{"dst": the_map, "global": at_map}),
           (op("JNotNull", reg=the_map), ready),
           op("Call1", dst=spare, fun=builder, arg0=r["zero"]),
           op("GetGlobal", **{"dst": the_map, "global": at_map}),
           ready + ":", op("Label"),
           op("GetGlobal", **{"dst": the_list, "global": at_list}),
           op("Call2", dst=got, fun=gv(function_named(bc, tray.LOOK_UP).findex), arg0=the_map,
              arg1=r["stem"]),
           (op("JNull", reg=got), past),
           op("SafeCast", dst=cursor, src=got),
           # marked counts twice, plural once: the four ways sit in that order
           op("Add", dst=spare, a=r["marked"], b=r["marked"]),
           op("Add", dst=spare, a=spare, b=r["plural"]),
           op("Add", dst=cursor, a=cursor, b=spare),
           op("Field", dst=backing, obj=the_list, field=held_in)] + read(record) + [
           (op("JSLt", a=record, b=r["zero"]), past),
           op("Mov", dst=cursor, src=record)] + read(shape) + [
           op("Incr", dst=cursor)]
    # ⛔ ONE SWITCH, NOT A TEST PER SHAPE: a shape added costs its own code and nothing more
    named = tuple("%s SHAPE %d" % (places, which) for which in range(len(shapes)))
    out += [(op("Switch", reg=shape, offsets=list(range(len(shapes))), end=0), named),
            (op("JAlways"), past)]
    for which, items in enumerate(shapes):
        guard(_ops(items)[-1].op == "JAlways", "shape %d runs on into the next" % which)
        # only a jump closing a loop needs a `Label` to land on; a switch only goes forward
        out.append(named[which] + ":")
        held = 0
        for item in items:
            plain = item[0] if isinstance(item, tuple) else item
            if not isinstance(item, str) and plain.op == "Int":
                # ⛔ BY ITS OWN PLACE: a jump past one number must not shift the next
                out += [op("Int", dst=spare, ptr=number(bc, held)),
                        op("Add", dst=at, a=cursor, b=spare)] * (held > 0) + [
                    op("GetArray", dst=got, array=backing, index=at if held else cursor),
                    op("SafeCast", dst=gv(plain.df["dst"]), src=got)]
                held += 1
            else:
                out.append(item)
    return out + [past + ":", op("Label")]


def only_code(owner):
    """The number `owner_only` holds for an owner word: its one family's place plus one, or 0."""
    from framework.names import module_of
    from framework.pieceword import ONLY_BEFORE, TAKES_OWNERS
    only = getattr(module_of(owner), ONLY_BEFORE, None)
    guard(only is None or only in TAKES_OWNERS,
          "`%s` goes only before %r, which takes no owner word" % (owner.spelling, only))
    return 0 if only is None else TAKES_OWNERS.index(only) + 1


def kept_to():
    """Each family an owner word is kept to (`Any`: narrowings), as `owner_only` numbers it."""
    from framework.names import vocabulary
    return {only_code(w) for w in vocabulary().values() if w.family == "owners"} - {0}


def owner_text(words):
    """The owner table's text: each owner word, its number, its only-before, and where it sits."""
    from framework.ownermatch import numbers
    from framework.pieceword import AFTER, IN_FRONT, WITHIN, owners_cut, read_whole
    sides = dict(owners_cut(read_whole(words), words))
    every = numbers(words)
    return SEP.join(SEP.join([s, str(every[s]), str(only_code(words[s]))] + [
        str(int(s in sides[at])) for at in (IN_FRONT, AFTER, WITHIN)]) for s in sorted(every))


def emit_owner_table(bc, fn, r, reader, places):
    """The owner table, ready; `look` finds the text at `word` on it, `read` one of its numbers."""
    from framework.names import vocabulary
    from framework.parsed import a_new_place
    ready, the_map, backing, got = emit_ready(
        bc, fn, reader, owner_text(vocabulary()), OWNERS, places, r["zero"])
    cursor, spare, at = (a_new_place(bc, fn, reader.count_kind) for _ in range(3))

    def look(missing, key="word"):
        return [_op(bc, "Call2", dst=got, fun=gv(function_named(bc, tray.LOOK_UP).findex),
                    arg0=the_map, arg1=r[key]),
                (_op(bc, "JNull", reg=got), missing), _op(bc, "SafeCast", dst=cursor, src=got)]

    def read(which, into):
        return emit_read(bc, backing, got, cursor, which, into, (spare, at))
    return ready, look, read


def emit_cut_owner(bc, fn, r, reader, places, sides, cut, stems=()):
    """The longest owner word on the table that may sit there, cut off each side; then to `cut`."""
    from framework.pieceword import IN_FRONT, WITHIN
    if not sides:
        return []
    ready, look, read = emit_owner_table(bc, fn, r, reader, places + " CUT")
    op = lambda name, **o: _op(bc, name, **o)  # noqa: E731
    out, found, past = list(ready), "%s OWNER FOUND" % places, "%s OWNER NOT FOUND" % places
    for where in sides:
        if where == WITHIN:
            out += _cut_within(bc, r, reader, places, stems, look, read, found)
            continue
        tag = "%s OWNER AT %d" % (places, where)
        # ⛔ THE LONGEST FIRST: `AllyUnit` is `Ally` + `Unit`, never `All` + `yUnit`
        out += [op("Sub", dst=r["wlen"], a=r["slen"], b=r["one"]),
                tag + " NEXT:", op("Label"),
                (op("JSLt", a=r["wlen"], b=r["one"]), tag + " DONE")]
        if where == IN_FRONT:
            out += [op("ToDyn", dst=r["boxed"], src=r["wlen"]),
                    op("Call3", dst=r["word"], fun=gv(reader.tailing.findex),
                       arg0=r["stem"], arg1=r["zero"], arg2=r["boxed"])]
        else:
            out += [op("Sub", dst=r["at"], a=r["slen"], b=r["wlen"]),
                    op("Call3", dst=r["word"], fun=gv(reader.tailing.findex),
                       arg0=r["stem"], arg1=r["at"], arg2=r["nothing"])]
        out += look(tag + " SHORTER") + read(1 + where, r["found"]) + [
            (op("JEq", a=r["found"], b=r["zero"]), tag + " SHORTER")]
        if where == IN_FRONT:
            out += [op("Call3", dst=r["stem"], fun=gv(reader.tailing.findex),
                       arg0=r["stem"], arg1=r["wlen"], arg2=r["nothing"])]
        else:
            out += [op("ToDyn", dst=r["boxed"], src=r["at"]),
                    op("Call3", dst=r["stem"], fun=gv(reader.tailing.findex),
                       arg0=r["stem"], arg1=r["zero"], arg2=r["boxed"])]
        out += [op("Int", dst=r["owner_where"], ptr=number(bc, where)),
                (op("JAlways"), found),
                tag + " SHORTER:", op("Label"),
                op("Sub", dst=r["wlen"], a=r["wlen"], b=r["one"]),
                (op("JAlways"), tag + " NEXT"),
                tag + " DONE:", op("Label")]
    # ⛔ ONE ENDING FOR EVERY SIDE: the piece's new length and the owner word's numbers
    return out + [(op("JAlways"), past), found + ":", op("Label"),
                  op("Field", dst=r["slen"], obj=r["stem"], field=reader.text_length_field)] + (
        read(NUMBER_AT, r["owner"]) + read(ONLY_AT, r["owner_only"])) + [
        (op("JAlways"), cut), past + ":", op("Label")]


def _cut_within(bc, r, reader, places, stems, look, read, found):
    """The longest owner word straight after a stem and before more, cut out; then to `found`."""
    from framework.pieceword import WITHIN
    op = lambda name, **o: _op(bc, name, **o)  # noqa: E731
    tag = "%s OWNER AFTER A STEM" % places
    joined = function_named(bc, "$String.__add__")
    # ⛔ ONE CUT FOR EVERY STEM: each stem only asks whether the piece starts with it
    out = []
    for k, stem in enumerate(stems):
        last = k + 1 == len(stems)
        out += [op("GetGlobal", **{"dst": r["tail"], "global": text_object(bc, stem)}),
                op("Call3", dst=r["found"], fun=gv(reader.finding.findex),
                   arg0=r["stem"], arg1=r["tail"], arg2=r["nothing"]),
                (op("JNotEq" if last else "JEq", a=r["found"], b=r["zero"]),
                 tag + (" DONE" if last else " STARTS"))]
    return out + [
            tag + " STARTS:", op("Label"),
            op("Field", dst=r["first"], obj=r["tail"], field=reader.text_length_field),
            # ⛔ SOMETHING MUST FOLLOW IT: with nothing after, the owner word sits after the word
            op("Sub", dst=r["wlen"], a=r["slen"], b=r["first"]),
            op("Sub", dst=r["wlen"], a=r["wlen"], b=r["one"]),
            tag + " NEXT:", op("Label"),
            (op("JSLt", a=r["wlen"], b=r["one"]), tag + " DONE"),
            op("ToDyn", dst=r["boxed"], src=r["wlen"]),
            op("Call3", dst=r["word"], fun=gv(reader.tailing.findex),
               arg0=r["stem"], arg1=r["first"], arg2=r["boxed"]),
            ] + look(tag + " SHORTER") + read(1 + WITHIN, r["found"]) + [
            (op("JEq", a=r["found"], b=r["zero"]), tag + " SHORTER"),
            # the stem itself is the piece's start, still held: only the rest is cut
            op("Add", dst=r["at"], a=r["first"], b=r["wlen"]),
            op("Call3", dst=r["word"], fun=gv(reader.tailing.findex),
               arg0=r["stem"], arg1=r["at"], arg2=r["nothing"]),
            op("Call2", dst=r["stem"], fun=gv(joined.findex), arg0=r["tail"], arg1=r["word"]),
            op("Int", dst=r["owner_where"], ptr=number(bc, WITHIN)),
            (op("JAlways"), found),
            tag + " SHORTER:", op("Label"),
            op("Sub", dst=r["wlen"], a=r["wlen"], b=r["one"]),
            (op("JAlways"), tag + " NEXT"),
            tag + " DONE:", op("Label")]
