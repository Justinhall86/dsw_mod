"""House Thorvald's engine changes for the Sworn Sword (see model_projects/thorvald/thorvald_sworn_sword/IMPLEMENTATION_SPEC_REPORT.md).

Apply with resource_trades (alphabetical order puts this tick last):
    python tool/quinn.py build --base <hlboot.dat> --ticks resource_trades,thorvald_sworn --out <file>
"""
import thsw_share, thsw_sale, thsw_oath, thsw_ops, thsw_drops
# thsw_terminal (the Recycling trade window on the Consignment Terminal) was dropped 2026-11-12: the user does not want the
# trade; the terminal is a plain bonus building now. The module stays in the folder for reference.

CHANGES = (
    ("Council spawn gated by CHOAM shares: val's fraction is the threshold", thsw_share.install),
    ("trade spawn: a Convert line's pay entry may name a unit to recruit", thsw_sale.install),
    ("Entity_ControlLossImmune: no 'uncontrollable' and no taunt", thsw_oath.install),
    ("operations kit (thEvent/thRaid/thDrop/thLift) and the raid row's drop-ship kind (thShip)", thsw_ops.install),
    ("timed drops: raid troops stay aboard until their ship lands (thArrive / thStagger)", thsw_drops.install),
)
