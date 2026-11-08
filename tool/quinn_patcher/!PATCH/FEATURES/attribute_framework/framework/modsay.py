#!/usr/bin/env python3
"""`mod say` -- the line typed in the game that moves one of our words on, off, or to a tempo."""
from tools.project import gv
from tools.hlcode import (argument_kind, assemble, field_by_name, function_named, number,
                          returns_type, template, text_object, written)
from tools.splice import insert
from framework import board, oneline, traps
from framework.parsed import a_new_place
from standalone import onoff

NAME = "modsay"
# the other changes, by NAME, this one cannot work without; "attributes" is the framework
RELIES_ON = ("attributes",)

# the one function every typed line comes through, and the console's own way of answering
HANDLE = "h2d.Console.handleCommand"
REPLY = "h2d.Console.log"
# what the line is cut up with, all of it the game's own
TRIM, LOWER, SPLIT, COMPARE = "$StringTools.trim", "String.toLowerCase", "String.split", \
    "String.__compare"
# the entry gate, a scan that answers even where the compare below cannot, so a no is readable
FINDS = board.A_COUNT
# an array says how many it holds and what it holds them in, and it says so by name
HOW_MANY, BACKING = "length", "array"

# the two words in front. Neither is among the game's own 167, so no line of theirs is taken
OURS, SAY, GAP, OFF_WORD = "mod", "say", " ", "off"

NOT_OURS = "mod say: not our line"
DONE = "mod say: answered"
USAGE = "mod say: what can be typed"
THE_BOARD = "mod say: the board"
CHOOSE = "mod say: the word chosen"
ALL_OFF = "mod say: every word off"
NO_WORD = "mod say: no such word"
NO_TEMPO = "mod say: no such tempo"
FRAME_REFUSED = "mod say: per frame is refused"
COMPARE_SAID_NO = "mod say: the word compare said no"

# every line this command can answer with that is not a board row
LINES = {
    USAGE: ("mod say :                       the board below",
            "mod say <word> :                that word starts speaking, at its own tempo",
            "mod say <word> off :            it stops",
            "mod say <word> game|tick|pass : its tempo, this launch only",
            "mod say off :                   every word stops"),
    NO_WORD: ("mod say: no word of ours is called that -- `mod say` lists every one",),
    NO_TEMPO: ("mod say: a tempo is game, tick or pass; frame is refused",),
    FRAME_REFUSED: ("mod say: per frame is refused -- a log that outruns the game is not a"
                    " diagnosis. It takes a `PER FRAME:` line in the build header.",),
    COMPARE_SAID_NO: ("mod say: this line begins with `mod` and the word compare says it does"
                      " not -- so the compare is what is wrong, not the line.",),
}
HEADER = "mod say -- every word of ours, its tempo, and what it has dropped"
NOT_BUILT = "  -- NOT IN THIS BUILD, so the line changes nothing until one is made"


def kit(bc):
    """Every function, field and kind this reads, resolved once and never counted by hand."""
    split = function_named(bc, SPLIT)
    listed = returns_type(split, SPLIT)
    counted, _count_kind = field_by_name(bc, listed, HOW_MANY, "a split line")
    held, held_kind = field_by_name(bc, listed, BACKING, "a split line")
    return {"where": function_named(bc, HANDLE), "reply": function_named(bc, REPLY),
            "trim": function_named(bc, TRIM), "lower": function_named(bc, LOWER),
            "split": split, "compare": function_named(bc, COMPARE),
            "finds": function_named(bc, FINDS),
            "listed": listed, "counted": counted, "held": held, "held_kind": held_kind}


def places(bc, fn, k):
    """Every place this block writes, each of a kind the game itself declares somewhere."""
    # THE KINDS ARE ASKED OF THE CALLS THAT TAKE THEM, and `this` is not one of their arguments
    text = argument_kind(bc, SPLIT, 0)
    wanted = (("line", text), ("minted", text), ("statetext", text),
              ("t0", text), ("t1", text), ("t2", text), ("t3", text),
              ("boxed", argument_kind(bc, COMPARE, 0)),
              ("toks", k["listed"]), ("back", k["held_kind"]),
              ("many", board.a_number(bc)), ("n", board.a_number(bc)),
              ("cmp", board.a_number(bc)), ("wanted", board.a_number(bc)),
              ("state", board.a_number(bc)), ("mark", board.a_number(bc)),
              ("dropped", board.a_number(bc)),
              ("colour", argument_kind(bc, REPLY, 1)),
              ("void", returns_type(k["reply"], REPLY)),
              ("back home", returns_type(k["where"], HANDLE)))
    return {name: a_new_place(bc, fn, kind) for name, kind in wanted}


def _op(bc):
    """The instruction writer, so no function below makes one of its own."""
    return lambda what, **operands: written(template(bc, what), **operands)


