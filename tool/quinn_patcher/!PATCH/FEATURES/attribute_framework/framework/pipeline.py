#!/usr/bin/env python3
"""A road is a declared list of stages (gate, resolve, act); only an act changes the game."""
from copy import deepcopy
from tools.project import gv, guard
from tools.hlcode import (SLOTS_ON, argument_kind, assemble, enum_case, field_by_name, text_object,
                          function_named, kind_or_argument, minted_text, number, register_like,
                          returns_type, shared_function, template, written)
from framework.record import FIELDS, FROM_REGION, Source
from framework import board, boundary, columns, foreignwalk, forwhom, triggermatch, mark, ownermatch
from framework import (multmatch, ofthekind, parammatch, parsed, ridermatch,
                   passtray, sayonce, scopematch, scopeturn, tray)
from framework.acts import gain_devs, gain_heg, gain_res, gain_res_prod, gain_ttrait_stacks
from framework.acts import complete_quest, fail_quest, gain_dev_days, spawn_tunits, start_quest
from framework.acts import raise_alert
from framework.effectdata import CARRIES

# the three kinds, and what each may do is the whole of the contract
KINDS = ("GATE", "RESOLVE", "ACT")
# the effect's own row (which way round, what part of the target, who it credits)
EFFECT = "effect"
# `source` is read a piece at a time: `.row` the id, `.place`, and the game's `.application`
guard("notes" in FIELDS, "the record has no `notes`, and this list is taken from its fields")
# what S3 made of the id: which scope it named, as that scope's own number
NAME = "name"
SCOPE_IS = "%s.%s" % (NAME, scopematch.NAMED)
# and WHO may accept it, which the name carries in the same way and the gate below reads
OWNER_IS = "%s.%s" % (NAME, ownermatch.NAMED)
# and which column a MARKED scope narrows by, kept under the same name as the scope itself
SCOPE_AT_COLUMN, SCOPE_TURNED = (NAME + "." + p for p in (scopematch.AT_COLUMN, scopeturn.TURNED))
MADE_OF = {"source": Source.__slots__,
           # the row's columns: the effect's, a marked scope's, a narrowing's, a parameter's, reach
           "columns": (columns.NAMED,) + tuple(part.split(".", 1)[1] for part in (
               columns.PART_FOR_SCOPE, columns.PART_FOR_NARROWING, columns.PART_FOR_PARAMETER,
               columns.PART_FOR_COUNT, columns.PART_FOR_MEMBERS, columns.REACH_NAMED)),
           # and WHICH TRIGGER and WHICH RIDER the name carried, or nothing
           NAME: (scopematch.NAMED, scopematch.AT_COLUMN, scopeturn.TURNED, triggermatch.NAMED,
                  ownermatch.NAMED, ridermatch.NAMED, parsed.NUMBERS,
                  # and the parameter, which says with what, and where it said it
                  parammatch.NAMED, parammatch.AT_COLUMN),
           # and what each multiplier word counts on the holder, a part per word
           multmatch.COUNTED: multmatch.counted_words(),
           EFFECT: tuple(name for name, _, _ in CARRIES) + ("column",)}


def in_pieces(whole):
    # anything made of named parts is read a part at a time; anything else is read whole
    return (["%s.%s" % (whole, part) for part in MADE_OF[whole]]
            if whole in MADE_OF else [whole])


READABLE = tuple(piece
                 for whole in [f for f in FIELDS if f != "notes"] + [EFFECT]
                 for piece in in_pieces(whole))
# what the road's exit is called, so a gate and the assembler agree on the name
EXIT = "REFUSED"


