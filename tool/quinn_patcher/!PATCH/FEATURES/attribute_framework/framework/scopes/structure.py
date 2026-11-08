"""`Structure` -- one structure (village, sietch, main base): the game has no class under it."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Structure"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "structure"
# a structure use can name a structure in a target column, or mean whichever one is in hand
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any structure but [::target::]"
# the game's own per-structure update, and what it is about -- both by name, both checked
SITE = "ent.Structure.updateAttributes"
ENTITY = "ent.Structure"
# where this scope's RULES run: the structure's own tick, reached by dispatch through a slot
ROAD = "ent.Structure.regularUpdate"
# WHO GETS PAID: a structure has no getter of its own and answers the one every entity shares
OWNER = "ent.Entity.get_owner"
# A STRUCTURE IS ITS OWN PLACE ON THE MAP, so its payments float over it
SHOWN_AT = "itself"
# our unique scope number, never a list place
NUMBER = 9
# THE REGION IT STANDS IN IS A SOURCE OF RULES: one more pass, hopped by `scopes/region.py`
READS_ITS_REGION = True

# the field a marked spelling matches (its cdb id); without it the UNIT matcher refuses the row
MARKED_ID = "kind"

# AND A STRUCTURE IS ONE, so its holder needs no hop
IN_VILLAGE = ("itself",)
# the cdb sheet a target column names
SHEET = "structure"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
