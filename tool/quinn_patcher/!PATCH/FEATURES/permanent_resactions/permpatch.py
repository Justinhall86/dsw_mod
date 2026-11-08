#!/usr/bin/env python3
"""Where permanent res actions enter the game: a council, the offer, a confirm, a loss, the UI."""
from tools.project import gv, guard
from tools.hlcode import call_sites, field_by_name, function_named, kind_named, template, written
from tools.splice import insert
from framework import traps
from framework.parsed import a_new_place

import looks
import mark
import park
import perm
import tiers
from trades import kinds

NAME = "permanent"
ANNOUNCE = "logic.state.LandsraadManager.initResolutionAnnounce"
RESIZE, INFO = "hl.types.ArrayObj.resize", "logic.state.CouncilResolution.get_inf"
PLACEABLE = "logic.state.CouncilResolution.getPlaceableActions"
PLACE = "logic.state.LandsraadManager.implInlineSetAction"
CONFIRM = "logic.state.LandsraadManager.implInlineCommitAction"
REVOKE = "logic.state.ResolutionManager.removeActiveCharters"
CARD, CHARTER = "ui.win.ResolutionCard.init", "ui.win.CharterCard.init"
DETAILS = "ui.win.ResolutionDetails.init"
# the charter's tooltip writes its effects once, into a text kept nowhere; the charter's row is r1
TIP_MADE, EFFECTS, ROW = "ui.comp.$TipCharter.__constructor__", "$HText.resolution", 1
QUEUED = "domkit.Properties.initStyle"
# the council card's own art, and how it is given its picture
ART, ART_SET = 10, "shiro.ui.DynamicBackground.set_imageTile"
# the charter card's banner ends 49 down (1 margin, 48 tall); where the details make their banner
BANNER_FOOT, BANNER = 49, 59
# on the outer council card: the details' name band ends 291 down, 268 above the card's foot
DETAILS_TOP, ROOM = 291, 268
# where the vote action makes its Votes header; the field holding its resolution, read at op71
VOTES, VOTES_HEADER = "ui.win.VoteResolutionAction.init", 40
VOTES_RES = (166, 23)
# the offer's own refusal: false into its answer, then returned
REFUSED = 6
# placing: true when it is done for real, not only checked; the placed action; where both meet
REAL, PLACED, PLACING_ENDS = 6, 43, 243


def op(bc, what, **operands):
    return written(template(bc, what), **operands)


def the_offer(bc):
    """The test each res action passes to be offered on a resolution, made inside the listing."""
    fn = function_named(bc, PLACEABLE)
    made = [o for o in fn.ops if o.op == "InstanceClosure"]
    guard(len(made) == 1, "%s makes %d tests, expected one" % (PLACEABLE, len(made)))
    at = gv(made[0].df["fun"])
    return next(f for f in bc.functions if gv(f.findex) == at)


def kept(bc, have):
    """A council's end empties each resolution's placed actions through ours, which keeps some."""
    fn = function_named(bc, ANNOUNCE)
    sites = call_sites(fn, function_named(bc, RESIZE))
    guard(len(sites) == 1, "%s empties %d lists, expected one" % (ANNOUNCE, len(sites)))
    at = sites[0]
    actions = field_by_name(bc, kind_named(bc, perm.RES), "actions", "a council resolution")[0]
    guard(any(fn.ops[i].op == "Field" and gv(fn.ops[i].df["field"]) == actions
              for i in range(at - 10, at)), "the emptied list is not a resolution's actions")
    fn.ops[at].df["fun"].value = have["keep"]
    bake = [i for i, o in enumerate(fn.ops[:at]) if o.op == "Call4" and gv(o.df["arg0"]) == 6]
    guard(bake and gv(fn.regs[6]) == kind_named(bc, perm.RES),
          "%s does not ready each resolution in its sixth place" % ANNOUNCE)
    void = a_new_place(bc, fn, kinds(bc).void)
    return insert(bc, fn, bake[-1] + 1, [op(bc, "Call1", dst=void, fun=have["unpark"], arg0=6)],
                  "permanent: proposed again", traps.IN_PLAY)


