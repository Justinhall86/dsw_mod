"""Settling ONE receiver past every row: each trait it was granted, set to its total once."""
from types import SimpleNamespace

from tools.project import gv
from tools.hlcode import (argument_kind, field_by_name, function_named, kind_named, method_slot,
                          number, returns_type, text_object)
from tools.hlcode import assemble
from framework import foreignwalk, ofthekind, reach, running, sayonce
from framework.oneshot import MAP
# ⛔ THE GAME'S OWN QUESTION FOR WHO OWNS A THING, TAKEN from `framework/ownermatch.py`
from framework.ownermatch import ASKED_ON as OWNED_ASKS, OWNER_OF as OWNED_BY
from framework.parsed import READ, a_new_place
from framework.tray import ARRAY_OF_ENTRIES, BACKING_ON, COUNT_ON
from framework.settle import (NO_LIST_AT_ALL, NO_TOTALS_AT_ALL, NO_TRAIT_STORE, NOTHING_TOTALLED,
                          NOTHING_TOTALLED_ON, NOTHING_WRITTEN, REACHED, SETTLED, SLOT,
                          TAKEN_BACK, TRAITS_MORE, TRAITS_ON, _leaving_here, _op, _op_of,
                          _road_of, _say_the_count_per_faction, _say_the_reading,
                          _saying_how_many, as_text, saying_it_every_pass,
                          saying_nothing_totalled, saying_the_count_per_faction,
                          saying_the_settled_number, slot)


def emit_settle(bc, fn, op, receiver, here, grant, manager_of, bucket, traits_at,
                say_the_number=False, to_nothing=False, quiet=False,
                totals_held=None):
    """PAST EVERY ROW: settle each trait this receiver has been granted, once."""
    p = _places(bc, fn, grant, manager_of, here)
    return (_what_was_listed(bc, fn, p, receiver, traits_at, here)
            + ([] if to_nothing else
               _what_this_pass_totalled(bc, fn, p, receiver, totals_held, here))
            + _the_traits_one_by_one(bc, fn, p, manager_of, quiet, here)
            + _its_total(bc, p, to_nothing, here)
            + _what_the_engine_holds(bc, fn, p, receiver, bucket, say_the_number, here)
            + _who_it_counts_for(bc, fn, p, receiver, here)
            + _each_stamp(bc, fn, p, bucket)
            + _granting(bc, fn, p, receiver, grant, bucket, say_the_number, quiet, here))


