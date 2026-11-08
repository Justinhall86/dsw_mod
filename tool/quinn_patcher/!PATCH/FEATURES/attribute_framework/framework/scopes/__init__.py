"""One file per scope: who a use is about. Nothing lists these -- the parser reads the folder."""
# the editor text around a scope's noun, and around `Faction`'s named target, with no owner word
OWNER_UNSAID = "Each of your {nouns}"
AS_UNSAID = "As {name}"
SUBJECT_UNSAID = "you"
# who finishes a trigger: the receiver's own faction -- yours, a faction's own, a thing's owner
ACTOR_OWN, ACTOR_FACTION, ACTOR_THING, ACTOR_HOLDER = "you", "it", "its owner", "my faction"
# PER ROOT SCOPE, the hops from a faction to the list of its things, each a field or a getter
OWNED_ON = {"Unit": ("units",), "Structure": ("structures",), "Zone": ("zones",),
            "Building": ("structures", "buildings"),
            "Agt": ("ent.Faction.get_spyManager", "agents")}
# what a root scope's count hands the words on its right, so a narrowing of its things narrows it
OFFERED = {"Unit": "a unit count", "Structure": "a structure count", "Agt": "an agent count",
           "Building": "a building count", "Zone": "a region count"}
# the catalogue family of each root scope's count
KINS = {"Unit": "Unit", "Structure": "Structure", "Agt": "Agent", "Zone": "Region",
        "Building": "Building"}
# counted per holder: the way to each one's list, the holder, a member's kind, what it must deny
COUNTED_PER = {"Building": (OWNED_ON["Building"], "ent.Structure", None,
                            "ent.BaseBuilding.get_inConstruction")}
# what every `Per` word's spelling starts with, the scope's own spelling after it
PER = "Per"


def scope_file(spelling):
    """One scope's own file, by its spelling."""
    import importlib
    return importlib.import_module("%s.%s" % (__name__, spelling.lower()))


def _wordings(noun, named):
    """The editor text of a count of `noun`, with a target column when the scope takes one."""
    each = "for each %s{more} {subject} own{s}"
    mine = "for each %s{more} my faction owns"
    if not named:
        return {"PHRASE": each % noun, "HOLDER": mine % noun}
    return {"PHRASE": each % "[::target::]", "BARE": each % noun,
            "HOLDER": mine % "[::target::]", "HOLDER_BARE": mine % noun, "TURNED_AFTER": PER,
            "TURNED_PHRASE": (each + " that is not a [::target::]") % noun,
            "TURNED_HOLDER": (mine + " that is not a [::target::]") % noun}


def _asked(scope, root, per):
    """What each member a `Per` word counts must answer: its root's, its scope's, its holder's."""
    from framework.trailing import SAYS_NO
    asks = getattr(scope, "ASKS", None)
    return tuple(filter(None, [getattr(root, "ONLY", None)])) + (
        ((asks, getattr(scope, "ASKS_OF", None)),) if asks else ()) + (
        ((per[3], SAYS_NO),) if per and per[3] else ())


def counting(word):
    """Everything a `Per<Scope>` word's file declares, read off the scope it names."""
    from framework.trailing import NO_FAMILY_TRAILER, NO_NAME_TO_WRITE, VAL_IS_ITS_AMOUNT
    from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
    scope = scope_file(word[len(PER):])
    root = scope_file(getattr(scope, "NARROWS", None) or scope.WORD)
    named = scope.TARGET != "never"
    per = COUNTED_PER.get(root.WORD)
    only = _asked(scope, root, per)
    out = dict(_wordings(getattr(scope, "BARE", None) or scope.PHRASE, named),
               KIN=KINS[root.WORD], TARGET=scope.TARGET, NEEDS="an amount",
               ASKED_OF="ent.Faction", COUNTS=per[0] if per else OWNED_ON[root.WORD],
               OWNERS_PICK=True, OWNER_STEM=PER, VAL_NONE=VAL_IS_ITS_AMOUNT)
    if per:
        out.update(EACH=per[1], MEMBER=per[2])
    if only:
        out["ONLY"] = only
    if not named:
        out.update(NAMED_NONE=NO_NAME_TO_WRITE, NOT_NONE=NAMES_NOTHING_TO_LEAVE_OUT)
    if root.WORD in OFFERED:
        out.update(OFFERS=(OFFERED[root.WORD],), MARKED_AS=root.WORD)
    else:
        out.update(OFFERS=(), OFFERS_NONE=NO_FAMILY_TRAILER)
    return out
