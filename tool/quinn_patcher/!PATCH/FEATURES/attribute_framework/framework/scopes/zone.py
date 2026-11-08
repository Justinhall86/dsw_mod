"""`Zone` -- a use about one zone (not an entity), filed at readiness and every tick."""
from framework.trailing import NOTHING_TO_NAME, OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
from framework.turned import PLACE_HAS_NO_TARGET
WORD = "Zone"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "region"
# a zone use means whichever zone is in hand; a zone is never named in a target column
TARGET = "never"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# why `Not` never turns it
NOT_NONE = PLACE_HAS_NO_TARGET
# the game's own per-zone update, and what it is about -- both by name, both checked
SITE = "ent.Zone.updateAttributes"
ENTITY = "ent.Zone"
# where this scope's RULES run: the zone's own tick, never inside the update above
ROAD = "ent.Zone.regularUpdate"
# WHO GETS PAID: a zone is no entity, so its own getter, which answers null for a zone unheld
OWNER = "ent.Zone.get_factionOwner"
# our unique scope number, never a list place
NUMBER = 12
# a zone is no thing on the map, so its numbers appear over its centre
SHOWN_AT, SHOWN_NEEDS = "ent.Zone.getCenter", "innerArea"
# the cdb's `scope` column set to `Regional` moves a rule onto the REGION, which is a zone
REHOSTS_FROM = "ERegional"
# and onto the per-pass holder the road already works out under this name
REHOSTS_ONTO = "region"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_NOT_ITS
