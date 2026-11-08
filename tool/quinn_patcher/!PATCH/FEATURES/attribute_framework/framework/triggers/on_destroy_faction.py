"""`OnDestroyFaction` -- a faction's last main base falls; `OnTDestroyFaction` on the one named."""
from framework.trailing import NO_FAMILY_TRAILER, OPENS_THE_RULE, VAL_NOT_ITS
WORD = "OnDestroyFaction"
# its family on the catalogue
KIN = 'Elimination'
# the editor text, with and without a target, then the holder's; `{s}` is empty after "you"
PHRASE = "when {actor} destroy{s} [::target::]'s last main base"
BARE = "when {actor} destroy{s} another faction's last main base"
HOLDER = "when my faction destroys [::target::]'s last main base"
HOLDER_BARE = "when my faction destroys another faction's last main base"
TARGET = "optional"
# what it hands the words on its right and takes from its left; why, when nothing
OFFERS, OFFERS_NONE = (), NO_FAMILY_TRAILER
NEEDS, NEEDS_NONE = (), OPENS_THE_RULE
# `OnNotTDestroyFaction2`: `Not` after this text fires on every victim but the one named
TURNED_AFTER = "On"
TURNED_PHRASE = "when {actor} destroy{s} the last main base of a faction other than [::target::]"
TURNED_HOLDER = "when my faction destroys the last main base of a faction other than [::target::]"
# the cdb sheet a target column names
SHEET = "faction"
# which trigger this is, as a number of ours. Never where the word sits in a list
NUMBER = 4
# WHERE IT IS RAISED FROM: the game's loss of a main base, on the victim faction
SITE = "ent.Faction.loseMainBase__impl"
# the call there that ends the victim, made for its last base only; the word fires ahead of it
BEFORE = "logic.state.State.losePlayer"
# the news sent right after it, whose second and third things are the destroyer and the base
NEWS = "$HEvent.addEvent"
# what that function is about, checked by name the way a scope's site is
ABOUT = "ent.Faction"
# what the base taken is, as the game's own type
BASE = "ent.Structure"
# THE PLACE IT FIRES IN, asked by every narrowing spelled after it, and who holds that place
FIRED_IN = "the victim"
FIRED_IN_HELD_BY = "ent.Entity.get_owner"
# that place in the word builder's words, and the scope whose rules it is asked by
PLACE, PLACE_IS = "the victim", "Faction"
# what the victim is called, which is the `faction` sheet id a target column names
CALLED = "kind"
# WHERE THE NUMBER FLOATS: the base taken, as the game's entity
SHOWN_AS = "ent.Entity"
# bare or named, and with or without `val`: why it takes one side only, or what is owed
VAL_NONE = VAL_NOT_ITS
