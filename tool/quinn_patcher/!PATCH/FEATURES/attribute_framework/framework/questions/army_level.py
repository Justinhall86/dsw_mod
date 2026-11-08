"""Army level against its maximum: whether an army is at its top experience level (`MaxLevel`)."""
from framework.trailing import ASKS_ITS_OWN, NO_FAMILY_TRAILER
QUESTION = "army level against its maximum"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# ⛔ FIRST whether it has levels (a level-less unit reads 0 of 0), then current not below max
REQUIRES = "ent.Unit.hasLevels"
ASKS = "ent.Army.getCurrentXpLevel"
AGAINST = "ent.Army.getMaxExperienceLevel"
# the kind both take; anything not an army narrows to nobody rather than being asked
ASKED_OF = "ent.Army"
