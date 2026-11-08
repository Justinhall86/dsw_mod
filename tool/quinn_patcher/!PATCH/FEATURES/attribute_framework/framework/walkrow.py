"""One row of a road's walk: opened, gated on the host, read, remembered, noted and closed."""
from tools.project import gv
from tools.hlcode import field_by_name, function_named, number
from framework import (carrierplace, columns, triggermatch, lasttick, oneline, parsed, passtray,
                       reach, rederive, rehosted, saidrow, sayonce, scopematch, setreach, settle,
                       tray)
from framework.acts import gain_ttrait_stacks
from framework.storewalk import (APP, BUCKETS, FOREIGN_ROWS, HOST_NOT_A_STATE, HOST_REACH, HOST_ROW,
                             HOST_ROW_PAST, NEXT_APP, NEXT_ROW, NEXT_STORE, REACHED, ROW,
                             _a_set_row_is_not_another_building_s, _granted_to_the_place,
                             _naming_the_holder, _saying_it_was_refused, _saying_the_reach,
                             _saying_the_region_pass, _saying_the_scope, say_the_column,
                             say_the_hook, take_what_the_row_itself_said)


def _moved_or_reconciled(bc, fn, op, reader, into, asked, here, leave):
    """A trait row is reconciled to a TOTAL: a reach that moved it is walked on every carrier."""
    through = "%s: a trait row a reach moved" % here
    others = "%s: not a trait row" % here
    out = [op("Int", dst=asked, ptr=number(bc, gain_ttrait_stacks.NUMBER)),
           (op("JNotEq", a=into["does"], b=asked), others)]
    for value in sorted(reach.claimed(bc)):
        out += [op("Int", dst=asked, ptr=number(bc, value)),
                (op("JEq", a=into[reach.NAMED], b=asked), through)]
    return (out + [(op("JAlways"), leave), others + ":", op("Label")]
            + reach.emit_moved_by_another_word(bc, fn, op, into[reach.NAMED], into["scope"],
                                               reader, here, leave)
            + [through + ":", op("Label")])


def remembering_this_one(bc, fn, op, site, reader, into, walk, host, carriers, village):
    """What is remembered is WHERE THE ROW IS: the host for a host row, else the thing."""
    past = "%s: this row leaves no carrier" % site.word
    host_left = carrierplace.host_leaves(site.word)
    own_pass = "%s: a row on the thing's own store" % site.word
    asked, count = walk.asked, walk.count
    return ([
        op("Int", dst=asked, ptr=number(bc, 0)),
        (op("JEq", a=count["store"], b=asked), own_pass)]
        + ([] if not host.on else
           [op("Int", dst=asked, ptr=number(bc, 2)),
            (op("JNotEq", a=count["store"], b=asked), past),
            # a row in by the host's own door leaves no carrier: its own pass reads it
            op("Int", dst=asked, ptr=number(bc, 1)),
            (op("JEq", a=host.by_the_door, b=asked), past)]
           + _moved_or_reconciled(bc, fn, op, reader, into, asked,
                                  "%s host carrier" % site.word, host_left[0])
           + host.reaching(host.mine)
           + [(op("JNull", reg=host.mine), host_left[1])]
           + rehosted.emit_remember(bc, fn, host.mine, carriers.list, carriers.known, past,
                                    stands=carriers.stands, standing=village)
           + sayonce.emit(bc, fn, rehosted.REMEMBERED + " (from a host)", even_when_quiet=True)
           + carrierplace.emit_host_leaves(bc, fn, op, site.word, past))
        + [own_pass + ":", op("Label")]
        + _moved_or_reconciled(bc, fn, op, reader, into, asked, "%s carrier" % site.word, past)
        + rehosted.emit_remember(bc, fn, 0, carriers.list, carriers.known, past,
                                 stands=carriers.stands, standing=village)
        + sayonce.emit(bc, fn, rehosted.REMEMBERED, even_when_quiet=True)
        + [past + ":", op("Label")])


def only_a_moved_row(bc, fn, op, site, reader, into, walk, carriers, holders, places,
                     the_region):
    """On a carrier's pass, a row the reach did NOT move is stepped over."""
    own = "%s: not a row a reach moved" % site.word
    asked, count = walk.asked, walk.count
    return ([
        # only on carrier passes, another faction's carrier too; ⛔ by the road's own store count
        op("Int", dst=asked, ptr=number(bc, holders)),
        (op("JSLt", a=count["store"], b=asked), own),
        op("Add", dst=asked, a=asked, b=carriers.how_many),
        (op("JSGte", a=count["store"], b=asked), own)]
        # never the claiming word; leave to the next APPLICATION, as reach is per application
        + _moved_or_reconciled(bc, fn, op, reader, into, asked, "%s walked" % site.word,
                               NEXT_APP)
        + carrierplace.emit(bc, fn, op, site.word, into[reach.NAMED], asked, places,
                            the_region, "%s walked" % site.word, NEXT_APP)
        + sayonce.emit(bc, fn, rehosted.WALKED, even_when_quiet=True)
        + [own + ":", op("Label")])


