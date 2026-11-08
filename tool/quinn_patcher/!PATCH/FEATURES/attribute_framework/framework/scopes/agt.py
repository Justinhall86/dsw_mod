"""`Agt` -- one agent (a councillor): no tick of its own, so its road opens its attribute update."""
from framework.trailing import OPENS_THE_RULE, SCOPE_HANDS_NOTHING, VAL_NOT_ITS
WORD = "Agt"
# the editor noun, with and without a target; the owner word frames it
PHRASE = "[::target::]"
BARE = "agent"
# an agent use can name an agent in a target column, or mean whichever one is in hand
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), SCOPE_HANDS_NOTHING
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `Not` in front: every one of its kind but the one its column names
TURNED_AFTER = ""
TURNED_PHRASE = "any agent but [::target::]"
# the game's own per-agent update, and what it is about -- both by name, both checked
SITE = "logic.faction.Agent.updateAttributes"
ENTITY = "logic.faction.Agent"
# where this scope's RULES run: the same per-agent call, the only one the game makes always
ROAD = "logic.faction.Agent.updateAttributes"
# WHO GETS PAID: an agent is no faction and no entity, so its own getter
OWNER = "logic.faction.Agent.get_factionOwner"
# no `SHOWN_AT`: an agent sits in a window; the instrument names one by `name`, not by `kind`
NAMED_BY = "name"
# our unique scope number, never a list place
NUMBER = 14
# `TAgt` narrows to agents CARRYING the trait its column names: an agent's type IS a trait
MARKED_ASKS = "logic.TraitsManager.has"
# asked THROUGH the thing's own trait manager, whose accessor takes any holder
MARKED_THROUGH = "ent.Object.get_traits"
# the cdb sheet a target column names
SHEET = "trait"
# why no neutral one exists: the builder hides it while the owner is `Neutral`
NEUTRAL_NONE = "an agent always serves a faction"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