def offered(bc, have, fn):
    """A res action refused by `placeOn`, or permanent and held, goes before anything else."""
    info = function_named(bc, INFO)
    reads = [i for i, o in enumerate(fn.ops[:-2]) if o.op == "EnumField"
             and gv(o.df["field"]) == 1 and fn.ops[i + 2].op == "Call1"
             and gv(fn.ops[i + 2].df["fun"]) == gv(info.findex)]
    guard(reads and fn.ops[REFUSED].op == "Bool" and fn.ops[REFUSED + 1].op == "Ret",
          "the offer does not hold its resolution second, or refuse at op%d" % REFUSED)
    res, ok = a_new_place(bc, fn, kind_named(bc, perm.RES)), a_new_place(bc, fn, kinds(bc).bool)
    who = a_new_place(bc, fn, tiers.tkinds(bc).faction)
    block = [op(bc, "EnumField", dst=res, value=0, construct=0, field=1),
             op(bc, "EnumField", dst=who, value=0, construct=0, field=0),
             op(bc, "Call3", dst=ok, fun=have["allowed"], arg0=res, arg1=1, arg2=who),
             op(bc, "JFalse", cond=ok, offset=REFUSED)]
    return insert(bc, fn, 0, block, "permanent: offer", traps.IN_PLAY)


def pended(bc, have):
    """A res action placed for real, not only checked, waits for its placer's confirm."""
    fn = function_named(bc, PLACE)
    real = fn.ops[152]
    guard(real.op == "JFalse" and gv(real.df["cond"]) == REAL
          and 153 + gv(real.df["offset"]) == PLACING_ENDS
          and fn.ops[PLACING_ENDS].op == "GetGlobal" and gv(fn.regs[REAL]) == kinds(bc).bool,
          "%s does not end its real placing at op%d" % (PLACE, PLACING_ENDS))
    void = a_new_place(bc, fn, kinds(bc).void)
    block = [op(bc, "JFalse", cond=REAL, offset=1),
             op(bc, "Call1", dst=void, fun=have["pend"], arg0=PLACED)]
    return insert(bc, fn, PLACING_ENDS, block, "permanent: placing", traps.IN_PLAY)


def confirmed(bc, have):
    """A faction's confirm, done for real, raises the `placeAlert` of what it placed."""
    fn = function_named(bc, CONFIRM)
    at = [i for i, o in enumerate(fn.ops) if o.op == "Call2" and gv(o.df["arg1"]) == 1]
    guard(at and fn.ops[at[-1] - 8].op == "JFalse", "%s never records its confirm" % CONFIRM)
    void = a_new_place(bc, fn, kinds(bc).void)
    return insert(bc, fn, at[-1] + 1, [op(bc, "Call1", dst=void, fun=have["commit"], arg0=1)],
                  "permanent: confirm", traps.IN_PLAY)


def revoked(bc, have):
    """A revoked charter's resolution is parked by us before the game lets it go."""
    fn = function_named(bc, REVOKE)
    rk, drop = kind_named(bc, perm.RES), gv(function_named(bc, perm.REMOVE).findex)
    drops = [i for i, o in enumerate(fn.ops) if o.op == "Call2" and gv(o.df["fun"]) == drop
             and gv(fn.regs[gv(o.df["arg1"])]) == rk]
    guard(len(drops) == 1, "%s drops %d resolutions, expected one" % (REVOKE, len(drops)))
    void, gone = a_new_place(bc, fn, kinds(bc).void), gv(fn.ops[drops[0]].df["arg1"])
    return insert(bc, fn, drops[0], [op(bc, "Call1", dst=void, fun=have["park"], arg0=gone)],
                  "permanent: revoked", traps.IN_PLAY)


def ended(bc, have):
    """A faction's loss ends its taints that end with it."""
    fn = function_named(bc, perm.LOSE)
    void = a_new_place(bc, fn, kinds(bc).void)
    return insert(bc, fn, 0, [op(bc, "Call1", dst=void, fun=have["end"], arg0=1)],
                  "permanent: loss", traps.IN_PLAY)


def _is(bc, kind, name):
    """Whether `kind` is, or descends from, the class called `name`."""
    want, at = kind_named(bc, name), kind
    while at is not None and at >= 0 and at != want:
        sup = getattr(bc.types[at].definition, "super", None)
        at = gv(sup) if sup is not None else None
    return at == want