def _same(bc, k, r, op, token, word, goes_to, when="eq"):
    """Jump when that token is, or is not, exactly this word -- the game's own compare, 0 equal."""
    return [
        op("GetGlobal", **{"dst": r["minted"], "global": text_object(bc, word)}),
        op("UnsafeCast", dst=r["boxed"], src=r["minted"]),
        op("Call2", dst=r["cmp"], fun=gv(k["compare"].findex), arg0=token, arg1=r["boxed"]),
        op("Int", dst=r["n"], ptr=number(bc, 0)),
        (op("JEq" if when == "eq" else "JNotEq", a=r["cmp"], b=r["n"]), goes_to),
    ]


def _token(bc, k, r, op, which, into, fewer_than):
    """Token number `which` of the split line, as text, when the line has one that far along."""
    return [op("Int", dst=r["n"], ptr=number(bc, which + 1)),
            (op("JSLt", a=r["many"], b=r["n"]), fewer_than),
            op("Int", dst=r["n"], ptr=number(bc, which)),
            op("GetArray", dst=r[into], array=r["back"], index=r["n"])]


def _say(bc, fn, k, r, at, op, pieces):
    """One line, into the console the player is looking at and into the log beside it."""
    return oneline.join(bc, fn, op, at, pieces) + [
        op("Call1", dst=at["said"], fun=gv(function_named(bc, oneline.sayonce.COMPLAIN).findex),
           arg0=at["line"]),
        op("Call3", dst=r["void"], fun=gv(k["reply"].findex), arg0=0, arg1=at["line"],
           arg2=r["colour"])]


def _lines(bc, fn, k, r, at, op, which, leaves=DONE):
    """One of the fixed answers, said whole and followed by nothing else."""
    out = [which + ":", op("Label")]
    for one in LINES[which]:
        out += _say(bc, fn, k, r, at, op, [one])
    return out + [(op("JAlways"), leaves)]


def emit_parse(bc, k, r, op):
    """From the typed line to its words, leaving anything that is not ours to the game."""
    return [
        (op("JNull", reg=1), NOT_OURS),
        op("Call1", dst=r["line"], fun=gv(k["trim"].findex), arg0=1),
        (op("JNull", reg=r["line"]), NOT_OURS),
        op("Call1", dst=r["line"], fun=gv(k["lower"].findex), arg0=r["line"]),
        (op("JNull", reg=r["line"]), NOT_OURS),
        op("Null", dst=r["colour"]),
        op("GetGlobal", **{"dst": r["minted"], "global": text_object(bc, GAP)}),
        op("Call2", dst=r["toks"], fun=gv(k["split"].findex), arg0=r["line"], arg1=r["minted"]),
        (op("JNull", reg=r["toks"]), NOT_OURS),
        op("Field", dst=r["many"], obj=r["toks"], field=k["counted"]),
        op("Field", dst=r["back"], obj=r["toks"], field=k["held"]),
        op("GetGlobal", **{"dst": r["minted"], "global": text_object(bc, OURS)}),
        op("Call3", dst=r["cmp"], fun=gv(k["finds"].findex), arg0=r["line"], arg1=r["minted"],
           arg2=r["colour"]),
        op("Int", dst=r["n"], ptr=number(bc, 0)),
        (op("JNotEq", a=r["cmp"], b=r["n"]), NOT_OURS),
    ] + _token(bc, k, r, op, 0, "t0", NOT_OURS) \
      + _same(bc, k, r, op, r["t0"], OURS, COMPARE_SAID_NO, when="ne") \
      + _token(bc, k, r, op, 1, "t1", USAGE) \
      + _same(bc, k, r, op, r["t1"], SAY, USAGE, when="ne") \
      + _token(bc, k, r, op, 2, "t2", THE_BOARD) \
      + _same(bc, k, r, op, r["t2"], OFF_WORD, ALL_OFF) \
      + [op("Int", dst=r["wanted"], ptr=number(bc, board.UNTOUCHED))] \
      + _token(bc, k, r, op, 3, "t3", CHOOSE)


def emit_action(bc, k, r, op):
    """Which tempo was typed after the word, as the number that word's place will hold."""
    asked = dict(board.TEMPO_IS)
    asked[OFF_WORD] = board.OFF
    out = []
    for spelling in sorted(asked):
        out += _same(bc, k, r, op, r["t3"], spelling, "mod say: the tempo is " + spelling)
    out += _same(bc, k, r, op, r["t3"], board.PER_FRAME, FRAME_REFUSED)
    out += [(op("JAlways"), NO_TEMPO)]
    for spelling in sorted(asked):
        out += ["mod say: the tempo is %s:" % spelling, op("Label"),
                op("Int", dst=r["wanted"], ptr=number(bc, asked[spelling])),
                (op("JAlways"), CHOOSE)]
    return out


