"""`PerFaction` -- a trailing word: the amount on its left times the game's living factions."""
from framework.trailing import NO_NAME_TO_WRITE, VAL_IS_ITS_AMOUNT
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = "PerFaction"
# its family on the catalogue
KIN = "Faction"
# the editor text, and the holder's; `{more}` is what trailing words add
PHRASE = "for each faction{more}"
HOLDER = "for each faction{more}"
# with an owner word, the factions it picks; the ones naming every faction, or only you, apart
OWNED_PHRASE = "for each of {subject}{more}"
OWNED_PHRASE_AS = {"All": PHRASE, "Any": PHRASE, "Own": "for your own faction{more}"}
# every living faction counts, so there is no faction for a column to name
TARGET = "never"
NAMED_NONE, NOT_NONE = NO_NAME_TO_WRITE, NAMES_NOTHING_TO_LEAVE_OUT
# what it hands the words on its right and takes from its left: a narrowing asks each faction
OFFERS = ("a faction count",)
NEEDS = "an amount"
# narrowed, each faction is a member: a faction's own, the game's list, and never a dead one
MARKED_AS = "Faction"
LISTED_BY = "framework.questions.factions_living"
UNLESS = ("ent.Faction.isDead",)
# what it counts on, and the way there: any faction's own list, so the sum has a faction to start
ASKED_OF = "ent.Faction"
COUNTS = ("ent.Faction.get_developments",)
# ⛔ the end of the way is no count: the game's own list of factions, each living one counted
SUMMED_BY = "framework.questions.factions_living"
# an owner word after `Per` counts the factions it picks, judged against the writer
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
