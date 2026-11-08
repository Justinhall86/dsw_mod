"""`ForMe` -- a trailing word: the faction holding the rule receives the effect; never a trait."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "ForMe"
# its family on the catalogue
KIN = 'Grammar'
# per effect verb: its four forms in a rider's place (as `VERBS` orders them), then the holder's
SAYS = {
    "pays": (("gain {x}", "gives you {x}", "gives you {x}", "gives you {x}"), "the giver"),
    "loses": (("lose {x}", "takes {x} from you", "takes {x} from you", "takes {x} from you"),
              "the giver"),
    "spawns": (("spawn {x}", "spawns {x} for you", "spawns {x} for you", "spawns {x} for you"),
               "for the giver"),
    "starts": (("start {x}", "starts {x} for you", "starts {x} for you", "starts {x} for you"),
               "for the giver"),
    "completes": (("complete {x}", "completes {x} for you", "completes {x} for you",
                   "completes {x} for you"), "for the giver"),
    "fails": (("fail {x}", "fails {x} for you", "fails {x} for you", "fails {x} for you"),
              "for the giver"),
    "raises": (("raise {x}", "shows you {x}", "shows you {x}", "shows you {x}"), "to the giver"),
}
# a rider names no target column: it says who sees the effect, never what the effect is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# the receiver, in `framework/effecttable.py`'s `STAMPS`: `me` is the faction HOLDING the rule
STAMP = "me"
# its choice in the builder's rider menu
LABEL = "me"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
