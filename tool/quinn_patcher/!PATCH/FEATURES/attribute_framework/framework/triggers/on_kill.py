"""`OnKill` -- fires when a thing kills a unit; `OnTKill` only when it kills the unit named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnKill"
# its family on the catalogue
KIN = 'Combat'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} kill{s} [::target::]{where}"
BARE = "when {actor} kill{s} a unit{where}"
HOLDER = "when {who} kill{whos} [::target::]{where}"
HOLDER_BARE = "when {who} kill{whos} a unit{where}"
# on a region's scope the killer is not the region: (that scope, who acts, where, the holder's)
IN_A_PLACE = ("Zone", "something", " in it", " in me")
# the thing holding the rule is the killer: on any scope but `Faction` it is "it"
HOLDER_ACTS = True
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTKill2`: `Not` after this text fires on every unit killed but the one named
TURNED_AFTER = "On"
# one word, one branch: `OnTKill` runs `OnKill`'s, which reads the mark off the piece
MARK_READ_IN_ITS_BRANCH = True
TURNED_PHRASE = "when {actor} kill{s} a unit other than [::target::]{where}"
TURNED_HOLDER = "when {who} kill{whos} a unit other than [::target::]{where}"
# the cdb sheet a target column names; a parent unit names its children too, as a scope's does
SHEET = "unit"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 12
# WHERE IT IS RAISED FROM: the game's own kill, handed the killer then the one killed
SITE = "ent.Entity.onKill"
# the class the one killed must be for this word; a structure or a building is `OnWreck`'s
VICTIM_IS = ("ent.Unit",)
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the one killed"
# THE TWO THINGS THE GAME HANDS, in its order: a word naming its `SIDE` asks that one instead
SIDES = ("the killer", "the one killed")
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "it", "Unit"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
