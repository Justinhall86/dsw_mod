"""`Unit` -- a use about one unit you select and move (armies and harvesters included)."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Unit"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "unit"
# a unit use can name a unit in a target column, or mean whichever unit is in hand
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any unit but [::target::]"
# the game's own per-unit update, and what it is about -- both by name, both checked
SITE = "ent.Unit.updateAttributes"
ENTITY = "ent.Unit"
# where this scope's RULES run: the unit's own regular tick, after its inherited work
ROAD = "ent.Unit.regularUpdate"
# A UNIT DIES: killed, it walks its rules once more, so its own `OnDeath` rows pay
LAST_WALK = True
# WHO GETS PAID: the faction that owns it (null for an unowned unit, which pays nobody)
OWNER = "ent.Entity.get_owner"
# THE UNITS PASSED OVER: those the game says you cannot select (shuttles, carryalls, projectiles)
ONLY = "ent.Unit.canBeSelected"
# A UNIT IS ITS OWN PLACE ON THE MAP, so its payments float over itself
SHOWN_AT = "itself"
# which scope this is, as a number of ours no other scope claims
NUMBER = 2
# AND THE REGION IT STANDS IN IS A SOURCE OF RULES: one more pass, via `scopes/region.py`
READS_ITS_REGION = True

# THE HOP TO THE UNIT'S VILLAGE IS A QUESTION (the game's own checked door), never a field read
IN_VILLAGE = ("ent.MobileEntity.get_structure",)

# THE REACH THIS WORD IS FOR: `Militia`, read against the unit's village (none: marks nobody)
REHOSTS_FROM = "EMilitia"
REHOSTS_ONTO = "village"
# ⛔ IT NAMES A SET: paid once per militia, each member asking whether it belongs
REHOSTS_A_SET = True
# AND THE ROUTE FROM THE CARRIER'S VILLAGE TO THAT SET: its own list of live militia, by name
SET_MEMBERS = ("siege", "activeMilitia")

# AND THE VILLAGE WHOSE RULES THIS ROAD READS (fan-out to its militia), via `IN_VILLAGE`'s door
HOST = "ent.MobileEntity.get_structure"
# AND A SECOND DOOR FOR A MILITIA (its own village field), asked only when the first is empty
HOST_ALSO = ("ent.Army", "militiaSource")
HOST_KIND = "ent.Structure"
# a village has no owner getter of its own, so it answers the one every entity shares
HOST_OWNER = "ent.Entity.get_owner"
# AND WHAT A ROW ON THAT VILLAGE IS STAMPED WITH; building-state rows never match a unit's kind
STAMPED_BY = "kind"
# the cdb sheet a target column names
SHEET = "unit"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