def _places(bc, fn, grant, manager_of, here):
    """Every place one receiver's settling writes, and the three labels its loop jumps to."""
    from framework.acts.gain_ttrait_stacks import COUNT as counting
    p = SimpleNamespace(counting=counting, grant=grant, done="%s: nothing to settle" % here,
                        step="%s: on to the next trait" % here, loop="%s: the next trait" % here)
    p.lists = a_new_place(bc, fn, kind_named(bc, MAP))
    p.totals = a_new_place(bc, fn, kind_named(bc, MAP))
    p.listed = a_new_place(bc, fn, kind_named(bc, ARRAY_OF_ENTRIES))
    p.inner = a_new_place(bc, fn, kind_named(bc, running.INNER))
    p.got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    p.had = a_new_place(bc, fn, returns_type(function_named(bc, running.GET), running.GET))
    # EVERY KIND HERE IS TAKEN OFF THE CALL THAT WILL BE HANDED IT, never by name
    p.trait = a_new_place(bc, fn, as_text(bc))
    p.item = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    # the backing array's kind comes OFF THE FIELD, not off a list our tray makes
    p.backing = a_new_place(bc, fn, field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES),
                                                  BACKING_ON, "a list")[1])
    p.at = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    p.many = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    p.zero = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    # ⛔⛔⛔ THE GRANT'S OWN ANSWER GETS ITS OWN PLACE, never `held`
    p.granted = a_new_place(bc, fn, returns_type(function_named(bc, grant), grant))
    p.manager = a_new_place(bc, fn, returns_type(function_named(bc, manager_of), manager_of))
    # and what a thing keeps its traits in, off that field's own declaration for the same reason
    p.carried = a_new_place(bc, fn, field_by_name(bc, kind_named(bc, reach.EVERY_HOLDER),
                                                  "_traits", "a thing that can carry traits")[1])
    p.held = a_new_place(bc, fn, kind_named(bc, reach.EVERY_HOLDER))
    # what the engine already holds of OUR bucket for a trait, asked with the call the act uses
    p.source = a_new_place(bc, fn, argument_kind(bc, counting, 1))
    p.nostyle = a_new_place(bc, fn, argument_kind(bc, counting, 2))
    p.nofaction = a_new_place(bc, fn, argument_kind(bc, counting, 3))
    p.already = a_new_place(bc, fn, returns_type(function_named(bc, counting), counting))
    # a place nothing reads, kept so every place after it keeps its number
    a_new_place(bc, fn, argument_kind(bc, sayonce.COMPLAIN))
    # ⛔ A PLACE OF ITS OWN FOR THE SAYING, never the one holding the loop's bound
    p.spare = a_new_place(bc, fn, argument_kind(bc, grant, 2))
    # another place nothing reads, kept for the same reason
    a_new_place(bc, fn, returns_type(function_named(bc, sayonce.COMPLAIN), sayonce.COMPLAIN))
    p.howmany = a_new_place(bc, fn, argument_kind(bc, grant, 1))
    # and a third
    a_new_place(bc, fn, argument_kind(bc, grant, 3))
    # who owns the receiver (the grant's slot), and the narrower place it is asked of
    p.owning = a_new_place(bc, fn, returns_type(function_named(bc, OWNED_BY), OWNED_BY))
    p.asked_of = a_new_place(bc, fn, kind_named(bc, OWNED_ASKS))
    # AND WHO THE PASS SAID THIS GRANT COUNTS FOR; nothing there credits the owner
    p.credits = a_new_place(bc, fn, kind_named(bc, MAP))
    p.credit_inner = a_new_place(bc, fn, kind_named(bc, running.INNER))
    p.credit_got = a_new_place(bc, fn, returns_type(function_named(bc, READ), READ))
    p.credit_raw = a_new_place(bc, fn, returns_type(function_named(bc, running.GET),
                                                    running.GET))
    p.credited = a_new_place(bc, fn, returns_type(function_named(bc, OWNED_BY), OWNED_BY))
    p.style = a_new_place(bc, fn, argument_kind(bc, grant, 4))
    p.holds = a_new_place(bc, fn, argument_kind(bc, grant, 6))
    # WHAT GOES IN THE OBJECT SLOT is NOT always the receiver (a region's grant puts nothing)
    p.handed = a_new_place(bc, fn, argument_kind(bc, grant, 5))
    p.counted_at, _ = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), COUNT_ON, "a list")
    p.backing_at, _ = field_by_name(bc, kind_named(bc, ARRAY_OF_ENTRIES), BACKING_ON, "a list")
    return p


def _what_was_listed(bc, fn, p, receiver, traits_at, here):
    """The receiver's traits and the list of what it was ever granted; nothing there, done."""
    return [
        (_op(bc, "JNull", reg=receiver), p.done),
        # ⛔ READ OFF A PLACE OF THE KIND EVERY HOLDER SHARES, never the road's own register
        _op(bc, "UnsafeCast", dst=p.held, src=receiver),
        # a thing with no traits at all faults inside the accessor rather than answering nothing
        _op(bc, "Field", dst=p.carried, obj=p.held, field=traits_at),
    ] + _leaving_here(bc, fn, p.carried, NO_TRAIT_STORE, here, p.done) + [
        _op(bc, "GetGlobal", **{"dst": p.lists, "global": slot(bc, SLOT, _road_of(here))}),
    ] + _leaving_here(bc, fn, p.lists, NO_LIST_AT_ALL, here, p.done) + [
        _op(bc, "Call2", dst=p.got, fun=gv(function_named(bc, READ).findex),
            arg0=p.lists, arg1=receiver),
        _op(bc, "SafeCast", dst=p.listed, src=p.got),
    ] + _leaving_here(bc, fn, p.listed, NOTHING_WRITTEN, here, p.done)


