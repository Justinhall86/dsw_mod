"""Shared ship list, loader and game-style material wiring for the frigate reference renders (runs inside bpy).

Every ship, the Thorvald one included, is loaded from the HMD the game ships (converted to FBX by
00_prepare.py) and textured from the texture paths recorded in the HMD material, DDS converted to PNG.
`yaw` turns each ship so its nose points -Y (screen-down in the top view), judged by eye.
"""
import os, math
import bpy
from mathutils import Vector, Matrix

R = '/home/user/dsw_mod'
V = R + '/model_inputs/Vehicle/'
S = os.environ.get('FRIG_WORK', '/tmp/frigate_work')   # converted FBX + PNG textures (scratch)
TH = R + '/model_projects/thorvald/thorvald_frigate/06_game_ready/VehMOD/Thorvald_Frigate/'

# name, display, faction, parts [(fbx, prefab rotZ deg)], tex dir (albedo/mgao/normal/emissive), cdb scale, mesh path
SHIPS = [
    dict(key='Kraken', name='Kraken', faction='Atreides', unit='A_Frigate', cdb_scale=1.6,
         mesh='Vehicle/Atreide/Kraken/Prefab_Kraken.prefab',
         parts=[(V + 'Atreide/Kraken/preview_textures/Kraken_real.fbx', 0)], tex=V + 'Atreide/Kraken/preview_textures/'),
    dict(key='Overlord', name='Overlord', faction='Harkonnen', unit='H_Frigate', cdb_scale=1.2,
         mesh='Vehicle/Harkonnen/Overlord/Overlord.fbx',
         parts=[(V + 'Harkonnen/Overlord/preview_textures/Overlord_real.fbx', 0)], tex=V + 'Harkonnen/Overlord/preview_textures/'),
    dict(key='Chronos', name='Cronos', faction='Corrino', unit='C_Frigate', cdb_scale=1.7,
         mesh='Vehicle/Imperial/Chronos/Prefab_Chronos.prefab',
         parts=[(V + 'Imperial/Chronos/preview_textures/Chronos_real.fbx', 0)], tex=V + 'Imperial/Chronos/preview_textures/'),
    dict(key='Wraith', name='Wraith', faction='Smugglers', unit='S_Frigate', cdb_scale=1.2,
         mesh='Vehicle/Smuggler/Wraith/Prefab_Wraith.prefab',
         parts=[(V + 'Smuggler/Wraith/preview_textures/Wraith_real.fbx', 0)], tex=V + 'Smuggler/Wraith/preview_textures/'),
    dict(key='Altar', yaw=90, name='Altar', faction='Fremen', unit='F_Frigate', cdb_scale=1.5,
         mesh='Vehicle/Fremen/Altar/Prefab_Altar.prefab',
         parts=[(V + 'Fremen/Altar/preview_textures/Altar_real.fbx', 90), (S + '/fbx/Altar_AllFabric_real.fbx', 90)],
         tex=V + 'Fremen/Altar/preview_textures/'),
    dict(key='Monument', name='Monument', faction='Ecaz', unit='E_Frigate', cdb_scale=1.2,
         mesh='Vehicle/Ecaz/Monument/Prefab_Monument.prefab',
         parts=[(V + 'Ecaz/Monument/preview_textures/Monument_real.fbx', 0)], tex=V + 'Ecaz/Monument/preview_textures/'),
    dict(key='FolderRelay', name='Folder Relay', faction='Vernius', unit='V_Frigate', cdb_scale=1.0,
         mesh='Vehicle/Vernius/FolderRelay/Prefab_FolderRelay.prefab',
         parts=[(V + 'Vernius/FolderRelay/preview_textures/FolderRelay_real.fbx', 0)], tex=V + 'Vernius/FolderRelay/preview_textures/'),
    dict(key='Thorvald', yaw=-90, name='Thorvald cruiser (current)', faction='Thorvald (mod)', unit='TH_Frigate', cdb_scale=1.2,
         mesh='VehMOD/Thorvald_Frigate/Prefab_Thorvald_Frigate.prefab',
         parts=[(S + '/fbx/Thorvald_real.fbx', 0)], tex=None),
]
JUNK = {'Cube', 'Camera', 'Light', 'Lamp'}


def reset():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def bake(objs):
    """Bake armature-evaluated geometry into plain world-space meshes; delete everything else."""
    dg = bpy.context.evaluated_depsgraph_get()
    out = []
    for o in objs:
        if o.type != 'MESH' or o.name.split('.')[0] in JUNK:
            continue
        ev = o.evaluated_get(dg)
        me = bpy.data.meshes.new_from_object(ev, preserve_all_data_layers=True, depsgraph=dg)
        me.transform(o.matrix_world)
        n = bpy.data.objects.new(o.name + '_baked', me)
        bpy.context.scene.collection.objects.link(n)
        out.append(n)
    for o in objs:
        bpy.data.objects.remove(o, do_unlink=True)
    return out


def load_ship(ship):
    meshes = []
    for path, rotz in ship['parts']:
        pre = set(bpy.data.objects)
        bpy.ops.import_scene.fbx(filepath=path)
        new = [o for o in bpy.data.objects if o not in pre]
        baked = bake(new)
        if rotz:
            for o in baked:
                o.data.transform(Matrix.Rotation(math.radians(rotz), 4, 'Z'))
        meshes += baked
    if ship.get('yaw'):
        for o in meshes:
            o.data.transform(Matrix.Rotation(math.radians(ship['yaw']), 4, 'Z'))
    return meshes


