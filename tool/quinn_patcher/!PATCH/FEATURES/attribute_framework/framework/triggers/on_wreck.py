"""`OnWreck` -- a thing destroys a structure or building; `OnTWreck` on the one named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnWreck"
# its family on the catalogue
KIN = 'Combat'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} destroy{s} [::target::]"
BARE = "when {actor} destroy{s} a structure or building"
HOLDER = "when I destroy [::target::]"
HOLDER_BARE = "when I destroy a structure or building"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTWreck2`: `Not` after this text fires on everything destroyed but the one named
TURNED_AFTER = "On"
# one word, one branch: `OnTWreck` runs `OnWreck`'s, which reads the mark off the piece
MARK_READ_IN_ITS_BRANCH = True
TURNED_PHRASE = "when {actor} destroy{s} anything but [::target::]"
TURNED_HOLDER = "when I destroy anything but [::target::]"
# the cdb sheet a target column names: a building's id; a structure's id matches the same way
SHEET = "building"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 14
# WHERE IT IS RAISED FROM: the same kill as `OnKill`'s, when the one destroyed is no unit
SITE = "ent.Entity.onKill"
# the classes the one destroyed may be; a building is asked through the structure it stands in
VICTIM_IS = ("ent.Structure", "ent.BaseBuilding")
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the thing destroyed"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# ⛔ A BUILDING'S OWN `_owner` IS EMPTY: its village answers whose it is
FIRED_IN_BUILDING_HELD_BY = "ent.BaseBuilding.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "it", "Structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
