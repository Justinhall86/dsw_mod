"""`OnDeath` -- fires when a thing is killed; `OnTDeath` only when the killer is the one named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnDeath"
# its family on the catalogue
KIN = 'Combat'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} get{s} killed{where} by [::target::]"
BARE = "when {actor} get{s} killed{where}"
HOLDER = "when {who} {am} killed{where} by [::target::]"
HOLDER_BARE = "when {who} {am} killed{where}"
# on a region's scope the one killed is not the region: (that scope, who acts, where, the holder's)
IN_A_PLACE = ("Zone", "something", " in it", " in me")
# the thing holding the rule is the one killed: on any scope but `Faction` it is "it"
HOLDER_ACTS = True
# and on `Faction`, what is killed is the faction's, its own or a faction its owner word picks
ACTOR_AS_FACTION = ("one of yours", "one of its own")
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTDeath2`: `Not` after this text fires on every killer but the one named
TURNED_AFTER = "On"
# one word, one branch: `OnTDeath` runs `OnDeath`'s, which reads the mark off the piece
MARK_READ_IN_ITS_BRANCH = True
TURNED_PHRASE = "when {actor} get{s} killed{where} by anything but [::target::]"
TURNED_HOLDER = "when {who} {am} killed{where} by anything but [::target::]"
# the cdb sheet a target column names; a parent unit names its children too, as a scope's does
SHEET = "unit"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 13
# WHERE IT IS RAISED FROM: the same kill as `OnKill`'s, seen from the one killed
SITE = "ent.Entity.onKill"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the killer"
# THE TWO THINGS THE GAME HANDS, in its order: a word naming its `SIDE` asks that one instead
SIDES = ("the killer", "the one killed")
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the killer", "Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