def noting(bc, fn, op, site, into, walk, its_own):
    """A trait row notes its receiver for the sweep, so the settle can take it back."""
    grants = "%s: this row grants no trait" % site.word
    return ([
        op("Int", dst=walk.asked, ptr=number(bc, gain_ttrait_stacks.NUMBER)),
        (op("JNotEq", a=into["does"], b=walk.asked), grants)]
        # the receiver goes in the pass's list, whoever it is: the sweep walks what was touched
        + settle.emit_touch(bc, fn, walk.read_against, site.word, held=its_own)
        + settle.emit_note(bc, fn, walk.read_against, into[columns.PART], site.word)
        # and where it outlives the pass, so the world's tick takes back what nobody grants
        + lasttick.emit_seen(bc, fn, walk.read_against, site.word, "%s window" % site.word)
        # AND THE DURABLE RECORD: this holder owes the receiver a reconcile from now on
        + settle.emit_mine(bc, fn, walk.its_thing, walk.read_against, site.word,
                           "%s owes" % site.word)
        + [grants + ":", op("Label")])


def opening_a_row(bc, fn, op, site, sentinel, ids, walk, region, two_holders):
    """Each row above the sentinel and each application on it, its row id read first."""
    count = walk.count
    not_foreign = "%s: not a foreign pass" % site.word
    not_the_region_s = "%s: not the region's pass" % site.word
    return (
        # an empty store is no fault: it moves on to the next holder
        [(op("JNull", reg=walk.store), NEXT_STORE),
         op("Field", dst=walk.buckets, obj=walk.store, field=site.buckets_at),
         (op("JNull", reg=walk.buckets), NEXT_STORE),
         op("Field", dst=count["howmany"], obj=walk.buckets, field=site.count_at)]
        # ⚠ said only on a foreign pass, once the store and its buckets are in hand
        + ([op("Int", dst=walk.asked, ptr=number(bc, 0)),
            (op("JEq", a=walk.from_foreign, b=walk.asked), not_foreign)]
           + sayonce.emit(bc, fn, FOREIGN_ROWS % site.word, even_when_quiet=True)
           + [not_foreign + ":", op("Label")] if two_holders else [])
        # a modder's rows begin one below the sentinel, and that is where the walk starts
        + [op("Mov", dst=count["rows"], src=sentinel),
           op("Incr", dst=count["rows"])]
        + [ROW + ":",
           op("Label"),
           (op("JSGte", a=count["rows"], b=count["howmany"]), NEXT_STORE),
           op("Call2", dst=walk.bucket, fun=gv(function_named(bc, BUCKETS).findex),
              arg0=walk.store, arg1=count["rows"]),
           (op("JNull", reg=walk.bucket), NEXT_ROW),
           op("Field", dst=count["apps"], obj=walk.bucket, field=site.bucket_count_at),
           op("Field", dst=walk.holds, obj=walk.bucket, field=site.holds_at),
           (op("JNull", reg=walk.holds), NEXT_ROW),
           op("Int", dst=count["at"], ptr=number(bc, 0)),
           APP + ":",
           op("Label"),
           (op("JSGte", a=count["at"], b=count["apps"]), NEXT_ROW),
           op("GetArray", dst=walk.boxed, array=walk.holds, index=count["at"]),
           (op("JNull", reg=walk.boxed), NEXT_APP),
           op("SafeCast", dst=walk.application, src=walk.boxed),
           (op("JNull", reg=walk.application), NEXT_APP),
           # which authored row this is, read IN FRONT OF EVERY GATE, so no refusal hides it
           op("Field", dst=walk.row_id, obj=walk.application, field=ids.row_id_at)]
        # IS THIS ROW ONE THE REGION WAS CARRYING? also said in front of every gate
        + ([] if not region.read or not _saying_the_region_pass() else
           [op("Int", dst=walk.asked, ptr=number(bc, 1)),
            (op("JNotEq", a=walk.from_region, b=walk.asked), not_the_region_s)]
           + sayonce.emit(bc, fn, "SPINE the %s road read a row out of its region's store"
                          % site.word, even_when_quiet=True)
           + [not_the_region_s + ":", op("Label")]))


