"""House Thorvald's engine changes for the Sworn Sword (see model_projects/thorvald/thorvald_sworn_sword/IMPLEMENTATION_SPEC_REPORT.md).

Apply with resource_trades (alphabetical order puts this tick last):
    python tool/quinn.py build --base <hlboot.dat> --ticks resource_trades,thorvald_sworn --out <file>
"""
import thsw_share, thsw_sale, thsw_oath, thsw_ops

CHANGES = (
    ("Council spawn gated by CHOAM shares: val's fraction is the threshold", thsw_share.install),
    ("trade spawn: a Convert line's pay entry may name a unit to recruit", thsw_sale.install),
    ("Entity_ControlLossImmune: no 'uncontrollable' and no taunt", thsw_oath.install),
    ("Renegade Takeover: a real Renegade_Drop on the clicked village", thsw_ops.install),
)