def _what_this_pass_totalled(bc, fn, p, receiver, totals_held, here):
    """What this pass totalled: the pass's own map if the road keeps one, else the shared one."""
    totalled = "%s: this pass totalled something" % here
    return (([_op(bc, "Mov", dst=p.totals, src=totals_held)] if totals_held is not None else
             [_op(bc, "GetGlobal", **{"dst": p.totals, "global": running.slot(bc)})])
            + _leaving_here(bc, fn, p.totals, NO_TOTALS_AT_ALL, here, p.done) + [
        _op(bc, "Call2", dst=p.got, fun=gv(function_named(bc, READ).findex),
            arg0=p.totals, arg1=receiver),
        _op(bc, "SafeCast", dst=p.inner, src=p.got),
    ] + (
        # ⛔ A RECEIVER WITH NOTHING TOTALLED, said once per world
        [(_op(bc, "JNotNull", reg=p.inner), totalled)]
        + (sayonce.emit(bc, fn, NOTHING_TOTALLED_ON % (_road_of(here) or here),
                        True, "nothingtotalled")
           if saying_nothing_totalled() and not saying_it_every_pass()
           else sayonce.emit_word_now(bc, fn, NOTHING_TOTALLED, "nothingtotalled"))
        # ⛔ THE WORD CARRIES NO EXIT: both branches fall through; a missing total reads as zero
        + [totalled + ":", _op(bc, "Label")]
        if saying_it_every_pass() or saying_nothing_totalled() else
        # AND NOTHING LEAVES HERE: nothing totalled owes every trait a zero (retraction)
        []))


def _the_traits_one_by_one(bc, fn, p, manager_of, quiet, here):
    """The engine's manager for the receiver, then one turn of the loop per listed trait."""
    return [
        _op(bc, "Call1", dst=p.manager, fun=gv(function_named(bc, manager_of).findex),
            arg0=p.held),
        (_op(bc, "JNull", reg=p.manager), p.done),
        _op(bc, "Field", dst=p.many, obj=p.listed, field=p.counted_at),
    ] + _saying_how_many(bc, fn, p.spare, p.many, _road_of(here) or here,
                         TRAITS_ON, TRAITS_MORE, here, "traits") + [
        _op(bc, "Field", dst=p.backing, obj=p.listed, field=p.backing_at),
        _op(bc, "Int", dst=p.at, ptr=number(bc, 0)),
    ] + ([] if quiet else sayonce.emit(bc, fn, REACHED, even_when_quiet=True)) + [
        p.loop + ":",
        _op(bc, "Label"),
        (_op(bc, "JSGte", a=p.at, b=p.many), p.done),
        _op(bc, "GetArray", dst=p.item, array=p.backing, index=p.at),
        _op(bc, "UnsafeCast", dst=p.trait, src=p.item),
        # ⛔ NO WORD ON THIS SKIP: it is never taken
        (_op(bc, "JNull", reg=p.trait), p.step),
    ]


def _its_total(bc, p, to_nothing, here):
    """This trait's total for the pass; at the world's own tick every trait is handed zero."""
    if to_nothing:
        # and no totals, so every stamped copy is taken back with the rest
        return [_op(bc, "Int", dst=p.zero, ptr=number(bc, 0)), _op(bc, "Null", dst=p.inner)]
    nothing = "%s: nothing totalled" % here
    return [
        # ⛔ AND NO TOTALS AT ALL IS A ZERO, like a trait missing from the map
        _op(bc, "Int", dst=p.zero, ptr=number(bc, 0)),
        (_op(bc, "JNull", reg=p.inner), nothing),
        _op(bc, "Call2", dst=p.had, fun=gv(function_named(bc, running.GET).findex),
            arg0=p.inner, arg1=p.trait),
        # ⛔ NOTHING IS SKIPPED: a trait settles at its total or at nothing, ONE reconcile a pass
        (_op(bc, "JNull", reg=p.had), nothing),
        _op(bc, "SafeCast", dst=p.zero, src=p.had),
        nothing + ":",
        _op(bc, "Label"),
    ]


def _what_the_engine_holds(bc, fn, p, receiver, bucket, say_the_number, here):
    """AND ONLY WHEN THE NUMBER CHANGES: the engine's grant re-walks its applications."""
    not_back = "%s: this is not a retraction" % here
    return [
        _op(bc, "MakeEnum", dst=p.source, construct=0, args=[bucket]),
        _op(bc, "Null", dst=p.nostyle),
        _op(bc, "Null", dst=p.nofaction),
        # ⛔⛔⛔ NOTHING GOES IN THE OBJECT SLOT, FOR ANY RECEIVER: the bar totals by id alone
        _op(bc, "Null", dst=p.handed),
        _op(bc, "CallN", dst=p.already, fun=gv(function_named(bc, p.counting).findex),
            args=[p.manager, p.trait, p.source, p.nostyle, p.nofaction, p.handed]),
    ] + (
        # SAID BEFORE THE TEST BELOW, a line per pass, hence the switch
        _say_the_reading(bc, fn, _op_of(bc), receiver, p.trait, p.zero, here,
                         "settlednumberalways")
        if say_the_number and saying_it_every_pass() else []
    ) + _unless_stamped(bc, fn, p, receiver) + (
        # said where a trait is genuinely taken back
        [_op(bc, "Int", dst=p.spare, ptr=number(bc, 0)),
         (_op(bc, "JNotEq", a=p.zero, b=p.spare), not_back),
         (_op(bc, "JEq", a=p.already, b=p.spare), not_back)]
        + sayonce.emit_word_now(bc, fn, TAKEN_BACK, "settlednumberalways")
        + [not_back + ":", _op(bc, "Label")]
        if saying_it_every_pass() else []
    )


