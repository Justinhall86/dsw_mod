"""
MUST BE TRUE: permanent_resactions: by name
PROVES: StampedTo<Owner> gives one trait copy per faction its owner word picks
WORKS ALREADY: AL1 RaiseTAlert; FI1 faction style files; PR1 permanent res actions; TI1 tiers
WATCH: none
REGRESSION: recent
REVIEWED: right -- none; readable -- none
MEASURED: python _wordcost.py ->"same"
REACHES: the world's own sweep
"""
# reaches: the rules of Agt Building Faction Structure Unit Zone
import os
# and: a quest started, completed, failed, IgnoreCond; an assassination succeeded; a day began
import sys
# also: village shows traits, underworld headquarters, last base fell, siege action finished
import time
# fed: DevCost add and mul, OfWeight, QuestCooldown, the bake, a main base shows its own traits

# the three folders sit beside this file, so make this folder importable before reaching in
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from tools.project import on_path  # noqa: E402
on_path()


from cases import gain_res as gain_res_cases
from cases import bake as bake_cases, board as board_cases
from cases import boundary as boundary_cases
from cases import columns as columns_cases
from cases import effectdata as effectdata_cases
from cases import effecttable as effecttable_cases
from cases import triggermatch as triggermatch_cases
from cases import ridermatch as ridermatch_cases
from cases import idwalk as idwalk_cases
from cases import pieceword as pieceword_cases
from cases import loadguard as loadguard_cases
from cases import names as names_cases, newworld as newworld_cases
from cases import mark as mark_cases
from cases import parsed as parsed_cases
from cases import pipeline as pipeline_cases
from cases import prodpick as prodpick_cases
from cases import record as record_cases
from cases import saidrow as saidrow_cases
from cases import scopematch as scopematch_cases
from cases import on_siege_action as siege_cases
from cases import on_assassinate as assassinate_cases
from cases import on_destroy_faction as destroy_cases
from cases import on_eliminate as eliminate_cases
from cases import on_dev as dev_cases  # the block it proves: a development acquired
from cases import on_start_quest as quest_cases
from cases import on_quest_complete as completion_cases
from cases import on_quest_fail as failure_cases
from cases import on_treaty as treaty_cases
from cases import on_treaty_end as ending_cases
from cases import each_day as day_cases
from cases import on_kill as kill_cases
from cases import on_building as building_cases
from cases import quest_timer as timer_cases
from cases import splice as splice_cases
from cases import userow as userow_cases
from cases import widen as widen_cases, saveplace as saveplace_cases
from cases import savetargets as savetargets_cases
from cases import alongside as alongside_cases
from cases import whenbegun as whenbegun_cases
from cases import storewalk as storewalk_cases
from cases import traps as traps_cases
from cases import tray as tray_cases
from cases import twoblocks as twoblocks_cases
from cases import reach as reach_cases
from cases import rehosted as rehosted_cases
from cases import setreach as setreach_cases
from cases import running as running_cases
from cases import settle as settle_cases
from cases import lasttick as lasttick_cases
from testrun import cmdsfile, matchfile
from testrun import nocameratour, norecall, norestartloop, nospeedup
from testrun import loadplays
from standalone import onoff
from cases import traitshownonce as traitshownonce_cases
from cases import trailing as trailing_cases
from tools import compact, cost, deploy, project, sharedsizes, stagesizes, ticks

# the number this build is filed under; its signature is compared against the one before it
BUILD = 1209

# EVERY TICK FOLDER'S OWN LIST OF CHANGES, the folders alphabetically; `TICKS_ONLY` narrows it
FEATURES = ticks.changes(os.environ.get("TICKS_ONLY"))
# OUR TEST BENCH'S OWN CHANGES, never a tick: after every tick, as the alphabet already put them
FEATURES += (
    ("the bench's aimed match, read from a file", matchfile.install),
    ("the bench's console lines, read from a file", cmdsfile.install),
    # AFTER the line above: silencing the game's own line first leaves that step nothing to find
    ("the game's own console line, silenced", norecall.install),
    ("the game's own camera tour, stopped", nocameratour.install),
    ("the game's own restart loop, broken", norestartloop.install),
    ("a loaded save plays, its pause dropped", loadplays.install),
    ("the game's own four times speed, stopped", nospeedup.install),
)
# LAST, AND IT HAS TO BE: the world arms every word a road says once, so the roads run before it
FEATURES += ticks.changes(os.environ.get("TICKS_ONLY"), "LAST")