def emit_choose(bc, fn, k, r, at, op):
    """The word that was typed, and what becomes of its place."""
    out = [CHOOSE + ":", op("Label")]
    for word in board.words():
        out += _same(bc, k, r, op, r["t2"], word, "mod say: it is " + word)
    out += [(op("JAlways"), NO_WORD)]
    for word in board.words():
        out += ["mod say: it is %s:" % word, op("Label")]
        if not board.in_this_build(word):
            out += _say(bc, fn, k, r, at, op, ["mod say: `%s` is%s" % (word, NOT_BUILT)])
            out += [(op("JAlways"), DONE)]
            continue
        given = "mod say: %s was given a tempo" % word
        out += [op("Int", dst=r["n"], ptr=number(bc, board.UNTOUCHED)),
                (op("JNotEq", a=r["wanted"], b=r["n"]), given),
                op("Int", dst=r["wanted"], ptr=number(bc, board.tempo_of(word))),
                given + ":", op("Label"),
                op("SetGlobal", **{"global": board.slot(bc, board.STATE, word),
                                   "src": r["wanted"]}),
                (op("JAlways"), THE_BOARD)]
    return out


def emit_all_off(bc, r, op):
    """Every word back to silent, whatever each was doing."""
    out = [ALL_OFF + ":", op("Label"),
           op("Int", dst=r["wanted"], ptr=number(bc, board.OFF))]
    for word in board.words():
        out.append(op("SetGlobal", **{"global": board.slot(bc, board.STATE, word),
                                      "src": r["wanted"]}))
    return out + [(op("JAlways"), THE_BOARD)]


def _reads_as(bc, r, op, word):
    """The word that says what this one is doing right now, picked out of the five states."""
    done = "mod say: %s reads as" % word
    out = [op("GetGlobal", **{"dst": r["statetext"],
                              "global": text_object(bc, board.READS_AS[board.OFF])})]
    for value in (board.AT_GAME, board.AT_TICK, board.AT_PASS, board.FREE):
        past = "mod say: %s is not %d" % (word, value)
        out += [op("Int", dst=r["mark"], ptr=number(bc, value)),
                (op("JNotEq", a=r["state"], b=r["mark"]), past),
                op("GetGlobal", **{"dst": r["statetext"],
                                   "global": text_object(bc, board.READS_AS[value])}),
                (op("JAlways"), done),
                past + ":", op("Label")]
    return out + [done + ":", op("Label")]


def emit_row(bc, fn, k, r, at, op, word):
    """One word's row: what it declares, what it is doing, and what it has dropped since."""
    chosen = "mod say: %s state is chosen" % word
    head = "  %-21s %-5s " % (word, onoff.TEMPO[word])
    if not board.in_this_build(word):
        head += "[not in this build] "
    return board.emit_state(bc, op, word, r["state"], r["mark"], chosen) \
        + _reads_as(bc, r, op, word) \
        + [op("GetGlobal", **{"dst": r["dropped"],
                              "global": board.slot(bc, board.DROPPED, word)})] \
        + _say(bc, fn, k, r, at, op,
               [head, (r["statetext"], oneline.TEXT), ", dropped ",
                (r["dropped"], oneline.COUNT)])


def emit_board(bc, fn, k, r, at, op):
    """Every word, one row each, read off the places rather than off anything remembered."""
    out = [THE_BOARD + ":", op("Label")] + _say(bc, fn, k, r, at, op, [HEADER])
    for word in board.words():
        out += emit_row(bc, fn, k, r, at, op, word)
    return out + [(op("JAlways"), DONE)]


def emit_command(bc, fn, k, r, at):
    """The whole line: parsed, acted on, answered -- and every exit of ours returns."""
    op = _op(bc)
    out = emit_parse(bc, k, r, op) + emit_action(bc, k, r, op)
    out += emit_choose(bc, fn, k, r, at, op) + emit_all_off(bc, r, op)
    out += emit_board(bc, fn, k, r, at, op)
    for which in (USAGE, NO_WORD, NO_TEMPO, FRAME_REFUSED):
        out += _lines(bc, fn, k, r, at, op, which)
    # the one answer that hands the line back to the game: it was never a line of ours
    out += _lines(bc, fn, k, r, at, op, COMPARE_SAID_NO, leaves=NOT_OURS)
    return assemble(out + [DONE + ":", op("Label"), op("Ret", ret=r["back home"]),
                           NOT_OURS + ":", op("Label")])


def install(bc):
    """Put the command in front of every typed line, so ours never reaches the game's parser."""
    if not onoff.on(NAME):
        return "modsay: OFF"
    k = kit(bc)
    fn = k["where"]
    r = places(bc, fn, k)
    at = oneline.places(bc, fn)
    block = emit_command(bc, fn, k, r, at)
    insert(bc, fn, 0, block, "the `mod say` line", traps.IN_PLAY)
    here = [w for w in board.words() if board.in_this_build(w)]
    return ("`MOD SAY`: %d instruction(s) at the head of `%s` -- %d word(s) on the board, %d of "
            "them reachable without another build" % (len(block), HANDLE, len(board.words()),
                                                      len(here)))
