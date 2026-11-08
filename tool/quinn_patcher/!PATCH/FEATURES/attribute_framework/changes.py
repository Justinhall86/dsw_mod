"""This tick's changes, in the order the build applies them."""
import os

from framework import alongside, answer, atload, bake, board, boundary, columns, compmatch
from framework import effectdata, effecttable, grantwatch, triggermatch, idwalk, inuse, lasttick
from framework import loadguard, mark, membercount, modsay, multmatch, names, narrowcount
from framework import narrowmatch, newworld, ownmark, parammatch, parsed, passtray, pieceword
from framework import questions, questtimer, rescount
from framework import pipeline, press, quietscope, reach, record, rederive, rehosted, ridermatch
from framework import running, saidrow, saveplace, savetargets, scopematch, secondgame, setreach
from framework import settle, storewalk, targetn, trailing, traps, tray, userow, widen
from framework.acts import (complete_quest, fail_quest, gain_dev_days, gain_devs, gain_heg,
                            gain_res, gain_res_prod, gain_ttrait_stacks, raise_alert,
                            spawn_tunits, start_quest)
from framework.raises import on_assassinate, on_destroy_faction, on_dev, on_siege_action
from framework.raises import on_quest_complete, on_quest_fail, on_start_quest, on_treaty
from framework.raises import each_day, on_building, on_kill, on_treaty_end