def the_host_gate(bc, fn, op, site, reader, walk, host):
    """ON THE HOST'S PASS: another building's stamped row is refused; an unstamped one fans out."""
    if not host.on:
        return []
    not_the_host_s = "%s: not the host's pass" % site.word
    not_a_state = "%s: not a building state" % site.word
    past_the_test = "%s: past the state test" % site.word
    nothing_to_say = "%s: nothing to say here" % site.word
    return ([
        # the host-door flag starts clear for every row
        op("Int", dst=host.by_the_door, ptr=number(bc, 0)),
        op("Int", dst=host.wanted_stamp, ptr=number(bc, 0)),
        (op("JEq", a=host.from_host, b=host.wanted_stamp), not_the_host_s),
        op("Field", dst=host.the_stamp, obj=walk.application, field=host.stamp_at),
        # no stamp at all: the host's own row, judged by its own scope word like any other
        (op("JNull", reg=host.the_stamp), not_the_host_s),
        op("EnumIndex", dst=host.which_stamp, value=host.the_stamp),
        op("Int", dst=host.wanted_stamp, ptr=number(bc, host.upgrade_case)),
        # a row not stamped as a building state takes the host door, and the word names it
        (op("JNotEq", a=host.which_stamp, b=host.wanted_stamp), not_a_state),
        (op("JAlways"), past_the_test),
        not_a_state + ":", op("Label"),
        # marked as in by the host door, so the remembering leaves no carrier for it
        op("Int", dst=host.by_the_door, ptr=number(bc, 1))]
        + ([] if not setreach.saying() else
           oneline.emit(bc, fn, op, walk.host_said,
                        [HOST_NOT_A_STATE % site.word, (walk.row_id, oneline.TEXT)],
                        setreach.WORD))
        + [(op("JAlways"), not_the_host_s),
           past_the_test + ":", op("Label"),
           op("EnumField", dst=host.stamp_names, value=host.the_stamp,
              construct=host.upgrade_case, field=0),
           (op("JNull", reg=host.stamp_names), NEXT_APP)]
        # A SET-, REGION- OR FACTION-REACH ROW LEAVES BEFORE THE KIND COMPARISON; blank meets it
        + _a_set_row_is_not_another_building_s(bc, fn, op, walk.application, host.set_reach,
                                               reader, past=not_the_host_s)
        + [op("Field", dst=host.their_kind, obj=0, field=field_by_name(
            bc, site.holder_kind, host.stamped_by, "the holder these rules are about")[0]),
           (op("JNotEq", a=host.stamp_names, b=host.their_kind), NEXT_APP),
           not_the_host_s + ":", op("Label")]
        + ([] if not setreach.saying() else
           [op("Int", dst=host.wanted_stamp, ptr=number(bc, 0)),
            (op("JEq", a=host.from_host, b=host.wanted_stamp), nothing_to_say)]
           + oneline.emit(bc, fn, op, walk.host_said,
                          [HOST_ROW % site.word, (walk.row_id, oneline.TEXT),
                           HOST_REACH, (host.set_reach, oneline.COUNT)], setreach.WORD)
           + [nothing_to_say + ":", op("Label")]))