def marked(bc):
    """Each look of `mark` joins the window the game draws it in, and its tint that window's own."""
    keep = looks.make_keep(bc, looks.make_hold(bc))
    fx = looks.make_fx(bc, looks.make_again(bc), looks.make_length(bc))
    draw = mark.make_draw(bc, True)
    return (_card(bc, mark.make_tint(bc), fx) + _charter(bc, keep, fx)
            + _details(bc, draw, keep, looks.make_body(bc), fx) + _votes(bc, keep)
            + _tip(bc))


def _card(bc, tint, fx):
    """The council card: the image over its art, under its text; the tint on the art itself."""
    fn = function_named(bc, CARD)
    art = [i for i, o in enumerate(fn.ops) if o.op == "Call2" and gv(o.df["arg0"]) == ART
           and gv(o.df["fun"]) == gv(function_named(bc, ART_SET).findex)]
    bg, card = gv(fn.regs[ART]), gv(fn.regs[0])
    guard(len(art) == 1 and _is(bc, bg, mark.DRAWABLE) and _is(bc, card, looks.ELEMENT)
          and gv(fn.regs[8]) == kind_named(bc, perm.RES),
          "%s does not set its own art once, from its resolution" % CARD)
    flat = mark.make_draw(bc, _is(bc, bg, mark.FLOW))
    on = mark.make_on(bc, "card", (("bg", bg), ("card", card)), (
        (flat, ("bg", "look", "act")), (tint, ("bg", "look")), (fx, ("card", "look", "act"))))
    void = a_new_place(bc, fn, kinds(bc).void)
    return insert(bc, fn, art[0] + 1, [op(bc, "Call3", dst=void, fun=on, arg0=ART, arg1=0,
                                          arg2=8)], "permanent: card", traps.IN_PLAY)


def _last_ret(fn, name):
    rets = [i for i, o in enumerate(fn.ops) if o.op == "Ret"]
    guard(len(rets) == 1, "%s returns from %d places, expected one" % (name, len(rets)))
    return rets[0]


def _part(bc, fn, at, made, what):
    """The object `made`'s style at `at` names, held in a flow place of its own just after."""
    guard(fn.ops[at].op == "Call4" and gv(fn.ops[at].df["dst"]) == made,
          "no %s is made at op%d" % (what, at))
    obj = gv(field_by_name(bc, gv(fn.regs[made]), "obj", "a style")[0])
    held = a_new_place(bc, fn, kind_named(bc, mark.OBJECT))
    flow = a_new_place(bc, fn, kind_named(bc, mark.FLOW))
    insert(bc, fn, at + 1, [op(bc, "Field", dst=held, obj=made, field=obj),
                            op(bc, "UnsafeCast", dst=flow, src=held)],
           "permanent: " + what, traps.IN_PLAY)
    return flow


def _charter(bc, keep, fx):
    """The charter card: the image from its banner's foot, the tint on the card's background."""
    fn = function_named(bc, CHARTER)
    card, row = gv(fn.regs[0]), fn.ops[137]
    guard(row.op == "GetThis" and gv(row.df["dst"]) == 32 and _is(bc, card, mark.FLOW)
          and _is(bc, card, looks.ELEMENT), "%s reads no row at op137" % CHARTER)
    on = mark.make_on(bc, "charter", (("card", card),), (
        (mark.make_draw(bc, True, BANNER_FOOT), ("card", "look", "act")),
        (keep, ("card", "card", "look")), (fx, ("card", "look", "act"))))
    shown = mark.make_lookup(bc, on, (("card", card),), gv(fn.regs[32]))
    held, void = a_new_place(bc, fn, gv(fn.regs[32])), a_new_place(bc, fn, kinds(bc).void)
    block = [op(bc, "GetThis", dst=held, field=gv(row.df["field"])),
             op(bc, "Call2", dst=void, fun=shown, arg0=0, arg1=held)]
    return insert(bc, fn, _last_ret(fn, CHARTER), block, "permanent: charter", traps.IN_PLAY)