def bounds(objs):
    pts = [v.co for o in objs for v in o.data.vertices]
    mn = Vector([min(p[i] for p in pts) for i in range(3)])
    mx = Vector([max(p[i] for p in pts) for i in range(3)])
    return mn, mx


def tris(objs):
    return sum(sum(len(p.vertices) - 2 for p in o.data.polygons) for o in objs)


# ---------------------------------------------------------------- materials, straight from the HMD material records
import sys as _sys
_sys.path.insert(0, R + '/HMD_toolkit/HMD_toolkit/Models')
TEXC = S + '/tex'


def game_tex(gpath):
    """game res path -> real PNG in the scratchpad (converted from the shipped DDS)."""
    from PIL import Image
    if gpath.startswith('VehMOD/Thorvald_Frigate/'):
        src = TH + os.path.basename(gpath)
    else:
        src = R + '/model_inputs/' + gpath
    os.makedirs(TEXC, exist_ok=True)
    dst = os.path.join(TEXC, gpath.replace('/', '__'))
    if not os.path.exists(dst):
        Image.open(src).save(dst)
    return dst


def hmd_materials(ship):
    import hmd_reader as H
    out = {}
    for path, _ in ship['parts']:
        src = {'Altar_AllFabric_real.fbx': V + 'Fremen/Altar/Altar_AllFabric.fbx',
               'Thorvald_real.fbx': TH + 'Thorvald_Frigate.hmd'}.get(os.path.basename(path))
        if src is None:
            src = os.path.dirname(os.path.dirname(path)) + '/' + os.path.basename(path).replace('_real', '')
        for m in H.load(src).materials:
            out[m.name] = m
    return out


EMISSIVE = {'FolderRelay1': 'Vehicle/Vernius/FolderRelay/FolderRelay_Emissive.png'}


def wire(objs, ship, use_tex=True, rough_floor=0.45, spec=0.12):
    recs = hmd_materials(ship)
    for o in objs:
        for slot in o.material_slots:
            m = slot.material
            rec = recs.get(m.name.split('.')[0])
            m.use_nodes = True
            nt = m.node_tree; nt.nodes.clear()
            outn = nt.nodes.new('ShaderNodeOutputMaterial')
            b = nt.nodes.new('ShaderNodeBsdfPrincipled')
            nt.links.new(b.outputs[0], outn.inputs[0])
            b.inputs['Specular IOR Level'].default_value = spec
            if not use_tex or rec is None:
                b.inputs['Base Color'].default_value = (0.5, 0.5, 0.5, 1); b.inputs['Roughness'].default_value = 0.7
                continue
            def img(p, cs):
                n = nt.nodes.new('ShaderNodeTexImage'); n.image = bpy.data.images.load(game_tex(p), check_existing=True)
                n.image.colorspace_settings.name = cs; return n
            alb = img(rec.diffuseTexture, 'sRGB')
            mg = img(rec.specularTexture, 'Non-Color')
            nm = img(rec.normalMap, 'Non-Color')
            sep = nt.nodes.new('ShaderNodeSeparateColor'); nt.links.new(mg.outputs['Color'], sep.inputs[0])
            nt.links.new(sep.outputs['Red'], b.inputs['Metallic'])
            inv = nt.nodes.new('ShaderNodeMath'); inv.operation = 'SUBTRACT'; inv.inputs[0].default_value = 1; inv.use_clamp = True
            nt.links.new(sep.outputs['Green'], inv.inputs[1])
            flo = nt.nodes.new('ShaderNodeMath'); flo.operation = 'MAXIMUM'; flo.inputs[1].default_value = rough_floor
            nt.links.new(inv.outputs[0], flo.inputs[0]); nt.links.new(flo.outputs[0], b.inputs['Roughness'])
            mix = nt.nodes.new('ShaderNodeMix'); mix.data_type = 'RGBA'; mix.blend_type = 'MULTIPLY'; mix.inputs['Factor'].default_value = 1
            nt.links.new(alb.outputs['Color'], mix.inputs['A']); nt.links.new(sep.outputs['Blue'], mix.inputs['B'])
            nt.links.new(mix.outputs['Result'], b.inputs['Base Color'])
            nmap = nt.nodes.new('ShaderNodeNormalMap'); nt.links.new(nm.outputs['Color'], nmap.inputs['Color'])
            nt.links.new(nmap.outputs['Normal'], b.inputs['Normal'])
            # emissive: MetallicGlossAOEmiss alpha masks the albedo; FolderRelay ships a separate emissive map
            if m.name.split('.')[0] in EMISSIVE:
                em = img(EMISSIVE[m.name.split('.')[0]], 'sRGB')
                nt.links.new(em.outputs['Color'], b.inputs['Emission Color']); b.inputs['Emission Strength'].default_value = 1.0
            elif 'Emiss' in rec.specularTexture:
                em = nt.nodes.new('ShaderNodeMix'); em.data_type = 'RGBA'; em.blend_type = 'MULTIPLY'; em.inputs['Factor'].default_value = 1
                nt.links.new(alb.outputs['Color'], em.inputs['A']); nt.links.new(mg.outputs['Alpha'], em.inputs['B'])
                nt.links.new(em.outputs['Result'], b.inputs['Emission Color']); b.inputs['Emission Strength'].default_value = 1.0