class Place:
    """Where one stage writes itself: only the parts it declared, and what it may do to the file."""

    __slots__ = ("name", "row", "notes", "note", "kept", "store", "refused", "_hands", "looked")

    def __init__(self, name, row, notes, note, kept, store, refused, hands):
        # what the stage being written is called, which is what makes its places its own
        self.name = name
        self.row = row
        self.notes = notes
        self.note = note
        # what this stage's OPENING left, once, before any row
        self.kept = kept
        self.store = store
        self.refused = refused
        # the five things a stage may do to the file, as closures: the file itself is not here
        self._hands = hands
        self.looked = {"loads": [], "names": {}, "renamed": {}}

    def here(self, place):
        """A place of this stage's OWN, named after it."""
        return "%s %s" % (self.name, place)

    def op(self, name, **operands):
        """One instruction of that kind, copied from the file's own and filled in with ours."""
        return self._hands["op"](name, **operands)

    def scratch_like(self, register):
        """A register of the same kind as one this stage already has, added to the function."""
        return self._hands["scratch_like"](register)

    def scratch_return(self, name):
        """A register of the kind a named function hands BACK -- what an opening keeps."""
        return self._hands["scratch_return"](name)

    def scratch_of(self, kind):
        """A register of the kind that PRINTS as that name. Only a class is named uniquely."""
        return self._hands["scratch_of"](kind)

    def scratch_arg(self, name, which=0):
        """A register of the kind a named function's `which`-th one is (how to get a primitive)."""
        return self._hands["scratch_arg"](name, which)

    def named_function(self, name):
        """Which function in this file is called that. A stage asks the game its questions."""
        return self._hands["named_function"](name)

    def slot(self, name):
        """A place this build made for one named thing of ours, to read or to write."""
        return self._hands["slot"](name)

    def kind_of(self, register):
        """What kind a place it was handed holds -- so a stage can CHECK what it is given."""
        return self._hands["kind_of"](register)

    def enum_case(self, enum, case):
        """Which case of one of the GAME's own enums is called that. Never its position."""
        return self._hands["enum_case"](enum, case)

    def narrowed(self, register, like, goes_to=None):
        """That place as the kind `like` is; `goes_to` is the exit. ⚠ A failed cast RAISES."""
        if self.kind_of(register) == self.kind_of(like):
            return register, []
        # ⛔⛔ THROUGH THE HAND THAT ASKS, NEVER A BARE `SafeCast` (100,000+ `Can't cast` a run)
        return like, self._hands["narrow"](register, like, goes_to or self.refused)

    def field_of(self, kind, field):
        """Where one named field sits on one named kind, and a place to read it into."""
        return self._hands["field_of"](kind, field)

    def show(self, what, how_much, drawn_to=None):
        """One payment into this event's tray, drawn to `drawn_to` at once when one is named."""
        return self._hands["show"](what, how_much, drawn_to)

    def said(self, word, build):
        """One reading's words, gated on that word's own place and on no door at all."""
        return self._hands["said"](word, build)

    def said_now(self, name, once=False):
        """One line in the log, said here whatever the quiet switch says; `once`: once a game."""
        return self._hands["said_now"](name, once)

    def number(self, value):
        """Where the file keeps that plain number, put there if it is not there yet."""
        return self._hands["number"](value)

    def text_object(self, word):
        """The real text object this build minted for that word, to hand to the game."""
        return self._hands["text_object"](word)

    def the_one_global(self, class_name):
        """Where the file keeps the one global holding that class, found by its kind."""
        return self._hands["the_one_global"](class_name)

    def says(self, register):
        """Say what that place HOLDS, so a refusal can name the ROW it turned away."""
        return self._hands["says"](register)

    def __repr__(self):
        return "Place(reads %s, notes %s)" % (sorted(self.row), sorted(self.notes))


