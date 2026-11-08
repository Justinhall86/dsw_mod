#!/usr/bin/env python3
"""Which game file the build starts from, and which of the lifted changes it applies."""

# Start from the untouched loader and apply the eight ourselves; off returns to the dressed base
FROM_PRISTINE = True

# what the build calls the untouched loader; the guard below tells the two bases apart by it
PRISTINE = "pristine"

# WHICH untouched loader: the reload one also has `reloadPak`, reloading data packs in play
KEEP_RELOADPAK = True

ON = {
    # EVERY READING SWITCH IS OFF until a run asks its QUESTION, and off again after
    "inspector":        True,
    "hideerrors":       True,
    "siegeactions":     True,
    "siegespawn":       True,
    # NOT one of the patcher's eight: an authored siege action's own cost
    "siegecost":        True,
    # NOT one of the patcher's eight: a fix ported from v1 that no base has ever carried
    "regionsupervision": True,
    # OFF while the game is asked for the same markers: the press would take them first
    "press":            False,
    # NOT one of the patcher's eight either: the game's own numbered substitution, one call further
    "targetn":          True,
    # nor this: the engine's complaint about OUR rows' scope, stepped over. Its own still says it
    "quietscope":       True,
    # nor this: a village building's window shows the traits it actually carries
    "buildingtraits":   True,
    # THE CONTROL: the same two lines as the main base row, from a block known to draw
    "buildingtraitssaying": False,
    "mainbasetraits":   True,
    # its own diagnosis: whether the block is reached, and whether it got past the root
    "mainbasetraitssaying": False,
    # OFF (PA1): a loaded save keeps the pause it carried, as the base game does
    "loadplays":        False,
    # AND ITS OTHER HALF: a loaded save plays at the speed the run typed, not four times it
    "loadspeed":        True,
    # a main base's traits leave its region's tray, since the base has a row of its own
    "basenotintray":    True,
    # the same row one window along: an underworld headquarters shows the traits it carries
    "uhtraits":         True,
    # its own diagnosis, off
    "uhtraitssaying":   False,
    # nor this: one trait shows once, however many places granted it (vanilla's doubles too)
    "traitshownonce":   True,
    # nor this: a building slot a trait added is drawn without `Null access .slots`
    "districtslots":    True,
    # the kept fixes, one switch each, named in `standalone/kept_fixes.py`
    "localsietch":      True,
    "armouryfee":       True,
    "alwayscosts":      True,
    "slotprice":        True,
    "cannotremove":     True,
    "abilitykeys":      True,
    "keycancel":        True,
    "noloseat100":      True,
    "hostlimit":        True,
    "hostlimitflat":    True,
    "traitstacks":      True,
    # Convert_TRes_To_TRes2: the trade panel on the top bar
    "trades":           True,
    # a resource's `tiers`: traits per tier, an alert on climbing, Standing's ladder in its tooltip
    "tiers":            True,
    # a res action's `permanent`, `placeOn` and `placeAlert`
    "permanent":        True,
    # a pillage or liberation counts for a quest's tracker only when that quest's faction did it
    "questowner":       True,
    # each faction row's own `UI/Styles/factions/<id>.css`, read after the game's sheet
    "factionstyles":    True,
    # ⛔ EACH BELOW NAMES ITSELF AT ITS SITE, silent until typed; this one OUT (17 loop sites)
    "grantwatch":       False,
    # two words, one for a reach a modder wrote and one for a column left alone
    "reachwords":       False,
    # its three places are the filing itself, and a build of its own says why they moved
    "userowsays":       False,
    # what a resource row actually paid, as a number, where the payment happened
    "respaid":          False,
    # whether a row was refused at the column gate or never reached it
    "columnrefusal":    False,
    # the ENGINE's own stack count, asked per reading
    "stackcount":       False,
    # the number a settle wrote, said only where that number MOVED (`W83`)
    "settlednumber":    False,
    # the same number every pass, which is the only way a retraction reads (`W86`)
    "settlednumberalways": False,
    # a receiver the pass reached and totalled nothing for (`F31`, `W76`)
    "nothingtotalled":  False,
    # ⛔ THE ONE THAT STAYS OUT: in the game's own attribute bake, it breaks it, silent or not
    "roadnamesits":     False,
    # the row itself, named where the walk reaches it
    "saidrownames":     False,
    # the engine's count asked once as each faction, which is what reads a rider
    "riderperfaction":  False,
    # WHICH faction a payment went to, said beside `respaid`
    "respaidto":        False,
    # which of the belonging question's four ways out a set-reach row took
    "belongpath":       False,
    "respath":          False,
    # which way out of the production act a row took
    "prodpath":         False,
    # how far the region pass got, one latched word per way in
    "regionpass":       False,
    "traypath":         False,
    # which way out of the pay-once question a row took: the payment closing, or a late arrival
    "oncepath":         False,
    # which way a row's own columns went through a save and back
    "savedrow":         False,
    # PROBE: a payment's marked treaty count, said plainly from boot, nothing typed
    "treatycount":      True,
    # a game gate reached asking for any stack but ours
    "gateown":          False,
    # THE WHOLE VOCABULARY, OUT: every stage of every road saying its path is its own build
    "sayingwords":      False,
    # OUT with it: the value a stage shouts -- the resource paid, by its own id
    "stageshout":       False,
    # the bypass every word that is not a value comes through; the one thing speaking at boot
    "loudprints":       False,
    # THE LINE TYPED IN THE GAME that moves every switch below at run time. Never a reading.
    "modsay":           False,
}