def _who_it_counts_for(bc, fn, p, receiver, here):
    """Who the grant counts for: what a rider said, else whoever owns the receiver, else nobody."""
    unowned = "%s: nothing owns this receiver" % here
    # and the other way in to it: a receiver that cannot even be ASKED the question
    cannot_answer = "%s: this receiver cannot answer who owns it" % here
    # and the rider's three: no rider here, a rider saying nobody, a rider naming a faction
    no_rider = "%s: no rider said who this counts for" % here
    rider_said_nobody = "%s: a rider said this counts for everybody" % here
    rider_said = "%s: a rider named who this counts for" % here
    return [
        _op(bc, "Ref", dst=p.howmany, src=p.zero),
        # ⛔ A RECEIVER NOBODY OWNS IS GRANTED TO WITH NOTHING IN THAT SLOT, as the game does
        _op(bc, "Null", dst=p.owning),
        # WHAT A RIDER SAID, FIRST: a faction is `ForMe`, a non-faction `ForAll`, nothing falls back
        _op(bc, "GetGlobal", **{"dst": p.credits, "global": running.slot(bc, running.CREDIT)}),
        (_op(bc, "JNull", reg=p.credits), no_rider),
        _op(bc, "Call2", dst=p.credit_got, fun=gv(function_named(bc, READ).findex),
            arg0=p.credits, arg1=receiver),
        _op(bc, "SafeCast", dst=p.credit_inner, src=p.credit_got),
        (_op(bc, "JNull", reg=p.credit_inner), no_rider),
        _op(bc, "Call2", dst=p.credit_raw, fun=gv(function_named(bc, running.GET).findex),
            arg0=p.credit_inner, arg1=p.trait),
        (_op(bc, "JNull", reg=p.credit_raw), no_rider),
        # ⛔ ASKED OF THE GAME, NEVER CAST: `ForAll` stores something that is not a faction
    ] + ofthekind.emit(bc, fn, _op_of(bc), p.credit_raw, p.credited,
                       returns_type(function_named(bc, OWNED_BY), OWNED_BY),
                       rider_said_nobody) + [
        _op(bc, "Mov", dst=p.owning, src=p.credited),
        (_op(bc, "JAlways"), rider_said),
        rider_said_nobody + ":", _op(bc, "Label"),
        _op(bc, "Null", dst=p.owning),
        rider_said + ":", _op(bc, "Label"),
        (_op(bc, "JAlways"), unowned),
        no_rider + ":", _op(bc, "Label"),
        # ⛔⛔⛔ CLASS-OR-BELOW, NOT EXACT: `ent.Entity` is a SUPERCLASS
    ] + ofthekind.emit_or_below(bc, fn, _op_of(bc), p.held, p.asked_of,
                                kind_named(bc, OWNED_ASKS), cannot_answer) + [
        # ASKED ON THE SLOT, NOT BY NAME, so the receiver answers ITS OWN WAY
        _op(bc, "CallMethod", dst=p.owning,
            field=method_slot(bc, kind_named(bc, OWNED_ASKS), OWNED_BY.rsplit(".", 1)[-1],
                              OWNED_ASKS),
            args=[p.asked_of]),
        (_op(bc, "JAlways"), unowned),
        # ⛔ A RECEIVER THAT CANNOT SAY WHO OWNS IT IS CREDITED TO NOBODY, never the road's payee
        cannot_answer + ":", _op(bc, "Label"),
        unowned + ":", _op(bc, "Label"),
    ]


