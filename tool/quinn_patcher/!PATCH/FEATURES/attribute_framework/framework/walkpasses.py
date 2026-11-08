"""One pass per store a road reads: its own, its owner's, its host's, its region's, and the rest."""
from tools.project import gv
from tools.hlcode import class_global, function_named, kind_named, number
from framework import (carrierplace, foreignwalk, ofthekind, oneline, ownermatch, rehosted, sayonce,
                   setreach)
from framework.ofthekind import IS_REALLY
from framework.storewalk import (A_CARRIER, A_FOREIGN, A_HOST, A_REGION, A_SET_CARRIER,
                             EVERY_ONE_IS_FOREIGN, FOREIGN_RAN, HAVE_STORE, HOST_RAN, IS_DEAD,
                             NEXT_STORE, OWNS_IT, STORE, _the_region_pass_says)


def one_holder_stores(bc, fn, op, site, ids, walk, factions):
    """A one-holder road (`Faction`) reads its own store, then each live foreign one."""
    count = walk.count
    no_faction = "%s: the holder is no faction" % site.word
    not_to_ask = "%s: not a faction to ask" % site.word
    return ([
        op("Int", dst=count["store"], ptr=number(bc, 0)),
        STORE + ":", op("Label"),
        # every pass starts as my own; the foreign branch below says otherwise
        op("Int", dst=walk.from_foreign, ptr=number(bc, 0)),
        op("Mov", dst=walk.whose_rule, src=0),
        op("Int", dst=count["wanted"], ptr=number(bc, 0)),
        (op("JNotEq", a=count["store"], b=count["wanted"]), A_FOREIGN)]
        # a dead faction's own store is read to nobody too, gated here on pass 0
        + ofthekind.emit(bc, fn, op, 0, factions.live, kind_named(bc, ownermatch.ASKED_AS),
                         no_faction)
        + [op("Call1", dst=factions.is_dead, fun=gv(function_named(bc, IS_DEAD).findex),
              arg0=factions.live),
           (op("JTrue", cond=factions.is_dead), NEXT_STORE),
           no_faction + ":", op("Label")]
        + [
        op("Field", dst=walk.store, obj=0, field=site.store_at),
        op("UnsafeCast", dst=walk.whose_store, src=0),
        (op("JAlways"), HAVE_STORE),
        A_FOREIGN + ":", op("Label"),
        # pass 0 was mine, so faction N is pass N+1
        op("Int", dst=factions.which, ptr=number(bc, 1)),
        op("Sub", dst=factions.which, a=count["store"], b=factions.which)]
        + foreignwalk.emit_the_faction_at(bc, fn, factions.a_list, factions.which,
                                          factions.one, NEXT_STORE)
        + [(op("JNull", reg=factions.one), NEXT_STORE)]
        # a dead faction broadcasts nothing, on purpose (the base game keeps broadcasting)
        + ofthekind.emit(bc, fn, op, factions.one, factions.live,
                         kind_named(bc, ownermatch.ASKED_AS), not_to_ask)
        + [op("Call1", dst=factions.is_dead, fun=gv(function_named(bc, IS_DEAD).findex),
              arg0=factions.live),
           (op("JTrue", cond=factions.is_dead), NEXT_STORE),
           not_to_ask + ":", op("Label")]
        # asked of the game before its fields are read: the list hands back the shared kind
        + ofthekind.emit(bc, fn, op, factions.one, factions.here, gv(list(fn.regs)[0]),
                         NEXT_STORE)
        + [
        # my own store is pass 0, so it is not walked twice
        op("Field", dst=factions.owner_id, obj=factions.here, field=ids.thing_id_at),
        op("Field", dst=walk.thing_id, obj=0, field=ids.thing_id_at),
        (op("JEq", a=factions.owner_id, b=walk.thing_id), NEXT_STORE),
        op("Int", dst=walk.from_foreign, ptr=number(bc, 1)),
        op("Mov", dst=walk.whose_rule, src=factions.one),
        op("Field", dst=walk.store, obj=factions.here, field=site.store_at),
        op("UnsafeCast", dst=walk.whose_store, src=factions.here),
        HAVE_STORE + ":", op("Label")])


def opening_the_factions(bc, fn, op, site, factions):
    """The game's own factions, opened once a pass for `ForAll`; empty with no game."""
    no_game = "%s: no game to open the factions from" % site.word
    return ([op("Null", dst=factions.all),
             op("Int", dst=factions.how_many_all, ptr=number(bc, 0))]
            + foreignwalk.emit_the_list(bc, fn, factions.a_list, no_game)
            + foreignwalk.emit_the_backing(bc, fn, factions.a_list, factions.all,
                                           factions.how_many_all, no_game)
            + [no_game + ":", op("Label")])