# EVERY SWITCH ABOVE THAT PUTS SOMETHING IN THE LOG; `_reads.py` wants each ON one said below
A_READING = ("grantwatch", "reachwords", "userowsays", "respaid", "columnrefusal",
             "stackcount", "settlednumber", "settlednumberalways", "nothingtotalled",
             "roadnamesits", "saidrownames", "riderperfaction", "respaidto", "respath",
             "prodpath", "traypath", "belongpath", "regionpass", "oncepath", "savedrow",
             "treatycount", "gateown", "sayingwords", "stageshout", "loudprints")

# HOW OFTEN EACH MAY SAY ITSELF: `game`, `tick`, `pass` latch; `free` does not; never `frame`
TEMPO = {
    "grantwatch": "tick", "reachwords": "game", "userowsays": "game", "respaid": "pass",
    "columnrefusal": "pass", "stackcount": "pass", "settlednumber": "pass",
    "settlednumberalways": "pass", "nothingtotalled": "game", "roadnamesits": "game",
    "saidrownames": "pass", "riderperfaction": "pass", "respaidto": "pass", "respath": "game",
    "traypath": "game", "belongpath": "game", "regionpass": "game", "oncepath": "pass",
    "savedrow": "game", "gateown": "game", "prodpath": "game", "treatycount": "pass",
    "sayingwords": "free", "stageshout": "free", "loudprints": "free",
}

# WHAT SPEAKS BEFORE ANYTHING IS TYPED: one probe, read plainly; the rest wait for `mod say`
SPEAKING_AT_BOOT = ("treatycount",)

