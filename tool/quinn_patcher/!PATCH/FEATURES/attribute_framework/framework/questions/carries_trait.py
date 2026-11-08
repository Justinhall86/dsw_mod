"""Carries trait: whether a thing carries the column-named trait (`HasTrait`)."""
from framework.trailing import ASKS_ITS_OWN, NOTHING_TRAILS_IT
QUESTION = "carries trait"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NOTHING_TRAILS_IT
NEEDS, NEEDS_NONE = (), ASKS_ITS_OWN
# the question and what it is asked THROUGH: the same pair `framework/scopes/agt.py` asks
ASKS = "logic.TraitsManager.has"
THROUGH = "ent.Object.get_traits"
