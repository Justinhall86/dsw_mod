"""`ForAll` -- a trailing word: every faction receives the effect; never a trait."""
from framework.trailing import (NOTHING_TRAILS_IT, RIDER_FOLLOWS_THE_EFFECT, RIDER_SAYS_WHO,
                               VAL_NOT_ITS)
from framework.turned import RIDER_HAS_NO_OTHER_SIDE
WORD = "ForAll"
# its family on the catalogue
KIN = 'Grammar'
# per effect verb: its four forms in a rider's place (as `VERBS` orders them), then the holder's
SAYS = {
    "pays": (("give every faction {x}",) + ("gives every faction {x}",) * 3, "every faction"),
    "loses": (("take {x} from every faction",) + ("takes {x} from every faction",) * 3,
              "every faction"),
    "spawns": (("spawn {x} for every faction",) + ("spawns {x} for every faction",) * 3,
               "for every faction"),
    "starts": (("start {x} for every faction",) + ("starts {x} for every faction",) * 3,
               "for every faction"),
    "completes": (("complete {x} for every faction",) + ("completes {x} for every faction",) * 3,
                  "for every faction"),
    "fails": (("fail {x} for every faction",) + ("fails {x} for every faction",) * 3,
              "for every faction"),
    "raises": (("show {x} to every faction",) + ("shows {x} to every faction",) * 3,
               "to every faction"),
}
# a rider names no target column: it says who sees the effect, never what the effect is about
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), RIDER_FOLLOWS_THE_EFFECT
# why `Not` never turns it
NOT_NONE = RIDER_HAS_NO_OTHER_SIDE
# run once per faction, each one the receiver
STAMP = "all"
# its choice in the builder's rider menu
LABEL = "everyone"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = RIDER_SAYS_WHO
VAL_NONE = VAL_NOT_ITS
