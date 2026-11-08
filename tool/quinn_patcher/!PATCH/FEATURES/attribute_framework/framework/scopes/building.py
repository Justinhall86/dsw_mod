"""`Building` -- a use about one building; its site is the inherited `ent.BaseBuilding` one."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Building"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "building"
# a building use can name a building in a target column, or mean whichever one is in hand
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any building but [::target::]"
# the game's own per-building update, and what it is about -- both by name, both checked
SITE = "ent.BaseBuilding.updateAttributes"
ENTITY = "ent.BaseBuilding"
# where this scope's RULES run: the building's own tick (no effect inside the update above)
ROAD = "ent.Building.regularUpdate"
# A BUILDING DIES: destroyed, it walks its rules once more, so its own `OnDeath` rows pay
LAST_WALK = True
# WHO GETS PAID: the faction that owns it, by the building's OWN getter
OWNER = "ent.BaseBuilding.get_owner"
# a building-state row is filed on its VILLAGE, stamped with the building's kind: read both
HOST = "structure"
HOST_KIND = "ent.Structure"
# what the stamp carries, read off the building by the same name -- per KIND, never a uid
STAMPED_BY = "kind"
# and how the host is owned: a village answers the getter every entity shares
HOST_OWNER = "ent.Entity.get_owner"
# A BUILDING IS ITS OWN PLACE ON THE MAP, so its payments float over itself
SHOWN_AT = "itself"
# which scope this is, as a number of ours no other scope claims
NUMBER = 8
# AND THE REGION IT STANDS IN IS A SOURCE OF RULES: one more pass, via `scopes/region.py`
READS_ITS_REGION = True

# HOW A MARKED SPELLING IS MATCHED: the field its things carry their cdb id in
MARKED_ID = "kind"

# THE REACH THIS WORD IS FOR: as though every building of the village carried the row
REHOSTS_FROM = "EBuilding"
REHOSTS_ONTO = "village"
# it names a SET, like `Militia`: the row is paid once per member
REHOSTS_A_SET = True
# AND THE ROUTE FROM A VILLAGE TO THAT SET: the village's own list of buildings
SET_MEMBERS = ("buildings",)

# ⛔ THE BUILDING'S VILLAGE HOP IS PARKED: it faults (`python _rules.py scopes/building.py`)
PARKED_IN_VILLAGE = (HOST,)
# the cdb sheet a target column names
SHEET = "building"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