# WHAT PROVES THEM, run after every feature is in: one file per feature, in `cases/`
CASES = (
    ("the board of words", board_cases.check),
    ("the widened carriers", widen_cases.check),
    ("the place the save carries", saveplace_cases.check),
    ("a row's own columns in the save", savetargets_cases.check),
    ("the line-up beside the game own", alongside_cases.check),
    ("trap kinds", traps_cases.check),
    ("the boundary", boundary_cases.check),
    ("the column walk", columns_cases.check),
    ("the name parser", names_cases.check),
    ("the row record", record_cases.check),
    ("the load guard", loadguard_cases.check),
    ("the pipeline", pipeline_cases.check),
    ("the effect table", effecttable_cases.check),
    ("the id walk", idwalk_cases.check),
    ("the classifier", pieceword_cases.check),
    ("an effect's row in the game", effectdata_cases.check),
    ("the mark", mark_cases.check),
    ("the rows already said", saidrow_cases.check),
    ("the act", gain_res_cases.check),
    ("the attribute pick", prodpick_cases.check),
    ("what the parse found", parsed_cases.check),
    ("the scope match", scopematch_cases.check),
    ("the trigger match", triggermatch_cases.check),
    ("the rider match", ridermatch_cases.check),
    ("the trailing words, and the multipliers they gate", trailing_cases.check),
    ("the splice itself", splice_cases.check),
    ("one trait, one icon", traitshownonce_cases.check),
    ("the reach, as it now sits in the game", reach_cases.check),
    ("the carriers a reach leaves, and the passes that walk them", rehosted_cases.check),
    ("the set reaches, and the route each takes to its members", setreach_cases.check),
    ("the running total, and that every road empties it before it grants", running_cases.check),
    ("the settling, and that a road writes down what it grants", settle_cases.check),
    ("the tick sweep, and where in the game's own clock it sits", lasttick_cases.check),
    ("the bake, as it now sits in the game", bake_cases.check),
    ("the authored row, as it now sits in the game", userow_cases.check),
    ("the world, as it now sits in the game", newworld_cases.check),
    ("the session gate, as it now sits in the game", whenbegun_cases.check),
    ("the tray's recipe, off the game's own draw", tray_cases.check),
    ("the siege, as it now sits in the game", siege_cases.check),
    ("the assassination, as it now sits in the game", assassinate_cases.check),
    ("the destruction, as it now sits in the game", destroy_cases.check),
    ("elimination, at both its events", eliminate_cases.check),
    ("the development, as it now sits in the game", dev_cases.check),
    ("the quest start, as it now sits in the game", quest_cases.check),
    ("the quest completion, as it now sits in the game", completion_cases.check),
    ("the quest failure, as it now sits in the game", failure_cases.check),
    ("the treaty signing, as it now sits in the game", treaty_cases.check),
    ("the treaty ending, at both its drains", ending_cases.check),
    ("the new day, one walk per faction", day_cases.check),
    ("the kill, one walk per side", kill_cases.check),
    ("the building moments, each in its own site", building_cases.check),
    ("the quest timers, as they now sit in the game", timer_cases.check),
    ("two blocks in one function", twoblocks_cases.check),
)


if not os.environ.get("SPINE_NO_ROAD"):
    CASES = CASES + (("the road, as it now sits in the game", storewalk_cases.check),)
# A TICK LEFT OUT TAKES ITS PROOFS WITH IT: one icon is the trait tick's, the rest the framework's
CASES = tuple(c for c in CASES if ticks.on(
    "buildings_show_traits" if c[1] is traitshownonce_cases.check else "attribute_framework",
    os.environ.get("TICKS_ONLY")))


# WHERE A BUILD'S MINUTES GO, timed by the build itself; the slowest steps print at the end
SPENT = []


def _timed(kind, what, doing):
    """Run one step, keep what it cost, and hand back whatever it said."""
    started, live = time.time(), _live()
    if live is None:
        said = doing()
    else:
        with live.Step(BUILD, "%s: %s" % (kind, what)):
            said = doing()
    SPENT.append((time.time() - started, kind, what))
    return said


def _live():
    """The live times file's writer, which every step reports to; none outside our own folder."""
    sys.path.insert(0, os.path.join(project.ROOT, "_claude"))
    try:
        import _buildtimes
    except ImportError:
        return None
    return _buildtimes


def _where_the_time_went(whole):
    """The slowest steps, and what each kind cost in total."""
    if not whole:
        return "nothing was timed"
    by_kind = {}
    for took, kind, _ in SPENT:
        by_kind[kind] = by_kind.get(kind, 0.0) + took
    counted = sum(by_kind.values())
    worst = sorted(SPENT, reverse=True)[:5]
    return ("TIME: %.0fs in all -- %s%s\n     slowest: %s"
            % (whole,
               ", ".join("%s %.0fs" % (kind, took)
                         for kind, took in sorted(by_kind.items(), key=lambda p: -p[1])),
               (", unaccounted %.0fs" % (whole - counted)) if whole - counted >= 1 else "",
               "; ".join("%s %.0fs" % (what[:34], took) for took, _, what in worst)))