def _granting(bc, fn, p, receiver, grant, bucket, say_the_number, quiet, here):
    """The grant itself, the readings that follow it, and on to the next trait."""
    # THE GRANT ITSELF IS `_each_stamp`'s; AND THE ONE READING THAT SEES A RIDER, asked PAST it
    return (_say_the_count_per_faction(bc, fn, _op_of(bc), receiver, p.trait, p.manager, p.source,
                                    p.nostyle, p.handed, p.counting, here)
         if say_the_number and saying_the_count_per_faction() else []) + (
        # said once per world, whichever receiver settled first
        [] if quiet else sayonce.emit(bc, fn, SETTLED, even_when_quiet=True)) + (
        # AND THE READING: which trait and what it settled to, only where the number CHANGED
        _say_the_reading(bc, fn, _op_of(bc), receiver, p.trait, p.zero, here)
        if say_the_number and saying_the_settled_number() else []
    ) + [
        p.step + ":",
        _op(bc, "Label"),
        _op(bc, "Incr", dst=p.at),
        (_op(bc, "JAlways"), p.loop),
        p.done + ":",
        _op(bc, "Label"),
    ]


def _like(fn, reg):
    return gv(list(fn.regs)[reg])


def _called(bc, name):
    return gv(function_named(bc, name).findex)


# ⛔ TWO SHARED FUNCTIONS, never inline: the settling sits in six of the game's own functions
UNCHANGED, EACH_STAMP = "a trait's total unchanged, stamps and all", "each faction's stamped copy"


def _shared(bc, fn, key, handed, body):
    """One function of ours over `handed`, answering a truth; the call to it, into `into`."""
    from tools.hlcode import shared_function
    from framework.pipeline import hands_for
    kinds = [_like(fn, r) for r in handed]
    made = shared_function(bc, fn, hands_for, (key,) + tuple(kinds), kinds,
                           kind_named(bc, "Bool"), lambda hands: assemble(body(hands["fn"]())))
    into = a_new_place(bc, fn, kind_named(bc, "Bool"))
    return into, _op(bc, "CallN", dst=into, fun=made, args=list(handed))


def _answer(bc, fn, label):
    """Past `label`: a true answer; before it, a false one."""
    said = a_new_place(bc, fn, kind_named(bc, "Bool"))
    return [_op(bc, "Bool", dst=said, value=False), _op(bc, "Ret", ret=said),
            label + ":", _op(bc, "Label"),
            _op(bc, "Bool", dst=said, value=True), _op(bc, "Ret", ret=said)]


def _keyed(bc, fn, trait, faction, into):
    """`into`: the trait's key stamped to `faction`, or with none, its key of every stamp."""
    sep = a_new_place(bc, fn, _like(fn, trait))
    out = [_op(bc, "GetGlobal", **{"dst": sep, "global": text_object(bc, running.STAMPED_TO)}),
           _op(bc, "Call2", dst=into, fun=_called(bc, running.JOINED_BY), arg0=trait, arg1=sep)]
    if faction is None:
        return out
    at, uid_kind = field_by_name(bc, kind_named(bc, running.FACTION), running.ITS_NUMBER,
                                 "a faction")
    as_faction, uid = (a_new_place(bc, fn, kind_named(bc, running.FACTION)),
                       a_new_place(bc, fn, gv(uid_kind)))
    boxed = a_new_place(bc, fn, argument_kind(bc, running.AS_TEXT, 0))
    said = a_new_place(bc, fn, returns_type(function_named(bc, running.AS_TEXT),
                                            running.AS_TEXT))
    return out + [_op(bc, "UnsafeCast", dst=as_faction, src=faction),
                  _op(bc, "Field", dst=uid, obj=as_faction, field=at),
                  _op(bc, "ToDyn", dst=boxed, src=uid),
                  _op(bc, "Call1", dst=said, fun=_called(bc, running.AS_TEXT), arg0=boxed),
                  _op(bc, "Call2", dst=into, fun=_called(bc, running.JOINED_BY), arg0=into,
                      arg1=said)]


def _looked_up(bc, fn, inner, key, into):
    """`into`: what `inner` holds under `key`, or 0."""
    had = a_new_place(bc, fn, returns_type(function_named(bc, running.GET), running.GET))
    none = "nothing under %d" % key
    return [_op(bc, "Int", dst=into, ptr=number(bc, 0)),
            (_op(bc, "JNull", reg=inner), none),
            _op(bc, "Call2", dst=had, fun=_called(bc, running.GET), arg0=inner, arg1=key),
            (_op(bc, "JNull", reg=had), none),
            _op(bc, "SafeCast", dst=into, src=had),
            none + ":", _op(bc, "Label")]