# WHAT ONE OF ITS LINES IS: what it answers, a real line, each field; needed while ON
SAYS = {
    "sayingwords": (
        "THE VOCABULARY ITSELF -- not one reading but the door every word of ours that is not a"
        " value comes through. Each stage of each road says where it got to, so a log read down"
        " the page is a PATH: the last word is the last place reached and the first missing one"
        " is where the row stopped. Latched per word per game, so a road running every tick"
        " still says its path once. On, a run carries hundreds of lines; that is what it is for",
        "SPINE at SPINE stacks now 4",
        ("the place reached, minted in full -- `SPINE at ` and then that place's own name",)),
    "stageshout": (
        "THE ONE THING WE SAY THAT IS NOT OUR OWN WORDING: the value a stage ended on, said as a"
        " bare number where the stage sits. It is the resource a row paid, and it is the bench's"
        " only way to know a row still pays -- `222` took it out with the vocabulary and every"
        " bench check failed afterwards, not because nothing paid but because nothing said so",
        "SPINE 77",
        ("the value itself, with no wording in front of it",)),
    "loudprints": (
        "every word that asked to be said whatever the vocabulary says -- a build asking one"
        " question at one place. On here only so `stackcount` can say its number, which goes"
        " through this door; the other words that ask for it come along",
        "SPINE at SPINE stacks now 4",
        ("the word, minted in full -- `SPINE at ` and then the place's own name",)),
    "stackcount": (
        "how many stacks of the trait just granted the thing ACTUALLY carries, asked of the"
        " engine with no source filter -- so the base game's own applications count too, and"
        " it is the number a tooltip shows. Said before the grant and after it, and only where"
        " the after-number moved. `game/bench/_series.py <thing> <trait>` reads it per thing",
        "SPINE at SPINE stacks now 4",
        ("the engine's own count after the grant -- the lines just before it name the thing,"
         " the trait and the thing's uid, in that order",)),
    "userowsays": (
        "HOW FAR THE ROW-FILING GOT AT EACH OF THE THREE PLACES THE GAME FILES FROM --"
        " `logic.TraitsManager.apply`, `logic.faction.Developments.addDevelopment` and"
        " `logic.Upgrades.addAttributes`, that last one being the building-state route. Four"
        " words per place, each said ONCE A LAUNCH, so twelve lines in a whole run however long"
        " it runs. It is the only reading that tells a route which files NO ROW from a route"
        " whose row is EMPTY, and from anywhere else those two are one silence -- which is"
        " exactly where `W85` is stuck: a row authored on a building's own state never reaches"
        " that building, and nothing yet says whether it was ever filed at all",
        "SPINE filing at logic.Upgrades.addAttributes: a row was filed onto an application",
        ("which of the three filing places this is -- `logic.Upgrades.addAttributes` is the"
         " building-state one",
         "how far that place got, one of four: `a filing was reached`, `there is a map of"
         " filtered line-ups`, `this list has a line-up of ours`, `a row was filed onto an"
         " application`. The last is the only one that means a row landed, so the run is read"
         " by which of the four the building-state place stops at")),
    "settlednumberalways": (
        "the same line as `settlednumber`, but said on EVERY pass rather than only where the"
        " number moved -- which is the only way to tell a receiver the pass totalled nothing"
        " for from one it totalled the same thing for. Both are silent otherwise, and that one"
        " silence is what the region mark's flapping has never been readable through",
        "SPINE settled to 1 | Unit thing | Cielago Depression | OvN_ReachRegional",
        ("the number that trait holds on that receiver as this pass leaves it",
         "which road's walk is settling it",
         "WHICH receiver -- a region says its own name, anything else its id",
         "the trait")),
    "settlednumber": (
        "the number a settle just wrote, said ONLY where that number moved -- so every line is"
        " an event and a steady stack costs nothing",
        "SPINE settled to 2 | Zone thing | Carthag | OvN_ZoneMark",
        ("the number that trait now holds on that receiver; `0` is a mark taken back",
         "which road's walk wrote it",
         "WHICH receiver -- a region says its own name, anything else its id, and every"
         " trait of one receiver shares that id in the same pass",
         "the trait")),
    "respaid": (
        "what a resource row actually paid, as a number, said where the payment happened -- so a"
        " test can name the row that produced a total without a panel",
        "SPINE 77",
        ("the amount handed over, already turned round when the row takes away",)),
    "traypath": (
        "which way out of closing a tray a row took -- no list, nowhere to draw, nothing"
        " collected, or the draw itself. A run that pays and shows no number says which of the"
        " three it was, instead of leaving one silence to guess at",
        "SPINE a tray closed with nowhere to draw",
        ("the word itself is the answer; there are four and they are exclusive",)),
    "treatycount": (
        "what a payment's marked treaty count asked: whose treaties, how many the game said, of"
        " which kind. No line means the payment never reached the count, or reached it with"
        " no faction",
        "PerTreaty counted: Harkonnen holds 1 TradeAgreement",
        ("the faction asked", "how many the game counted", "the kind of treaty named")),
    "oncepath": (
        "which way out of the pay-once question a row took -- its payment closing to anything"
        " that arrives later, or a thing that arrived after it being turned away",
        "SPINE a thing that arrived after a one-time payment was turned away",
        ("the word itself is the answer; there are two and they are exclusive",)),
    "belongpath": (
        "which way out of the belonging question a set-reach row took -- it stands nowhere, the"
        " carrier wrote no place, the two places differ, or it belongs. A run showing none of"
        " the four means the row never reached the question, which is a different answer",
        "SPINE a set row belongs to this carrier",
        ("the word itself is the answer; there are four and they are exclusive",)),
    "respath": (
        "which way out of the paying act a resource row took -- entered, paid, or had nobody to"
        " pay. A run showing none of the three means the ROAD never reached the act at all,"
        " which is a different question from a payment being refused",
        "SPINE a resource row reached the paying act",
        ("the word itself is the answer; there are three and they are exclusive",)),
    "prodpath": (
        "which way out of the production act a row took -- entered, added the game's attribute,"
        " found it already right, replaced it, or had no faction. None of them means the road"
        " never reached the act",
        "SPINE a production row reached its act",
        ("the word itself is the answer; entered comes first, then one of the other four",)),
    "respaidto": (
        "WHICH faction a payment went to, as its own id -- the one thing every other resource"
        " reading leaves out, and the whole subject of a rider on a payment",
        "SPINE 3",
        ("the paid faction's id; the `ForTarget` row names the enemy's, since that word asks for"
         " what the road's own payee already is",)),
    "riderperfaction": (
        "the engine's own count of one trait on one receiver, asked ONCE AS EACH FACTION -- the"
        " only reading that can tell `ForMe` from `ForTarget` from `ForAll`, because all three"
        " land the same mark on the same thing and differ only in whose questions count it",
        "SPINE counts as 1 | faction 0 | 5312 | OvN_RiderForMe",
        ("how many stacks that faction's own questions see",
         "which faction was asked, as its place in the game's own list -- the control row"
         " `OvN_RiderForTarget` names which is which, since it must read 0 as the author and 1"
         " as the receiver's owner",
         "the receiver's id, so two things carrying one mark are told apart",
         "the trait, which is the row under test")),
    "grantwatch": (
        "THE ENGINE'S OWN STACK DECISION, said where the engine makes it rather than where we"
        " ask for it -- whose grant it was, how many stacks it wanted, whether the count went up"
        " or down, by how much, and whether anything blocked it. It is the only reading that"
        " speaks for the base game's own applications as well as ours, which is what tells a"
        " grant of ours that was refused from one that was never made. Costly: several words per"
        " grant, and a grant happens far more often than a row of ours is read",
        "SPINE grant ours",
        ("one word per decision, and they arrive in order: whose grant (`ours` or `the game's"
         " own`), then `SPINE wants <n>`, then `SPINE change up` or `down` or `none`, then"
         " `SPINE by <n>`; `SPINE blocked` or `SPINE conditions failed` replaces the last two",)),
    "reachwords": (
        "WHETHER A MODDER WROTE A REACH ON THE ROW AT ALL, said where the row is still whole --"
        " before the load has folded it away. Two words and no third: one for a column with"
        " something in it, one for a column left alone. A run with neither means the reach was"
        " never read, which is a different answer from a reach that was read and was empty",
        "SPINE at SPINE reach written",
        ("`SPINE reach written` for a column a modder filled, `SPINE reach blank` for one left"
         " alone; each is latched, so one of each per game is the whole reading",)),
    "columnrefusal": (
        "THE COLUMN GATE'S OWN REFUSAL, said once per row per pass: this row named an effect"
        " whose column the thing in hand does not carry, so the road ends here. Silent, that"
        " refusal cannot be told from a row the road never reached. ⛔ It buries the log --"
        " thousands of identical lines a minute -- so it goes on for one question and off again",
        "SPINE the `Zone` road refused a row whose effect names no column it carries",
        ("which road's walk refused it; the row itself is named by `saidrownames`, beside it",)),
    "roadnamesits": (
        "WHAT EACH ROAD IS WALKING, as that thing's own id and nothing else -- said once per"
        " holder per world so a run can be read by which things a road ever reached. It is a"
        " bare number on purpose: the id is what every other reading names a receiver by, so"
        " this is the line that turns those ids into things",
        "5312",
        ("the holder's own id, the same number the settling uses for that thing",)),
    "saidrownames": (
        "THE ROW ITSELF, named where the walk REACHES it -- which is not the road running, and"
        " no word marks that. It is the only reading that says which of a modder's rows the"
        " refusal or the settle one line away was about; every other one says only what happened",
        "SPINE reached",
        ("the tag, then the row's own id -- each row said once per pass, never once per tick",)),
    "regionpass": (
        "HOW FAR THE REGION PASS GOT, one latched word per way in: whether the pass ran, whether"
        " it found its region, whether it opened the store, and whether it read rows on each of"
        " the three roads. ANSWERED -- all four fire, and what is missing is a value on the rows"
        " themselves -- so it is silent until that question comes back in another shape",
        "SPINE the Zone road found its region",
        ("which road's pass this is, then how far it got; each is latched per road per game",)),
    "nothingtotalled": (
        "a receiver the pass REACHED while totalling nothing for it -- the one exit of the"
        " settling that leaves a written-down trait unwalked. Latched, so once per road per"
        " game however often it happens",
        "SPINE at a receiver on the Zone was reached with nothing totalled for it",
        ("the road whose walk reached it",)),
    "savedrow": (
        "WHICH WAY A ROW'S OWN COLUMNS WENT THROUGH A SAVE: written, too short to write, taken"
        " back by a restored row, missing from an older save, or never ours. Latched, so each"
        " way is said once a game; type it before the save, and it speaks at the load too",
        "SPINE at a restored row took its own saved columns",
        ("the word itself is the answer; the save says one or two, the load one of three",)),
    "gateown": (
        "A GAME GATE ASKING PAST OUR STACKS: said once a game, the first time any base-game"
        " pass asks whether a thing already holds a trait it is about to give",
        "SPINE at a game gate asked for any stack but ours",
        ("the word itself is the answer",)),
}