class Stage:
    """One step of a road: its kind, what it reads, what it needs, and the store it owns."""

    __slots__ = ("name", "kind", "body", "reads", "needs", "store", "mark",
                 "holds", "opening", "owed")

    def __init__(self, name, kind, body=None, reads=(), needs=(), store=None, mark=None,
                 holds=None, opening=None, owed=None):
        guard(kind in KINDS, "`%s` is a %s, and the kinds are %s" % (name, kind, KINDS))
        # a stage is either written or owed by something that has not landed, and never both
        guard((body is None) != (owed is None),
              "`%s` must have a body or name what it waits on, and never both" % name)
        guard(name not in needs,
              "`%s` needs its own note, and a note is left for a LATER stage" % name)
        for part in reads:
            guard(part in READABLE,
                  "`%s` reads `%s`, and a row has %s" % (name, part, ", ".join(READABLE)))
        # a note has to be of some kind before the road can make a register to hold it
        guard((holds is not None) == (kind == "RESOLVE"),
              "`%s` is a %s: only a RESOLVE leaves a note, and it must name what kind"
              % (name, kind))
        # and that kind is NAMED, never numbered: the two loaders number kinds differently
        guard(holds is None or isinstance(holds, str),
              "`%s` says its note holds %r; a kind is named, and a number would be one loader's"
              % (name, holds))
        guard(mark is None or store is not None, "`%s` marks a store it does not own" % name)
        self.name = name
        self.kind = kind
        self.body = body
        self.reads = tuple(reads)
        self.needs = tuple(needs)
        self.store = store
        self.mark = mark
        self.holds = holds
        self.opening = opening
        self.owed = owed

    @property
    def leaves(self):
        # only a RESOLVE leaves a note, and the note is called what the stage is called
        return self.name if self.kind == "RESOLVE" else None

    def __repr__(self):
        return "%s(%s)" % (self.name, self.kind)


def hands_for(bc, fn):
    """Everything a stage may do to the file, as closures over one function (the siege uses it)."""
    # closures, so neither the file nor the function is ever reachable from a Place itself
    def a_register_of(kind):
        fn.regs.append(deepcopy(register_like(bc, kind)))
        fn.nregs.value = len(fn.regs)
        return len(fn.regs) - 1

    def named_slot(name):
        slots = getattr(bc, SLOTS_ON, None) or {}
        guard(name in slots, "there is no slot called `%s` in this file" % name)
        return slots[name]

    def minted(word):
        found = minted_text(bc, word)
        guard(found is not None, "`%s` has not been minted into this file" % word)
        return found

    return {"op": lambda name, **operands: written(template(bc, name), **operands),
            "scratch_like": lambda register: a_register_of(gv(list(fn.regs)[register])),
            "scratch_of": lambda kind: a_register_of(kind_or_argument(bc, kind)),
            "scratch_arg": lambda name, which: a_register_of(argument_kind(bc, name, which)),
            "scratch_return": lambda name: a_register_of(
                returns_type(function_named(bc, name), name)),
            "named_function": lambda name: gv(function_named(bc, name).findex),
            "shared": lambda *how: shared_function(bc, fn, hands_for, *how),
            "slot": named_slot, "said": lambda w, b: board.said(bc, fn, w, b),
            "show": lambda what, how_much, drawn_to: tray.emit_push(bc, fn, what, how_much) + (
                [] if drawn_to is None else passtray.emit_draw_now(bc, fn, drawn_to)),
            "said_now": lambda name, once=False: sayonce.emit_word_now(bc, fn, name, once=once),
            "kind_of": lambda register: gv(list(fn.regs)[register]),
            # ⛔ NARROWING IS NOT A CAST: `framework/ofthekind.py` asks the game instead
            "narrow": lambda thing, into, goes_to: ofthekind.emit(
                bc, fn, lambda name, **operands: written(template(bc, name), **operands),
                thing, into, gv(list(fn.regs)[into]), goes_to),
            # a case of one of the GAME's own enums, by its name, never its number
            "enum_case": lambda enum, case: enum_case(bc, enum, case),
            # `kind` is a NAME when a class has one, and a REGISTER for a virtual
            "field_of": lambda kind, field: (
                lambda found: (found[0], a_register_of(found[1])))(
                    field_by_name(bc,
                                  gv(list(fn.regs)[kind]) if isinstance(kind, int)
                                  else kind_or_argument(bc, kind),
                                  field, "the `%s` a stage asked about" % kind)),
            "number": lambda value: number(bc, value),
            # the ONE global holding a named class: what the game keeps statically
            "the_one_global": lambda class_name: foreignwalk.the_global_of(bc, class_name),
            # say what a place HOLDS -- the same emitter the road uses to name a row
            "says": lambda register: sayonce.emit_always(bc, fn, register),
            "text_object": minted, "bc": lambda: bc, "fn": lambda: fn}