def own_and_owner(bc, fn, op, site, walk, payee, region, host):
    """Pass 0 reads the thing's own store and pass 1 its owner's, where faction rows live."""
    count = walk.count
    # where the owner's pass sends a walk whose turn it is not
    past_owner = A_HOST if host.on else (A_REGION if region.read else A_CARRIER)
    return ([op("Int", dst=count["store"], ptr=number(bc, 0)),
             STORE + ":", op("Label"),
             # every pass starts as the thing's OWN; only the foreign branch below says otherwise
             op("Int", dst=walk.from_foreign, ptr=number(bc, 0))]
            # and on the walker's own region, which only a carrier's pass swaps out
            + carrierplace.emit_start(bc, fn, op, region.row, region.the)
            + ([] if not host.on else [op("Int", dst=host.from_host, ptr=number(bc, 0))])
            + ([] if not region.read else [op("Int", dst=walk.from_region, ptr=number(bc, 0))])
            + [
                op("Mov", dst=walk.whose_rule, src=payee.owner),
                op("Int", dst=count["wanted"], ptr=number(bc, 0)),
                (op("JNotEq", a=count["store"], b=count["wanted"]), OWNS_IT),
                op("Field", dst=walk.store, obj=0, field=site.store_at),
                op("UnsafeCast", dst=walk.whose_store, src=0),
                (op("JAlways"), HAVE_STORE),
                OWNS_IT + ":", op("Label"),
                op("Int", dst=count["wanted"], ptr=number(bc, 1)),
                (op("JNotEq", a=count["store"], b=count["wanted"]), past_owner),
                # a thing nobody owns has no owner's store to read, so this pass is simply empty
                (op("JNull", reg=payee.owner), NEXT_STORE),
                op("Field", dst=walk.store, obj=payee.owner, field=payee.store.store_at),
                op("UnsafeCast", dst=walk.whose_store, src=payee.owner),
                (op("JAlways"), HAVE_STORE)])


def the_host_s(bc, fn, op, site, walk, region, host):
    """AND THE HOST'S, for a scope that names one: a building state's rows are on the village."""
    if not host.on:
        return []
    count = walk.count
    past_host = A_REGION if region.read else A_CARRIER
    return ([A_HOST + ":", op("Label"),
             op("Int", dst=count["wanted"], ptr=number(bc, 2)),
             (op("JNotEq", a=count["store"], b=count["wanted"]), past_host)]
            + host.reaching(host.place)
            + [(op("JNull", reg=host.place), NEXT_STORE),
               op("Int", dst=host.from_host, ptr=number(bc, 1)),
               op("Field", dst=walk.store, obj=host.place, field=host.store.store_at),
               op("UnsafeCast", dst=walk.whose_store, src=host.place)]
            # the probe, past the null test: the host was FOUND, said with the thing's own name
            + ([] if not setreach.saying() else
               oneline.emit(bc, fn, op, walk.host_said,
                            [HOST_RAN % site.word, (walk.holder_id, oneline.TEXT)],
                            setreach.WORD))
            + [(op("JAlways"), HAVE_STORE)])


def the_region_s(bc, fn, op, site, walk, region, host):
    """AND THE REGION'S, THE FAN-OUT DOWNWARDS, its rows gated as the owner's are."""
    if not region.read:
        return []
    count = walk.count
    return ([A_REGION + ":", op("Label"),
             op("Int", dst=count["wanted"], ptr=number(bc, 2 + (1 if host.on else 0))),
             (op("JNotEq", a=count["store"], b=count["wanted"]), A_CARRIER)]
            + _the_region_pass_says(bc, fn, site.word, "reached the region pass")
            + [
                # a thing standing in no region leaves this pass empty
                (op("JNull", reg=region.the), NEXT_STORE),
                # ⛔ AND A REGION NOBODY HOLDS FANS OUT TO NOBODY, YET: whose rule is unanswerable
                (op("JNull", reg=region.held), NEXT_STORE)]
            + _the_region_pass_says(bc, fn, site.word, "has a region and a holder for it")
            + [
                # WHOSE RULE IT IS, the one thing this pass moves: the region's holder
                op("Mov", dst=walk.whose_rule, src=region.held),
                op("Int", dst=walk.from_region, ptr=number(bc, 1)),
                op("Field", dst=walk.store, obj=region.the, field=region.store.store_at),
                op("UnsafeCast", dst=walk.whose_store, src=region.the)]
            + _the_region_pass_says(bc, fn, site.word,
                                    "opened the store of the region it stands in")
            + [(op("JAlways"), HAVE_STORE)])


