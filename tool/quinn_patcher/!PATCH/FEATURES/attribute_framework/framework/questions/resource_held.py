"""Resource held: how much of the column-named resource a faction holds (`HasRes`)."""
from framework.trailing import ASKS_ITS_OWN
QUESTION = "resource held"
# what it hands the words on its right and takes from its left; why, when nothing
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the game's own amount held, asked of the faction by the resource's position in its sheet
ASKS = "ent.Faction.getResource"
ASKED_OF = "ent.Faction"
# ⛔ THE POSITION BY NAME, EACH TIME: `$Data`'s sheet looked up by id, as the game's own check does
SHEET = "resource"
BY_ID = "byId"
POSITION = "index"
# the kind the sheet's row is, borrowed from the one game function that takes it
ROW_OF = ("ent.Faction.updateResource", 0)
# compared with the row's `val`: at or above keeps it, unless a comparison word says otherwise
AT_LEAST = "value"
# what a trailing word on its right may attach to: the amount held, for a comparison word
OFFERS = ("a comparison",)
# the module that weighs it
WEIGHED_BY = "framework.resheld"
# an owner word in front picks the factions asked, judged against the row's writer: `EnemyHasTRes`
OWNERS_PICK = True