def _unless_stamped(bc, fn, p, receiver):
    """Past this when nothing changed, stamps counted; ⛔ no text joined where no rider spoke."""
    def body(made):
        credits, got = (a_new_place(bc, made, kind_named(bc, MAP)),
                        a_new_place(bc, made, returns_type(function_named(bc, READ), READ)))
        key, total = a_new_place(bc, made, _like(made, 1)), a_new_place(bc, made, _like(made, 3))
        plain = "only the unstamped total"
        return ([_op(bc, "Mov", dst=total, src=3),
                 _op(bc, "GetGlobal", **{"dst": credits,
                                         "global": running.slot(bc, running.CREDIT)}),
                 (_op(bc, "JNull", reg=credits), plain),
                 _op(bc, "Call2", dst=got, fun=_called(bc, READ), arg0=credits, arg1=0),
                 (_op(bc, "JNull", reg=got), plain)]
                + _keyed(bc, made, 1, None, key) + _looked_up(bc, made, 2, key, total)
                + [_op(bc, "Add", dst=total, a=total, b=3), plain + ":", _op(bc, "Label"),
                   (_op(bc, "JEq", a=4, b=total), "unchanged")] + _answer(bc, made, "unchanged"))
    said, call = _shared(bc, fn, UNCHANGED, [receiver, p.trait, p.inner, p.zero, p.already], body)
    return [call, (_op(bc, "JTrue", cond=said), p.step)]


def _each_stamp(bc, fn, p, bucket):
    """Every faction's copy set to its own total, then past the plain grant; nobody owns: on."""
    handed = [p.manager, p.trait, p.inner, p.owning, p.zero, p.source, p.nostyle, p.handed,
              bucket]

    def body(made):
        flist = a_new_place(bc, made, foreignwalk.the_list_kind(bc))
        upto, at, held = (a_new_place(bc, made, returns_type(function_named(bc, p.counting),
                                                             p.counting)) for _ in range(3))
        asked = a_new_place(bc, made, argument_kind(bc, p.counting, 3))
        whose, want = a_new_place(bc, made, _like(made, 3)), a_new_place(bc, made, _like(made, 4))
        key = a_new_place(bc, made, _like(made, 1))
        style, holds = (a_new_place(bc, made, argument_kind(bc, p.grant, k)) for k in (4, 6))
        howmany = a_new_place(bc, made, argument_kind(bc, p.grant, 1))
        granted = a_new_place(bc, made, returns_type(function_named(bc, p.grant), p.grant))
        return ([_op(bc, "Null", dst=style), _op(bc, "Null", dst=holds),
                 (_op(bc, "JNull", reg=3), "nobody owns it")]
                + foreignwalk.emit_the_list(bc, made, flist, "walked")
                + foreignwalk.emit_the_length(bc, made, flist, upto, "walked")
                + [_op(bc, "Int", dst=at, ptr=number(bc, 0)), "loop:", _op(bc, "Label"),
                   (_op(bc, "JSGte", a=at, b=upto), "walked")]
                + foreignwalk.emit_the_faction_at(bc, made, flist, at, asked, "next")
                + [_op(bc, "UnsafeCast", dst=whose, src=asked)]
                + _keyed(bc, made, 1, whose, key) + _looked_up(bc, made, 2, key, want) + [
                    # ⛔ THE OWNER'S COPY IS ONE: its unstamped total and its own stamp together
                    (_op(bc, "JNotEq", a=whose, b=3), "counted"),
                    _op(bc, "Add", dst=want, a=want, b=4),
                    "counted:", _op(bc, "Label"),
                    _op(bc, "CallN", dst=held, fun=_called(bc, p.counting),
                        args=[0, 1, 5, 6, asked, 7]),
                    (_op(bc, "JEq", a=held, b=want), "next"),
                    _op(bc, "Ref", dst=howmany, src=want),
                    _op(bc, "CallN", dst=granted, fun=_called(bc, p.grant),
                        args=[0, 1, howmany, 8, whose, style, 7, holds]),
                    "next:", _op(bc, "Label"),
                    _op(bc, "Incr", dst=at),
                    (_op(bc, "JAlways"), "loop"),
                    # NOBODY OWNS IT: one copy, granted as the game grants it, with no faction
                    "nobody owns it:", _op(bc, "Label"),
                    _op(bc, "Ref", dst=howmany, src=4),
                    _op(bc, "CallN", dst=granted, fun=_called(bc, p.grant),
                        args=[0, 1, howmany, 8, 3, style, 7, holds])]
                + _answer(bc, made, "walked"))
    # ⛔ THE ONLY GRANT: the plain one went in here, so the settling grew by no instruction
    return [_shared(bc, fn, EACH_STAMP, handed, body)[1]]