def a_carrier_s(bc, fn, op, site, reader, ids, walk, payee, region, host, carriers, holders):
    """PAST THE GAME'S OWN TWO: one pass per thing carrying a row a reach moved."""
    count, carrier = walk.count, carriers.one
    return ([
        A_CARRIER + ":", op("Label"),
        op("Int", dst=carriers.which, ptr=number(bc, holders)),
        op("Sub", dst=carriers.which, a=count["store"], b=carriers.which),
        # past the carriers, one pass per OTHER faction -- the foreign walk
        (op("JSGte", a=carriers.which, b=carriers.how_many), A_FOREIGN)]
        # a carrier's pass stands nowhere until its carrier is proved this road's kind
        + ([] if region.row is None else [op("Null", dst=region.row)])
        + [
        # carriers hold rows moved to THIS thing's faction: an unowned thing has none
        (op("JNull", reg=payee.owner), NEXT_STORE)]
        + rehosted.emit_the_one_at(bc, fn, carriers.list, carriers.which, carrier,
                                   carriers.backing_at, carriers.backing_kind)
        + [(op("JNull", reg=carrier), NEXT_STORE),
           # ⛔ IS IT OUR KIND? every road pushes into one list, so ask before any field read
           op("GetGlobal", **{"dst": carriers.its_class,
                              "global": class_global(bc, gv(list(fn.regs)[0]))}),
           op("Call2", dst=carriers.really_one, fun=gv(function_named(bc, IS_REALLY).findex),
              arg0=carriers.its_class, arg1=carrier)]
        # NOT MY KIND still goes on: a SET reach's carrier is MEANT to be another kind
        + ([(op("JFalse", cond=carriers.really_one), A_SET_CARRIER)] if not host.on else
           _a_carrier_in_another_host(bc, fn, op, site, ids, walk, payee, host, carriers))
        + [
           # a carrier walks its own row on its own pass, so it is stepped over here
           op("Field", dst=carriers.id, obj=carrier, field=ids.thing_id_at),
           op("Field", dst=walk.thing_id, obj=0, field=ids.thing_id_at),
           (op("JEq", a=carriers.id, b=walk.thing_id), NEXT_STORE),
           # a carrier another faction owns is read as FOREIGN: only an owner word accepts it
           op("Call1", dst=carriers.owner,
              fun=gv(function_named(bc, payee.named).findex), arg0=carrier),
           (op("JNull", reg=carriers.owner), NEXT_STORE),
           op("Field", dst=carriers.owner_id, obj=carriers.owner, field=ids.owner_id_at),
           op("Field", dst=walk.owner_id, obj=payee.owner, field=ids.owner_id_at)]
        + foreignwalk.emit_theirs(bc, fn, op, site.word, "kind", carriers.owner_id,
                                  walk.owner_id, walk.whose_rule, carriers.owner,
                                  walk.from_foreign)
        # and where it stands, which is what a row it carries to a place is read against
        + carriers.region
        + [
           op("Field", dst=walk.store, obj=carrier, field=site.store_at),
           op("UnsafeCast", dst=walk.whose_store, src=carrier),
           (op("JAlways"), HAVE_STORE),
           # THE SET CARRIER, reached only when both kind checks say no; read at shared numbers
           A_SET_CARRIER + ":", op("Label")]
        + setreach.emit_a_carrier_of_another_kind(
            bc, fn, op, reader, site.word, carrier, payee.owner, walk.store, walk.whose_store,
            carrierplace.PLACED % site.word, NEXT_STORE,
            carrierplace.only_regional(bc, fn, region.row))
        + carrierplace.emit_placed(bc, fn, op, site.word, carrier, region.row, HAVE_STORE))


