"""`Region` -- an exact synonym of `Zone`, riding the zone's own road."""
from framework.trailing import NO_NAME_TO_WRITE, OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
from framework.turned import PLACE_HAS_NO_TARGET
WORD = "Region"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "region"
# same as the scope it narrows: a region is never named in a target column
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it
NOT_NONE = PLACE_HAS_NO_TARGET
# whose road this rides. That scope owns the site, the rules and who gets paid
NARROWS = "Zone"
# and it narrows NOTHING, said out loud: a region IS the thing that road has in hand
SAME_AS = "Zone"
# which scope this is, as a number of ours. Never where the word sits in a list
NUMBER = 13
# the hops from a thing to its region (cell, then zone), read only for the re-host
STANDS_IN = ("cell", "parent")
# who holds a region: the zone word's own getter
HELD_BY = "ent.Zone.get_factionOwner"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NO_NAME_TO_WRITE
VAL_NONE = VAL_NOT_ITS
