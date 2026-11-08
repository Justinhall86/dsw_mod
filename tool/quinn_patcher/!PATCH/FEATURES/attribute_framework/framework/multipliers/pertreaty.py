"""`PerTreaty` -- a trailing word: the amount on its left times the treaties the faction holds."""
from framework.trailing import OWES_ITS_TREATIES, VAL_IS_ITS_AMOUNT
WORD = "PerTreaty"
# its family on the catalogue
KIN = 'Treaty'
# the editor text, with and without a target, then the holder's; `{more}` is what trailing words add
PHRASE = "for each [::target::]{more} {subject} hold{s}"
BARE = "for each treaty{more} {subject} hold{s}"
HOLDER = "for each [::target::]{more} my faction holds"
HOLDER_BARE = "for each treaty{more} my faction holds"
# its marked spelling (`PerTTreaty2`) counts only the treaties of the kind its column names
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS = ()
OFFERS_OWED = {"a treaty pick": OWES_ITS_TREATIES}
# what it attaches to: the nearest word on its left offering this
NEEDS = "an amount"
# `PerNotTTreaty2`: `Not` after this text counts every treaty held but the kind named
TURNED_AFTER = "Per"
TURNED_PHRASE = "for each treaty{more} {subject} hold{s} other than [::target::]"
TURNED_HOLDER = "for each treaty{more} my faction holds other than [::target::]"
# what it counts on, and the way there: the faction's developments, which name their faction
ASKED_OF = "ent.Faction"
COUNTS = ("ent.Faction.get_developments",)
# ⛔ the end of the way is no count: the game's diplomacy counts every treaty the faction holds
SUMMED_BY = "framework.questions.treaties_active"
# ⛔ MARKED, the count is listed with the kind its column names, and asked of that kind alone
NAMED_COUNT = "framework.questions.treaties_active"
# an owner word after `Per` sums the count over the factions it picks, judged against the writer
OWNERS_PICK = True
# written straight after `Per`, inside the spelling
OWNER_STEM = "Per"
# `With` after it counts only the treaties held with the partners it picks or names
PARTNERED = "With"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_IS_ITS_AMOUNT