def _a_carrier_in_another_host(bc, fn, op, site, ids, walk, payee, host, carriers):
    """IS IT MY HOST'S KIND? another village carries faction rows; my own is stepped over."""
    carrier = carriers.one
    my_own_kind = "%s: a carrier of my own kind" % site.word
    no_host = "%s: I stand in no host" % site.word
    return ([
        (op("JTrue", cond=carriers.really_one), my_own_kind),
        op("GetGlobal", **{"dst": host.klass, "global": class_global(bc, host.kind)}),
        op("Call2", dst=carriers.really_one, fun=gv(function_named(bc, IS_REALLY).findex),
           arg0=host.klass, arg1=carrier),
        # and not my host's kind either: only the set path below can use it
        (op("JFalse", cond=carriers.really_one), A_SET_CARRIER),
        op("UnsafeCast", dst=host.a_host, src=carrier)]
        + host.reaching(host.mine)
        + [
        (op("JNull", reg=host.mine), no_host),
        op("Field", dst=host.my_id, obj=host.mine, field=host.id_at),
        op("Field", dst=host.their_id, obj=host.a_host, field=host.id_at),
        (op("JEq", a=host.my_id, b=host.their_id), NEXT_STORE),
        no_host + ":", op("Label"),
        # a host another faction owns is read as FOREIGN: only an owner word accepts its rows
        op("Call1", dst=host.owner,
           fun=gv(function_named(bc, host.named_owner).findex), arg0=host.a_host),
        (op("JNull", reg=host.owner), NEXT_STORE),
        op("Field", dst=carriers.owner_id, obj=host.owner, field=ids.owner_id_at),
        op("Field", dst=walk.owner_id, obj=payee.owner, field=ids.owner_id_at)]
        + foreignwalk.emit_theirs(bc, fn, op, site.word, "host", carriers.owner_id,
                                  walk.owner_id, walk.whose_rule, host.owner,
                                  walk.from_foreign) + [
        op("Int", dst=host.from_host, ptr=number(bc, 1)),
        op("Field", dst=walk.store, obj=host.a_host, field=host.store.store_at),
        op("UnsafeCast", dst=walk.whose_store, src=host.a_host),
        (op("JAlways"), carrierplace.PLACED % site.word),
        my_own_kind + ":", op("Label")])


def a_foreign_one(bc, fn, op, site, ids, walk, payee, carriers, factions, holders):
    """THE FOREIGN WALK: one pass per other faction, its rows MARKED foreign for the gate."""
    count = walk.count
    no_faction = "%s: that one is no faction" % site.word
    return ([
        A_FOREIGN + ":", op("Label"),
        op("Int", dst=factions.which, ptr=number(bc, holders)),
        op("Add", dst=factions.which, a=factions.which, b=carriers.how_many),
        op("Sub", dst=factions.which, a=count["store"], b=factions.which)]
        + foreignwalk.emit_the_faction_at(bc, fn, factions.list, factions.which, factions.one,
                                          NEXT_STORE)
        + [(op("JNull", reg=factions.one), NEXT_STORE)]
        # ⛔ A DEAD FACTION'S STORE IS NOT READ, here on the two-holder roads' foreign walk too
        + ofthekind.emit(bc, fn, op, factions.one, factions.live,
                         kind_named(bc, ownermatch.ASKED_AS), no_faction)
        + [op("Call1", dst=factions.is_dead, fun=gv(function_named(bc, IS_DEAD).findex),
              arg0=factions.live),
           (op("JTrue", cond=factions.is_dead), NEXT_STORE),
           no_faction + ":", op("Label")]
        + [
           # the owner's store was pass one, so it is stepped over (an unowned thing has none)
           (op("JNull", reg=payee.owner), EVERY_ONE_IS_FOREIGN),
           op("Field", dst=factions.owner_id, obj=factions.one, field=ids.owner_id_at),
           op("Field", dst=walk.owner_id, obj=payee.owner, field=ids.owner_id_at),
           (op("JEq", a=factions.owner_id, b=walk.owner_id), NEXT_STORE),
           EVERY_ONE_IS_FOREIGN + ":", op("Label"),
           op("Int", dst=walk.from_foreign, ptr=number(bc, 1)),
           op("Mov", dst=walk.whose_rule, src=factions.one)]
        + sayonce.emit(bc, fn, FOREIGN_RAN % site.word, even_when_quiet=True)
        + [
           op("Field", dst=walk.store, obj=factions.one, field=payee.store.store_at),
           op("UnsafeCast", dst=walk.whose_store, src=factions.one),
           HAVE_STORE + ":", op("Label")])


def on_to_the_next(bc, op, walk, carriers, factions, holders, two_holders):
    """One more pass while stores are left, counted on the road's own count."""
    count = walk.count
    if not two_holders:
        # A ONE-HOLDER ROAD COUNTS ITS OWN PASS PLUS ONE PER FACTION
        return [op("Incr", dst=count["store"]),
                op("Int", dst=count["wanted"], ptr=number(bc, 1)),
                op("Add", dst=count["wanted"], a=count["wanted"], b=factions.how_many_all),
                (op("JSLt", a=count["store"], b=count["wanted"]), STORE)]
    return [op("Incr", dst=count["store"]),
            # ⛔ THE ROAD'S OWN COUNT HERE TOO, or the last faction's store is never read
            op("Int", dst=count["wanted"], ptr=number(bc, holders)),
            op("Add", dst=count["wanted"], a=count["wanted"], b=carriers.how_many),
            op("Add", dst=count["wanted"], a=count["wanted"], b=factions.how_many),
            (op("JSLt", a=count["store"], b=count["wanted"]), STORE)]