def reading_the_row(bc, fn, op, site, reader, ids, into, walk, host, places, ledgers):
    """The row read: said, asked if new, its parts, its own columns, its reach, its holder."""
    count = walk.count
    a_host_row = "%s: a host row, say it" % site.word
    return (
        # a row of ours was reached, in front of every gate: once a world, or each time if naming
        (sayonce.emit_word_always(bc, fn, REACHED % site.word, even_when_quiet=True)
         if _naming_the_holder.on() else
         sayonce.emit(bc, fn, REACHED % site.word, even_when_quiet=True))
        # is this row new to us? The answer stays up for the whole road; the map is told after
        + saidrow.emit_ask(bc, fn, ledgers.said_map, walk.application, walk.is_new,
                           [walk.holder_id, walk.row_id])
        # the stage path follows this one, and on a road with a host it follows it only there
        + [op("Mov", dst=walk.say_here, src=walk.is_new)]
        + ([] if not host.on else
           [op("Int", dst=count["wanted"], ptr=number(bc, 0)),
            (op("JNotEq", a=host.from_host, b=count["wanted"]), a_host_row),
            op("Bool", dst=walk.say_here, value=False),
            a_host_row + ":", op("Label")])
        # the row's own value, packed onto the application when the game filed it
        + [op("Field", dst=walk.value, obj=walk.application, field=ids.value_at)]
        + parsed.emit_reading(bc, fn, walk.application, into, ledgers.maps, reader)
        # A RESTORED ROW HAS NO RECORD: work it out once per application and read it back
        + rederive.emit(bc, fn, application=walk.application, row_id=walk.row_id,
                        scope=into["scope"], scope_map=ledgers.maps["scope"],
                        first_pass=ledgers.first_pass, reader=reader)
        # AND WHAT THE ROW ITSELF SAID BEATS IT: its own columns arrive ON the application
        + take_what_the_row_itself_said(bc, fn, op, walk.application,
                                        which=into["column"], into=into[columns.PART],
                                        flag=walk.is_new)
        + say_the_column(bc, fn, op, walk.is_new, into["column"], count["wanted"])
        + say_the_hook(bc, fn, op, walk.is_new, into[triggermatch.NAMED], count["wanted"])
        # THE REACH, OFF THE ROW THE APPLICATION CARRIES: read HERE, as the bake runs too early
        + reach.emit_take_off_the_row(bc, fn, op, walk.application, into[reach.NAMED], reader,
                                      on_road=site.word, row_id=walk.row_id)
        # WHICH THING THIS ROW IS READ AGAINST, settled before any gate, per claimed case's name
        + reach.emit_rehost(bc, fn, op, into[reach.NAMED], 0,
                            # ⛔ ON THE VALUE, NOT THE KEY: a named place may be EMPTY
                            {reach.case_value(bc, case): places[onto]
                             for case, onto in scopematch.rehosts_onto().items()
                             if places.get(onto) is not None},
                            walk.read_against, reader, word=into["scope"], leave=NEXT_ROW)
        # A SET REACH: is this thing in the set? walked on the store holder's village's members
        + setreach.emit_is_a_member(bc, fn, op, reader, site.word, into[reach.NAMED],
                                    walk.whose_store, NEXT_ROW))


def once_past_the_gates(bc, fn, op, site, reader, into, walk, host, places, ledgers):
    """THIS ROW'S OWN TRAY, opened only past every gate, never per tick."""
    not_a_host_row = "%s: not a host row" % site.word
    return (
        # THE ROAD'S OWN PAYEE, PUT BACK FOR EVERY ROW: an act may move it
        [op("Mov", dst=walk.shown_to, src=places["owner"])]
        # WHO GAINS IT, decided only here: a place word grants to the place
        + _granted_to_the_place(bc, fn, op, into["scope"], places, walk.read_against, reader,
                                site.word)
        # the mark that this row got through, read past the exit
        + ([op("Int", dst=walk.got_past, ptr=number(bc, 1))]
           if _naming_the_holder.on() else [])
        # and the same row id past every gate, said only on a host pass
        + ([] if not (host.on and setreach.saying()) else
           [op("Int", dst=walk.count["wanted"], ptr=number(bc, 0)),
            (op("JEq", a=host.from_host, b=walk.count["wanted"]), not_a_host_row)]
           + oneline.emit(bc, fn, op, walk.host_said,
                          [HOST_ROW_PAST % site.word, (walk.row_id, oneline.TEXT)],
                          setreach.WORD)
           + [not_a_host_row + ":", op("Label")])
        + passtray.emit_open(bc, fn, walk.over, (tray.ENTRIES, tray.WHERE, tray.ALREADY))
        # A TRIGGER'S OWN PLACE (a pillaged village) beats the stand-in
        + ledgers.aiming)


def closing_the_row(bc, fn, op, site, into, walk, ledgers):
    """PAST THE WHOLE ROAD, refusals included: this row has said itself now."""
    count = walk.count
    return (saidrow.emit_mark(bc, fn, ledgers.said_map, walk.application, walk.is_new)
            # AND THE ROW JUST FINISHED, NAMED, refused or not, right under any refusal's word
            + ([] if not _naming_the_holder.on() else
               _saying_it_was_refused(bc, fn, op, walk.got_past, site.word)
               + sayonce.emit_always(bc, fn, walk.row_id)
               # AND ITS TARGET, the one thing telling two rows of one name apart
               + sayonce.emit_always(bc, fn, into[columns.PART])
               + _saying_the_scope(bc, fn, op, into["scope"], site.word)
               # AND THE REACH it carries as the road walks it
               + _saying_the_reach(bc, fn, op, into[reach.NAMED], site.word))
            + [NEXT_APP + ":",
               op("Incr", dst=count["at"]),
               (op("JAlways"), APP),
               NEXT_ROW + ":",
               op("Incr", dst=count["rows"]),
               (op("JAlways"), ROW),
               NEXT_STORE + ":",
               op("Label")])
