"""Per-ship numbers for the README table, read straight from the shipped HMDs, textures and data.cdb (read-only).
    size = [width X, length Y (nose -Y), height Z] in mesh units, from 06_measure.py
    python 05_stats.py <measure.json from 06_measure.py> <out stats.json>
"""
import json, os, struct, sys
R = '/home/user/dsw_mod'
sys.path.insert(0, R + '/HMD_toolkit/HMD_toolkit/Models')
import hmd_reader as H
V = R + '/model_inputs/Vehicle/'
TH = R + '/model_projects/thorvald/thorvald_frigate/06_game_ready/VehMOD/Thorvald_Frigate/'
HMDS = {'Kraken': [V + 'Atreide/Kraken/Kraken.fbx'], 'Overlord': [V + 'Harkonnen/Overlord/Overlord.fbx'],
        'Chronos': [V + 'Imperial/Chronos/Chronos.fbx'], 'Wraith': [V + 'Smuggler/Wraith/Wraith.fbx'],
        'Altar': [V + 'Fremen/Altar/Altar.fbx', V + 'Fremen/Altar/Altar_AllFabric.fbx'],
        'Monument': [V + 'Ecaz/Monument/Monument.fbx'], 'FolderRelay': [V + 'Vernius/FolderRelay/FolderRelay.fbx'],
        'Thorvald': [TH + 'Thorvald_Frigate.hmd']}
EXTRA_TEX = {'FolderRelay': ['Vehicle/Vernius/FolderRelay/FolderRelay_Emissive.png']}
def rows(p):
    return {m['id']: m for s in json.load(open(p))['sheets'] if s['name'] == 'model' for m in s['lines']}
VAN = R + '/mod_files/data_vanilla_2026-11-09.cdb'   # newest vanilla extract in the repo
cdb = rows(VAN)
cdb['Th_Frigate'] = rows(R + '/mod_files/data.cdb')['Th_Frigate']   # the mod row, from the working cdb
ROW = {'Kraken': 'A_Frigate', 'Overlord': 'H_Frigate', 'Chronos': 'C_Frigate', 'Wraith': 'S_Frigate', 'Altar': 'F_Frigate',
       'Monument': 'E_Frigate', 'FolderRelay': 'V_Frigate', 'Thorvald': 'Th_Frigate'}


def tex_info(gpath):
    p = TH + os.path.basename(gpath) if gpath.startswith('VehMOD/') else R + '/model_inputs/' + gpath
    b = open(p, 'rb').read(128)
    if b[:4] == b'DDS ':
        h, w = struct.unpack('<II', b[12:20]); return f"{w}", 'DDS ' + b[84:88].decode()
    from PIL import Image
    im = Image.open(p); return f"{im.size[0]}", 'PNG'


meas = json.load(open(sys.argv[1]))
out = {}
for k, files in HMDS.items():
    tris, mats, texs, models = 0, [], {}, []
    for f in files:
        d = H.load(f)
        models += [m.name for m in d.models]
        for g in d.geometries:
            tris += sum(g.indexCounts) // 3 if hasattr(g, 'indexCounts') else g.indexCount // 3
        for m in d.materials:
            if m.name not in mats:
                mats.append(m.name)
            for t in (m.diffuseTexture, m.specularTexture, m.normalMap):
                texs[t] = tex_info(t)
    for t in EXTRA_TEX.get(k, []):
        texs[t] = tex_info(t)
    row = cdb[ROW[k]]
    out[k] = dict(model_row=ROW[k], hmd_models=models, mesh=row['mesh'][0]['path'], rig=row['rigName'], inherit=row['inherit'],
                  cdb_scale=row['scale'], radius=row['radius'], height=row['height'], tris=tris, materials=mats,
                  textures={t: v for t, v in texs.items()}, size_raw=meas[k]['size'])
json.dump(out, open(sys.argv[2], 'w'), indent=1)
for k, v in out.items():
    print(k, v['tris'], len(v['materials']), len(v['textures']), v['size_raw'], v['cdb_scale'])
