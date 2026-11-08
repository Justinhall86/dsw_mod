"""`MainBase` -- `Structure` narrowed to a main-base KIND (active or not, e.g. under siege)."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "MainBase"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "[$my(MainBase)]"
# the builder's plain noun, where the game's own name markup would read "[$my(MainBase)]s"
NOUN = "main base"
# same as the scope it narrows: a structure may be named in a target column
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any main base but [::target::]"
# whose road this rides. That scope owns the site, the rules and who gets paid
NARROWS = "Structure"
# the game's own question, asked of the structure in hand. A no turns the row away
ASKS = "ent.Structure.get_isMainBase"
# which scope this is, as a number of ours. Never where the word sits in a list
NUMBER = 11

# the field a marked spelling matches (its cdb id); without it the UNIT matcher refuses the row
MARKED_ID = "kind"
# and the kind to read it off, because this word narrows rather than naming one
MARKED_ON = "ent.Structure"
# the cdb sheet a target column names
SHEET = "structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
