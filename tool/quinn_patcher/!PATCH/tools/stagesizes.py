#!/usr/bin/env python3
"""Each road's instruction count per stage, counted while the road is written."""
import json
from collections import defaultdict

# road name -> stage name -> instructions that stage wrote, its mark included
SIZES = defaultdict(lambda: defaultdict(int))
# each stage writer already counting, so a road written twice is not wrapped twice
WRAPPED = set()
# the counts at the end of the features, before any case writes a road of its own
FROZEN = {}


def _counted(road, stage, part):
    # the stage's own writer, wrapped to count what it hands back; labels are text, not ops
    write = getattr(stage, part)

    def counting(place):
        ops = list(write(place))
        SIZES[road][stage.name] += sum(1 for op in ops if not isinstance(op, str))
        return ops
    return counting


def watch():
    """Wrap every road's emit so each stage's writers are counted while it runs."""
    from framework.pipeline import Pipeline
    plain = Pipeline.emit

    def emit(self, *args, **kwargs):
        for stage in self.stages:
            for part in ("body", "mark"):
                if getattr(stage, part) is not None and (id(stage), part) not in WRAPPED:
                    WRAPPED.add((id(stage), part))
                    setattr(stage, part, _counted(self.name, stage, part))
        return plain(self, *args, **kwargs)
    Pipeline.emit = emit


def freeze():
    """The counts as the features left them: a case writing the roads again would count twice."""
    FROZEN.update({road: dict(stages) for road, stages in SIZES.items()})


def write(path):
    """File the counts by road, frozen before the cases; returns one line for the report."""
    kept = FROZEN or {road: dict(stages) for road, stages in SIZES.items()}
    json.dump(kept, open(path, "w", encoding="utf-8"), indent=1)
    total = sum(sum(stages.values()) for stages in kept.values())
    return "STAGES: %d road(s), %d instruction(s) by stage" % (len(SIZES), total)
