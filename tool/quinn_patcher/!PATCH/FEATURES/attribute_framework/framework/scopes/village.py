"""`Village` -- `Structure` narrowed (the game has no village class); fortified ones count too."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Village"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "village"
# same as the scope it narrows: a structure may be named in a target column
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any village but [::target::]"
# whose road this rides. That scope owns the site, the rules and who gets paid
NARROWS = "Structure"
# the game's own question, asked of the structure in hand. A no turns the row away
ASKS = "ent.Structure.isVillage"
# which scope this is, as a number of ours. Never where the word sits in a list
NUMBER = 10
# the cdb sheet a target column names
SHEET = "structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