# the eight a dressed file already carries; the rest are ours alone
THE_PATCHERS_EIGHT = ("territory", "inspector", "hideerrors", "citypawn",
                      "occupationcolour", "harvester", "siegeactions", "siegespawn")


def on(name):
    """Is this one applied by this build?"""
    if name not in ON:
        raise RuntimeError("no such lifted change: %s" % name)
    return ON[name]


# a word per reading, per holder, per pass: ON only while a build header asks for it by name
PER_READING = ("stackcount",)


def wanted():
    """Every one this build applies, in the order they are written above."""
    return [n for n, yes in ON.items() if yes]


def refuse_double_apply(base_name):
    """Stop the build now if the base already carries something we are about to apply."""
    dressed = base_name != PRISTINE
    # only the patcher's eight are in a dressed base; anything else of ours is in no base
    doubled = [n for n in wanted() if n in THE_PATCHERS_EIGHT]
    if dressed and doubled:
        raise SystemExit(
            "REFUSED: building on the `%s` file, which already carries the patcher's eight,\n"
            "         while these are switched on: %s\n"
            "         Applying one twice is what the layout guards refuse. In onoff.py either\n"
            "         set FROM_PRISTINE = True, so we apply all eight ourselves, or switch\n"
            "         these back off and let the base keep carrying them."
            % (base_name, ", ".join(doubled)))
    if not dressed and len(wanted()) != len(ON):
        # nothing else puts these in, so off here means absent from the game -- say so plainly
        missing = [n for n in ON if n not in wanted()]
        print("  NOTE: on the untouched loader, %d of the 8 are switched off, so the game will\n"
              "        not have them at all: %s" % (len(missing), ", ".join(missing)))
