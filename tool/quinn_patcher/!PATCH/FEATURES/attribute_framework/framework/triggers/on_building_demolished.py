"""`OnBuildingDemolished` -- a building is torn down; `OnTBuildingDemolished` on the one named."""
from framework.trailing import OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnBuildingDemolished"
# its family on the catalogue
KIN = 'Building'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} tear{s} down [::target::]"
BARE = "when {actor} tear{s} down a building"
HOLDER = "when [::target::] is torn down"
HOLDER_BARE = "when a building is torn down"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTBuildingDemolished2`: `Not` after this text fires on every building but the one named
TURNED_AFTER = "On"
# one word, one branch: `OnTBuildingDemolished` runs the bare word's, which reads the mark
MARK_READ_IN_ITS_BRANCH = True
TURNED_PHRASE = "when {actor} tear{s} down a building other than [::target::]"
TURNED_HOLDER = "when a building other than [::target::] is torn down"
# the cdb sheet a target column names
SHEET = "building"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 17
# what a trailing word on its right may attach to: `OfTDomain`, naming the building's domain
OFFERS = ("a domain",)
# WHERE IT IS RAISED FROM: the game's own demolish order, the player's and an effect's alike
SITE = "logic.Upgrades.demolishUpgrade"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the building's village"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "its village", "Structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