class Pipeline:
    """A named list of stages, checked as it is baked and written as one block of instructions."""

    def __init__(self, name, stages, road=None):
        self.name = name
        # WHICH SCOPE THIS ROAD IS, apart from what it is CALLED (a case names its own road)
        self.road = road or name
        self.stages = tuple(stages)
        self.stores = {}
        # what each stage's opening filled, once, before any row
        self.kept = {}
        self._one_name_each()
        self._one_writer_each()
        self._nothing_ordered_by_guesswork()

    def _one_name_each(self):
        # a note is named after its stage, so two stages of one name would name one note
        seen = []
        for stage in self.stages:
            guard(stage.name not in seen,
                  "`%s` has two stages called `%s`" % (self.name, stage.name))
            seen.append(stage.name)

    def _one_writer_each(self):
        # RULE 4: a store has exactly one writer, and the build refuses the second
        for stage in self.stages:
            if stage.store is None:
                continue
            guard(stage.store not in self.stores,
                  "`%s` and `%s` both write the store `%s`, and a store has one writer"
                  % (self.stores.get(stage.store), stage.name, stage.store))
            self.stores[stage.store] = stage.name

    def _nothing_ordered_by_guesswork(self):
        # RULE 2: a note a stage needs must be left by a stage that runs BEFORE it
        left = []
        for stage in self.stages:
            for need in stage.needs:
                guard(need in left,
                      "`%s` needs the note `%s`, and no stage before it leaves one%s"
                      % (stage.name, need, self._nearly(need)))
            if stage.leaves:
                left.append(stage.leaves)

    def _nearly(self, need):
        # the likely reason, said plainly: the stage is the wrong kind, or it runs too late
        named = next((s for s in self.stages if s.name == need), None)
        if named is None:
            return ""
        if named.kind != "RESOLVE":
            return " -- `%s` leaves none: a %s; only a RESOLVE leaves one" % (need, named.kind)
        return " -- `%s` leaves it, but it runs later" % need

    @property
    def owed(self):
        # the stages still waiting on what they need: any at all and this cannot be written
        return tuple(s for s in self.stages if s.body is None)

    def opening(self, bc, fn):
        """What the road does ONCE, before any row: each opening's instructions and its register."""
        self.refuse_while_owed()
        hands = self._hands(bc, fn)
        block = []
        for stage in self.stages:
            if stage.opening is None:
                continue
            wrote, kept = stage.opening(self._place(stage, {}, {}, hands, opening=True))
            self.kept[stage.name] = kept
            block += list(wrote)
        return assemble(block)

    def refuse_while_owed(self):
        guard(not self.owed, "`%s` cannot be written yet: %s" % (self.name, "; ".join(
            "`%s` waits on %s" % (s.name, s.owed) for s in self.owed)))

    def emit(self, bc, fn, row, saying=False, shouting=None, only_while=None,
             once_past_the_gates=(), before_leaving=()):
        """The road's per-row instructions for `fn`, with one exit every gate jumps to."""
        self.refuse_while_owed()
        # a stage with an opening reads back what it kept, so the opening has to have run
        for stage in self.stages:
            guard(stage.opening is None or stage.name in self.kept,
                  "`%s` opens the road, and the opening has not been written yet"
                  % stage.name)
        hands = self._hands(bc, fn)
        notes = self._registers_for_notes(bc, fn)
        # `saying`: each stage says REACHED and PASSED once; `only_while` makes that once per row
        shout, value = shouting if shouting else (None, None)
        # one place per skip, because two blocks naming one place is a build-time refusal
        bounded = []

        def say(name):
            if not saying:
                return []
            # SAID EVEN WITH THE VOCABULARY OFF, LATCHED, naming the road; `only_while` applies
            said = sayonce.emit(bc, fn, "%s, %s" % (self.name, name), even_when_quiet=True)
            if only_while is None or not said:
                return said
            past = "%s: not a row this path is about, %d" % (self.name, len(bounded))
            bounded.append(1)
            return [(written(template(bc, "JFalse"), cond=only_while), past)] \
                + said + [past + ":", written(template(bc, "Label"))]

        # ⛔ NO PER-GATE TRAIT WORD: at every gate of every row it is 601,308 lines a minute
        def the_trait_here(stage):
            return []

        blocks = [the_trait_here(stage)
                  + say(stage.name)
                  + (sayonce.emit_always(bc, fn, value) if stage.name == shout else [])
                  + forwhom.written_for(self, bc, fn, stage, row, notes, hands)
                  + say("past " + stage.name)
                  for stage in self.stages]
        guard(shout is None or shout in [s.name for s in self.stages],
              "`%s` is not a stage of this road, so nothing would ever be said" % shout)
        # the caller's own work, at the one point where a row has passed every gate
        seam = self.past_the_gates()
        blocks = blocks[:seam] + [list(once_past_the_gates)] + blocks[seam:]
        # RULE 1: every mark goes after the last act, so a refusal spends no application
        blocks += [stage.mark(self._place(stage, row, notes, hands, marking=True))
                   for stage in self.stages if stage.mark is not None]
        # and past the marks, still in front of the exit a refusal jumps to
        blocks += [list(before_leaving)]
        return assemble([op for block in blocks for op in block] + [EXIT + ":"])

    def past_the_gates(self):
        """How many stages a row passes before it surely acts; refused if a gate follows an act."""
        kinds = [stage.kind for stage in self.stages]
        gates = [i for i, kind in enumerate(kinds) if kind == "GATE"]
        acts = [i for i, kind in enumerate(kinds) if kind == "ACT"]
        last_gate = max(gates) if gates else -1
        first_act = min(acts) if acts else len(kinds)
        guard(last_gate < first_act,
              "`%s` gates a row after it has already acted, so there is no point past the gates"
              % self.name)
        return last_gate + 1

    def _hands(self, bc, fn):
        # the hands are a function's, not a road's, so a splice can build a Place too
        return hands_for(bc, fn)

    def _registers_for_notes(self, bc, fn):
        # one register per note, of the kind the stage that leaves it declared
        notes = {}
        for stage in self.stages:
            if not stage.leaves:
                continue
            # the kind the stage NAMED, looked up in the file we are writing into
            fn.regs.append(deepcopy(register_like(bc, kind_or_argument(bc, stage.holds))))
            fn.nregs.value = len(fn.regs)
            notes[stage.leaves] = len(fn.regs) - 1
        return notes

    def _place(self, stage, row, notes, hands, marking=False, opening=False):
        # RULE 3: a stage is handed what it declared; an OPENING runs before any row exists
        for part in (() if opening else stage.reads):
            guard(part in row,
                  "`%s` reads `%s`, and the road was handed no register for it"
                  % (stage.name, part))
        # a MARK only records: it runs after the last act, so it may neither refuse nor note
        return Place(name=stage.name,
                     row={} if opening else {p: row[p] for p in stage.reads},
                     kept=None if opening else self.kept.get(stage.name),
                     notes={n: notes[n] for n in stage.needs},
                     note=None if marking else notes.get(stage.leaves),
                     store=stage.store,
                     refused=(EXIT if stage.kind == "GATE" and not marking and not opening
                              else None), hands=hands)

    def __repr__(self):
        return "Pipeline(%s, %d stage(s))" % (self.name, len(self.stages))


