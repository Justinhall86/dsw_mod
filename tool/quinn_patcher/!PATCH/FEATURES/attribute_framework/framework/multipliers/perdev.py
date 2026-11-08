"""`PerDev` -- a trailing word: the amount on its left times the faction's developments."""
from framework.trailing import NOTHING_TO_NAME, VAL_IS_ITS_AMOUNT
from framework.turned import NAMES_NOTHING_TO_LEAVE_OUT
WORD = "PerDev"
# its family on the catalogue
KIN = 'Development'
# the editor text, then the holder's own line's; `{more}` is what trailing words add
PHRASE = "for each development{more} {subject} own{s}"
HOLDER = "for each development{more} my faction owns"
# a multiplier names no target column: it says how much, never what the effect is about
TARGET = "never"
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# what a trailing word on its right may attach to: the count, to narrow it
OFFERS = ("a development count", "a domain")
# why `Not` never turns it
NOT_NONE = NAMES_NOTHING_TO_LEAVE_OUT
# what it counts on, and the way there: the developments, then how many of them it owns
ASKED_OF = "ent.Faction"
COUNTS = ("ent.Faction.get_developments", "logic.faction.Developments.get_ownedCount")
# an owner word after `Per` sums the count over the factions it picks, judged against the writer
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# the count's instrument, latched into bands, so zero and no answer read differently
BANDS = ((1, "the faction has at least 1 development"),
         (11, "the faction has at least 11 developments"),
         (31, "the faction has at least 31 developments"))
# bare or named, and with or without `val`: why it takes one side only, or what is owed
NAMED_NONE = NOTHING_TO_NAME
VAL_NONE = VAL_IS_ITS_AMOUNT