CHANGES = (
    # T1 -- the press, on the one path every marker family comes through
    ("the numbered markers the game declines", press.install),
    # BEFORE ANY READING, because each one asks the board for its own place as it is written
    ("the board of words", board.install),
    ("the `mod say` line", modsay.install),
    # FIRST of the spine's own: every kind below says what its members carry, traps included
    ("trap kinds: a rule is a property of a kind, not a line to remember", traps.install),
    # AN INSTRUMENT, found by shape, so before any block of ours could match one of its shapes
    ("the engine's own stack decision, said where it is made", grantwatch.install),
    # AFTER the watchers, so its own gate is the one they report on
    ("the game's own passes mark what they grant", ownmark.install),
    # FIRST OF ALL, because it changes the shape of two things every later step reads
    ("one more place on each carrier a column travels in", widen.install),
    ("a row's own columns, saved ahead of the saved place", savetargets.install),
    ("one more place, and the save carries this one", saveplace.install),
    ("the boundary: which attribute rows are ours", boundary.install),
    ("the column walk: which columns a row carries", columns.install),
    ("the id walk: an authored id, a piece at a time", idwalk.install),
    ("the classifier: which word one piece is", pieceword.install),
    ("the name parser, and the words it knows", names.install),
    ("the texts our questions read, minted before any rule asks one", questions.install),
    ("the scope match: which scope an id named, as a number of ours", scopematch.install),
    ("the trigger match: which trigger an id named, as a number of ours", triggermatch.install),
    ("the rider match: who an id said the result counts for", ridermatch.install),
    ("the narrowing slot: which words an id spelled, as bits of one number",
     narrowmatch.install),
    ("the comparisons: how a weighing word's `val` keeps the thing", compmatch.install),
    ("the multiplier match: what an id said to scale by", multmatch.install),
    ("the narrowed counts: a multiplier counting only what a word names", narrowcount.install),
    ("the member counts: a unit count narrowed by type or trait", membercount.install),
    ("the held counts: 1 per whole `val` of a resource held", rescount.install),
    ("the parameter match: what an id handed the act to use", parammatch.install),
    ("the trailing words: what each word offers, and what a trailing word needs", trailing.install),
    ("the row record: one row as a stage sees it", record.install),
    ("the road a row takes, and what each stage of it may do", pipeline.install),
    ("what an effect is, in seven columns", effecttable.install),
    ("an effect's row, as the game will read it", effectdata.install),
    ("the load guard: nothing runs before the world is real", loadguard.install),
    ("the mark: what each application is owed, and by which trigger", mark.install),
    # BEFORE ANYTHING THAT SPLICES: the siege and the road both ask it where an event's numbers go
    ("the tray: one floating number per resource per event", tray.install),
    ("the pass's own tray: one number for what a whole walk pays", passtray.install),
    ("what the parse found, kept per row", parsed.install),
    # BEFORE THE ROAD, which is the only thing that asks it anything
    ("the holders a restored row's record has already been worked out on", rederive.install),
    ("the rows the walk reaches, said once each and never per tick", saidrow.install),
    ("add-resource: the one effect, and the only act", gain_res.install),
    ("add-trait-stacks: the first effect that lands on the THING", gain_ttrait_stacks.install),
    ("spawn-units: the first effect whose result nothing takes back", spawn_tunits.install),
    ("add-production: every held word's game attribute, from the held table",
     gain_res_prod.install),
    ("add-hegemony: the game's own hegemony gain, under a hegemony row", gain_heg.install),
    ("add-developments: the game's own free development, named or picked", gain_devs.install),
    ("add-development-days: the game's own research days, named or picked", gain_dev_days.install),
    ("start-quest: the console's own start of a named quest, else the game's pick",
     start_quest.install),
    ("complete-quest: the game's own completion of a running quest, or of its named solve",
     complete_quest.install),
    ("fail-quest: the game's own failure of a running quest, its alert included",
     fail_quest.install),
    ("raise-alert: the game's own alert column, the alert pointing at the rule's holder",
     raise_alert.install),
    ("quest timers: the game's limit and calendar read through our Quest_ attributes",
     questtimer.install),
    ("in use: every game attribute our words add is read, named by a row or not", inuse.install),
    # T1's other half, BEFORE the load walk and after the column walk, while that stretch is clear
    ("the game asked for every numbered column an authored row carries", targetn.install),
    # T6, and it goes beside the one above because both need the boundary's sentinel minted
    ("the engine's scope complaint stepped over for our rows", quietscope.install),
    # BEFORE THE LOAD WALK: its block says the reach, so both words are in the file first
    ("the reach a modder wrote, read where the row is still whole", reach.install),
    ("the things carrying a row a reach moved, so every unit can reach it", rehosted.install),
    ("a set reach reaches its members off the carrier's village", setreach.install),
    ("the running total per receiver and trait, so several rows add up", running.install),
    ("an array of our own for the engine to answer into", answer.install),
    ("settling: each receiver's trait set once per pass, to the number the pass ended on",
     settle.install),
    # AFTER the settling, whose places its sweep reads, and BEFORE the road, which fills its two
    ("the tick: a mark nothing renewed for a whole window is taken back", lasttick.install),
    ("THE LOAD WALK: every column an authored row fills, said once", atload.install),
    # BEFORE THE FILING BLOCK READS IT: our line-up has to exist and be filtered first
    ("our own line-up, riding beside the game own registrations", alongside.install),
    ("THE BAKE: an authored id read where the game files it", bake.install),
    ("THE SIEGE: where the second trigger's own event happens", on_siege_action.install),
    ("THE ASSASSINATION: where the third trigger's own event happens", on_assassinate.install),
    ("THE DESTRUCTION: where the fourth trigger's own event happens", on_destroy_faction.install),
    ("THE DEVELOPMENT: where the sixth trigger's own event happens", on_dev.install),
    ("THE QUEST: where the seventh trigger's own event happens", on_start_quest.install),
    ("THE COMPLETION: where the eighth trigger's own event happens", on_quest_complete.install),
    ("THE FAILURE: where the ninth trigger's own event happens", on_quest_fail.install),
    ("THE TREATY: where the tenth trigger's own event happens", on_treaty.install),
    ("THE TREATY'S END: where the eleventh trigger's own event happens", on_treaty_end.install),
    ("THE KILL: where the twelfth to fourteenth triggers' own event happens", on_kill.install),
    ("THE BUILDING: where the fifteenth to eighteenth triggers' own events happen",
     on_building.install),
    ("THE NEW DAY: where the nineteenth to twenty-fourth triggers' own event happens",
     each_day.install),
    ("THE USE ROW: what a modder wrote, handed to the filing about to use it",
     userow.install),
)
# AFTER EVERY OTHER CHANGE IN THE BUILD, the bench's own included: the build applies `LAST` last
LAST = ()
# THE ROAD IS THE ONE VARIABLE OF A MEASUREMENT: `SPINE_NO_ROAD=1` builds the CONTROL without it
if not os.environ.get("SPINE_NO_ROAD"):
    LAST += (("THE ROAD: a holder's own rules, over its own store of authored rows",
              storewalk.install),)
LAST += (
    # LAST OF THE SPINE: it arms every word a road says once, so the roads run before it
    ("THE WORLD: turned on when the game is ready, thrown away when a new one begins",
     newworld.install),
    # BEHIND THE WORLD'S OWN EMPTYING, which it reads
    ("what a new game still holds of the last one", secondgame.install),
)
