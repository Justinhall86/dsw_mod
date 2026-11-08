"""`For<Owner>` -- a trailing word: each faction the owner word after it picks receives it."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "For"
# its family on the catalogue
KIN = 'Grammar'
# who receives, in a rider's place, then in the holder's line
WHO, HOLDER = "each faction the owner word picks", "each faction the owner word picks"
# per effect verb: its four forms in a rider's place (as `VERBS` orders them), then the holder's
SAYS = {verb: ((one % WHO,) + (three % WHO,) * 3, last % HOLDER) for verb, one, three, last in (
    ("pays", "give %s {x}", "gives %s {x}", "%s"),
    ("loses", "take {x} from %s", "takes {x} from %s", "%s"),
    ("spawns", "spawn {x} for %s", "spawns {x} for %s", "for %s"),
    ("starts", "start {x} for %s", "starts {x} for %s", "for %s"),
    ("completes", "complete {x} for %s", "completes {x} for %s", "for %s"),
    ("fails", "fail {x} for %s", "fails {x} for %s", "for %s"),
    ("raises", "show {x} to %s", "shows {x} to %s", "to %s"))}
# a rider names no target column: it says who sees the effect, never what the effect is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# run once per faction the glued owner word picks against the rule's holder, each the receiver
STAMP = "all"
# the owner word is glued after it (`ForEnemy`); `ForAll` is a word of its own, `Own` is `ForMe`
OWNERS_PICK, OWNER_AFTER, NOT_OWNERS = True, True, ("All", "Own")
# its choice in the builder's rider menu
LABEL = "factions an owner word picks"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
