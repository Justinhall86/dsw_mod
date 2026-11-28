"""Convert the HMDs that have no ready-made true FBX in the repo (Thorvald frigate, Altar fabric) into FRIG_WORK/fbx.
Read-only on game and mod files.   FRIG_WORK=<scratch> python 00_prepare.py
"""
import os, sys
R = '/home/user/dsw_mod'
W = os.environ.get('FRIG_WORK', '/tmp/frigate_work'); os.makedirs(W + '/fbx', exist_ok=True)
sys.path.insert(0, R + '/.claude/skills/dsw-vehicle-preview/scripts')
import build_previews as bp
V = R + '/model_inputs/Vehicle/'
for src, dst in [(R + '/model_projects/thorvald/thorvald_frigate/06_game_ready/VehMOD/Thorvald_Frigate/Thorvald_Frigate.hmd', 'Thorvald_real.fbx'),
                 (V + 'Fremen/Altar/Altar_AllFabric.fbx', 'Altar_AllFabric_real.fbx')]:
    bp.convert_model(src, os.path.join(W, 'fbx', dst)); print('converted', dst)