def apply_features(bc):
    # run each feature over the game code we are holding, and print what each one reports
    stagesizes.watch()
    compact.watch(bc)
    for what, apply_to in FEATURES:
        print("  [%s]" % what)
        print("  " + _timed("features", what, lambda: apply_to(bc)))
    stagesizes.freeze()
    print("  " + sharedsizes.report(bc))
    sharedsizes.write(bc, blockmap().replace("_blocks.json", "_ours.json"))
    _refused_before_the_cases(bc)
    # then prove them, on the file they were just applied to
    for what, prove in CASES:
        print("  [cases] %s: %s" % (what, _timed("cases", what, lambda: prove(bc))))
    # PAST THE CASES, which read the registers as each stage wrote them: ours merged where they can
    print("  " + _timed("registers", "the registers merged", lambda: compact.merge(bc)))
    # and weigh what every splice ADDS; a looped call is refused unless the COMMAND allowed it
    print("  " + _timed("weighing", "the weighing", lambda: cost.report(bc)))
    # AND WHAT EACH BLOCK IS, WRITTEN DOWN so the next build can see WHICH OF OURS it moved
    print("  " + _timed("blocks", "the blocks", lambda: _record_blocks(bc)))


def _refused_before_the_cases(bc):
    """Ours grown without their words, or a changed block the header never names: refused now."""
    sys.path.insert(0, os.path.join(project.ROOT, "_claude"))
    try:
        import _sizealone
        from _theirword import good_build
    except ImportError:
        return
    from tools import blocks
    header = open(os.path.join(project.ROOT, "!PATCH", "build.py"), encoding="utf-8").read(6000)
    quiet = blocks.unnamed_now(bc, header, blockmap(int(good_build()))) if good_build() else []
    grew = _sizealone.grown(str(BUILD), sharedsizes.named(bc)) + [
        "the header never names the changed block `%s`" % b for b in quiet]
    if grew:
        raise SystemExit("*** REFUSED BEFORE THE CASES:\n    " + "\n    ".join(grew))


def blockmap(nn=None):
    # where one build's block record lives -- beside the signatures, never at the root
    name = "build_%03d_blocks.json" % (BUILD if nn is None else nn)
    return os.path.join(project.ROOT, "output", "builds", name)


def _record_blocks(bc):
    from tools import blocks
    made = blocks.of(bc)
    blocks.write(bc, blockmap())
    blocks.write_said(blockmap().replace("_blocks.json", "_said.json"))
    staged = stagesizes.write(blockmap().replace("_blocks.json", "_stages.json"))
    return "BLOCKS: %d spliced block(s) recorded for build %d; %s" % (len(made), BUILD, staged)


def artifact(suffix=""):
    # the built game file for this build, named so the build tool and the signature agree
    return os.path.join(project.ROOT, "build_%03d%s_out.dat" % (BUILD, suffix))


def build_from(path):
    # load a game file, apply every feature to it, and hand back the result
    from crashlink import Bytecode
    bc = _timed("the load", "reading the game file", lambda: Bytecode.from_path(path))
    apply_features(bc)
    return bc


if __name__ == "__main__":
    # ONE BOOT PER BUILD; the other boots are stage 3's job
    built = artifact()
    # WHICH FILE WE START FROM IS THE SAME SWITCH AS WHICH LIFTS ARE ON, and a mixture is refused
    if onoff.FROM_PRISTINE:
        base = project.RELOAD if onoff.KEEP_RELOADPAK else project.PRISTINE
        on = onoff.PRISTINE
    else:
        dressed = deploy.profiles()
        base, on = ((dressed[0][1], dressed[0][0]) if dressed
                    else (project.PRISTINE, onoff.PRISTINE))
    onoff.refuse_double_apply(on)
    print("building on the `%s` version -> %s" % (on, base))
    _whole = time.time()
    made = build_from(base)
    print("wrote %d bytes -> %s"
          % (_timed("the save", "writing the built file",
                    lambda: deploy.save(made, built)), os.path.basename(built)))
    del made
    # one game copy in memory at a time; WHICH BOOT THIS WAS MADE FROM is written beside it
    with open(built + ".base", "w") as says:
        says.write(base)
    print("  " + _where_the_time_went(time.time() - _whole))
    print("INSTALLING THE `%s` VERSION" % on)
    deploy.install(built)