def _details(bc, draw, keep, body, fx):
    """The details window: the image under its text, the tint on its banner and what is behind."""
    fn = function_named(bc, DETAILS)
    details = gv(fn.regs[0])
    guard(gv(fn.regs[8]) == kind_named(bc, perm.RES) and _is(bc, details, mark.FLOW)
          and _is(bc, details, looks.ELEMENT), "%s holds no resolution eighth" % DETAILS)
    banner = _part(bc, fn, BANNER, 15, "banner")
    out = mark.make_draw(bc, True, DETAILS_TOP, True, ROOM)
    on = mark.make_on(bc, "details", (("details", details), ("banner", kind_named(bc, mark.FLOW))),
                      ((mark.make_out(bc, draw, out), ("details", "look", "act")),
                       (keep, ("details", "banner", "look")),
                       (body, ("details", "look")), (fx, ("details", "look", "act"))))
    void = a_new_place(bc, fn, kinds(bc).void)
    return 2 + insert(bc, fn, _last_ret(fn, DETAILS),
                      [op(bc, "Call1", dst=void, fun=mark.make_clear(bc), arg0=0),
                       op(bc, "Call3", dst=void, fun=on, arg0=0, arg1=banner, arg2=8)],
                      "permanent: details", traps.IN_PLAY)


def _votes(bc, keep):
    """The council card's Votes header wears the `details` tint, as the background behind it."""
    fn = function_named(bc, VOTES)
    action = gv(fn.regs[0])
    guard(_is(bc, action, looks.LATER) and gv(fn.regs[VOTES_RES[1]]) == kind_named(bc, perm.RES),
          "%s holds no element and resolution" % VOTES)
    header = _part(bc, fn, VOTES_HEADER, 4, "votes header")
    fk = kind_named(bc, mark.FLOW)
    on = mark.make_on(bc, "details", (("action", action), ("header", fk)),
                      ((keep, ("action", "header", "look")),))
    res, void = a_new_place(bc, fn, kind_named(bc, perm.RES)), a_new_place(bc, fn, kinds(bc).void)
    block = [op(bc, "GetThis", dst=res, field=VOTES_RES[0]),
             op(bc, "Call3", dst=void, fun=on, arg0=0, arg1=header, arg2=res)]
    return 2 + insert(bc, fn, _last_ret(fn, VOTES), block, "permanent: votes", traps.IN_PLAY)


def _tip(bc):
    """The charter's tooltip: each permanent action's `tip` on its own line under the effects."""
    fn = function_named(bc, TIP_MADE)
    said = call_sites(fn, function_named(bc, EFFECTS))
    guard(len(said) == 1, "%s writes its effects %d times, expected once" % (TIP_MADE, len(said)))
    text = gv(fn.ops[said[0]].df["dst"])
    shown = [i for i in range(said[0], len(fn.ops)) if fn.ops[i].op == "CallMethod"
             and gv(fn.ops[i].df["args"].value[1]) == text]
    guard(shown, "%s never shows its effects text" % TIP_MADE)
    box = gv(fn.ops[shown[0]].df["args"].value[0])
    # the same text queued for its style again, which would put back the text without the tip
    queued = [i for i in call_sites(fn, function_named(bc, QUEUED))
              if i > shown[0] and gv(fn.ops[i].df["arg2"]) == text]
    guard(queued, "%s never queues its effects text" % TIP_MADE)
    at = queued[0]
    style, name = gv(fn.ops[at].df["arg0"]), gv(fn.ops[at].df["arg1"])
    named = [o for o in fn.ops[:at] if o.op == "GetGlobal" and gv(o.df["dst"]) == name]
    guard(named, "%s queues a name it never reads" % TIP_MADE)
    pk = gv(fn.regs[style])
    line = looks.make_line(bc, pk, gv(fn.regs[box]), gv(fn.ops[shown[0]].df["field"]),
                           (gv(fn.regs[name]), gv(named[-1].df["global"])))
    on = mark.make_on(bc, "charter", (("tip", pk),), ((line, ("tip", "look")),))
    told = mark.make_lookup(bc, on, (("tip", pk),), gv(fn.regs[ROW]))
    void = a_new_place(bc, fn, kinds(bc).void)
    return insert(bc, fn, at + 1, [op(bc, "Call2", dst=void, fun=told, arg0=style, arg1=ROW)],
                  "permanent: tip", traps.IN_PLAY)


def install(bc):
    from standalone import onoff
    if not onoff.on(NAME):
        return "permanent: OFF"
    offer = the_offer(bc)
    have = perm.install(bc, gv(offer.regs[1]))
    have.update(park.install(bc, gv(function_named(bc, PLACE).regs[PLACED]), have["alert"]))
    went = (kept(bc, have) + offered(bc, have, offer) + pended(bc, have) + confirmed(bc, have)
            + revoked(bc, have) + ended(bc, have) + marked(bc))
    return "permanent: %d function(s) of ours, %d instruction(s) in the game's" % (len(have), went)