OWED = mark.SLOT  # the one store in the spine, named where it is made, not a second time here
LATER_ACTS = (spawn_tunits, gain_res_prod, gain_heg, gain_devs, gain_dev_days, start_quest,
              complete_quest, fail_quest, raise_alert)


# THE SPINE'S OWN ROAD: every gate and effect is one more line in this list
def stage_reads(named, scope=None):
    """What one stage of the spine's road says it reads, by that stage's own name."""
    for stage in spine_stages(scope or scopematch.first_scope()):
        if stage.name == named:
            return tuple(stage.reads)
    guard(False, "no stage of the road is called `%s`" % named)


def spine_stages(scope):
    """The spine's stages for the driver of ONE scope; only the scope gate differs per scope."""
    return (
        # opens by asking where the sentinel sits, once; compares each row against that
        Stage(boundary.STAGE, "GATE", reads=("source.row",),
              opening=boundary.open_the_road, body=boundary.emit_gate),
        # the row's scope against every word this road answers for, a MARKED one by its column
        Stage(scopematch.GATE, "GATE",
              # AND THE REACH: a row a reach re-hosted is not this road's to refuse
              reads=(SCOPE_IS, SCOPE_AT_COLUMN, columns.PART_FOR_SCOPE, scopematch.HOLDER,
                     columns.REACH_NAMED, foreignwalk.FROM_FOREIGN, SCOPE_TURNED,
                     foreignwalk.WHOSE_RULE, scopematch.HELD_REGION,
                     scopematch.TICKED, scopematch.PAYEE, columns.PART_FOR_COUNT,
                     parsed.NUMBERS_PART,
                     columns.PART_FOR_NARROWING, "value") + mark.LOSING_READS + foreignwalk.OPENED,
              body=scopematch.gate_for(scope, SCOPE_IS, marked_at=SCOPE_AT_COLUMN,
                                       marked_names=columns.PART_FOR_SCOPE,
                                       reach_part=columns.REACH_NAMED,
                                       foreign_part=foreignwalk.FROM_FOREIGN,
                                       whose_part=foreignwalk.WHOSE_RULE, turned_at=SCOPE_TURNED)),
        # AND WHO MAY ACCEPT IT: two factions, so its own stage past the scope
        Stage(ownermatch.GATE, "GATE",
              # AND WHETHER THIS IS THE REGION'S PASS, which an unworded row skips
              reads=(OWNER_IS, scopematch.HOLDER, scopematch.PAYEE, foreignwalk.FROM_FOREIGN,
                     foreignwalk.WHOSE_RULE, FROM_REGION),
              body=ownermatch.gate_for(OWNER_IS, scopematch.HOLDER, foreignwalk.WHOSE_RULE,
                                       foreignwalk.FROM_FOREIGN, road=scope,
                                       region_part=FROM_REGION)),
        # before the one-shot, so a row with nothing to act on spends no application
        Stage("is the column this effect names there", "GATE", reads=columns.GATE_READS,
              body=columns.gate_for(road=scope)),
        # THE TRIGGER: has the row's own trigger happened and not yet been paid?
        Stage(mark.STAGE, "GATE", reads=mark.GATE_READS,
              store=OWED, opening=mark.emit_ready, body=mark.emit_gate, mark=mark.emit_spend),
        forwhom.factor_stage(Stage),
        *(forwhom.stage_of(act, Stage) for act in (gain_res, gain_ttrait_stacks) + LATER_ACTS),
    )


def spine_road(scope):
    """One scope's road, baked -- and baking it is what runs the four rules over it."""
    return Pipeline("the spine in `%s`" % scope, spine_stages(scope), road=scope)


def roads():
    """One road per DRIVER; a scope with no site has no driver and so no road."""
    from framework.driver import scopes_with_drivers
    return {scope: spine_road(scope) for scope in scopes_with_drivers()}


def a_road():
    """Any one road, for a caller about the STAGES rather than about the scope."""
    every = roads()
    guard(every, "no scope names a site, so there is no road at all")
    return every[min(every)]


def install(bc):
    """Bake a road per driver so the four rules are checked; `framework/storewalk.py` splices."""
    every = roads()
    one = a_road()
    owed = sorted({s.name for road in every.values() for s in road.owed})
    return ("PIPELINE: %d road(s), one per scope that has a driver (%s) -- %d stage(s) of %d "
            "kinds and %d store each, and %s"
            % (len(every), ", ".join("`%s`" % s for s in sorted(every)), len(one.stages),
               len(KINDS), len(one.stores),
               "none of them owed" if not owed else "%d owed: %s" % (len(owed),
                                                                    ", ".join(owed))))
