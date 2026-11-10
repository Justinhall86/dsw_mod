"""Stage every custom asset + mod_files/data.cdb into an editor-style res tree and build res.compressed1.pak with heaps.
For the D: PC (no editor res tree there); works anywhere with Haxe + heaps + HashLink.

    py -3.14 mod_files/stage_and_pack.py            # stage + build the pak in <editor res>
    py -3.14 mod_files/stage_and_pack.py --install  # also put it in the game (old paks -> pak_archive/, never deleted)
    py -3.14 mod_files/stage_and_pack.py --launch   # (with --install) start the game through Steam

Editor res dir: $D4X_EDITOR_RES or D:\\D4XEditor\\res (outside the repo). Game: $DSW_GAME_DIR or D:\\Steam\\steamapps\\common\\D4X.
SOURCES maps each pak path to the project folder that holds its game-ready files. Add a line when a new custom model,
vehicle or FX goes into data.cdb (cdb_validate's "missing file" lines that are not in the vanilla pak are exactly these).
"""
import datetime
import hashlib
import os
import shutil
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MP = os.path.join(REPO, "model_projects")
TH = os.path.join(MP, "thorvald")
ED = os.environ.get("D4X_EDITOR_RES", r"D:\D4XEditor\res")
GAME = os.environ.get("DSW_GAME_DIR", r"D:\Steam\steamapps\common\D4X")
HL = os.environ.get("DSW_HL", r"C:\HaxeToolkit\hashlink\hl.exe")

SOURCES = {   # pak path -> folder with the files (copied as is)
    "CharMOD/Male01_GinazCaptain": os.path.join(MP, "ginaz_captain", "06_game_ready", "Male01_GinazCaptain"),
    "CharMOD/Male01_GinazMaster": os.path.join(MP, "ginaz_master", "06_game_ready", "Male01_GinazMaster"),
    "CharMOD/Male01_GinazNeophyte": os.path.join(MP, "ginaz_swordmaster", "06_game_ready", "Male01_GinazNeophyte"),
    "CharMOD/Male01_LandsraadEliteG1": os.path.join(MP, "landsraad_elite", "06_game_ready", "v6_G1"),
    "CharMOD/Male01_ThorvaldTrooper": os.path.join(TH, "thorvald_trooper", "Final", "game_files", "CharMOD", "Male01_ThorvaldTrooper"),
    "CharMOD/Male01_ThorvaldRanged": os.path.join(TH, "thorvald_ranged", "Final", "game_files", "CharMOD", "Male01_ThorvaldRanged"),
    "CharMOD/Male01_ThorvaldDemolition": os.path.join(TH, "thorvald_demolition", "Final", "game_files", "CharMOD", "Male01_ThorvaldDemolition"),
    "CharMOD/Male01_ThorvaldElite": os.path.join(TH, "thorvald_elite", "Final", "game_files", "CharMOD", "Male01_ThorvaldElite"),
    "CharMOD/Male01_ThorvaldKarlin": os.path.join(TH, "thorvald_hero_1", "Final", "game_files", "CharMOD", "Male01_ThorvaldKarlin"),
    "CharMOD/Male01_ThorvaldSwornSword": os.path.join(TH, "thorvald_sworn_sword", "06_game_ready", "CharMOD", "Male01_ThorvaldSwornSword"),
    "VehMOD/Thorvald_Frigate": os.path.join(TH, "thorvald_frigate", "Final", "game_files", "VehMOD", "Thorvald_Frigate"),
    "VehMOD/Thorvald_Ship": os.path.join(TH, "thorvald_ship", "Final", "game_files", "VehMOD", "Thorvald_Ship"),
    "Fx/Vehicle/Ships/Thorvald": os.path.join(TH, "thorvald_frigate", "Final", "game_files", "Fx", "Vehicle", "Ships", "Thorvald"),
    # Thorvald councillor portraits (character.images menuGfx / tutoGfx) and spy-agent sheets: without
    # menuCouncilorsThorvald.png the new-game screen fails and Thorvald cannot be picked by a player (2026-11-09)
    "UI/Faction": os.path.join(TH, "thorvald_councillors", "04_textures", "Faction"),
    "UI/spying/agents": os.path.join(TH, "thorvald_councillors", "04_textures", "spying", "agents"),
    # Memnon's faction-select card portrait (30_leader_card.py) and Thorvald's style file (31_faction_css.py),
    # read by the hlboot feature faction_styles (hlboot_builds.json "always")
    "UI/menu/Thorvald": os.path.join(TH, "thorvald_councillors", "04_textures", "menu", "Thorvald"),
    "UI/Styles/factions": os.path.join(TH, "thorvald_councillors", "04_textures", "Styles", "factions"),
}


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()[:16]


res = os.path.join(ED, "res")
if os.path.isdir(res):
    shutil.rmtree(res)
os.makedirs(res)
shutil.copy2(os.path.join(REPO, "mod_files", "data.cdb"), os.path.join(ED, "data.cdb"))
shutil.copy2(os.path.join(REPO, "mod_files", "data.cdb"), os.path.join(res, "data.cdb"))
n = 0
for dst, src in SOURCES.items():
    assert os.path.isdir(src), "missing source " + src
    shutil.copytree(src, os.path.join(res, *dst.split("/")))
    n += len(os.listdir(src))
print("staged %d asset folders (%d files) + data.cdb in %s" % (len(SOURCES), n, res))

# every prefab / props / materials.props reference that points into our own folders must exist in the tree
bad = []
for root, _, files in os.walk(res):
    for f in files:
        if f.endswith((".prefab", ".props", ".json")) and f != "data.cdb":
            txt = open(os.path.join(root, f), encoding="utf-8", errors="ignore").read()
            for top in ("CharMOD/", "VehMOD/"):
                i = txt.find(top)
                while i >= 0:
                    j = i
                    while j < len(txt) and txt[j] not in "\"' \n\r,}]":
                        j += 1
                    ref = txt[i:j]
                    if "." in os.path.basename(ref) and not os.path.exists(os.path.join(res, *ref.split("/"))):
                        bad.append((os.path.relpath(os.path.join(root, f), res), ref))
                    i = txt.find(top, j)
if bad:
    for b in bad:
        print("  BROKEN REF", b)
    raise SystemExit("broken references: fix before packing")
print("references: all CharMOD/VehMOD paths resolve")

# every asset path written in data.cdb must be in the vanilla pak or in the staged tree (cdb_validate does not check
# image fields such as character.images.menuGfx; a missing one broke the faction select screen)
import re  # noqa: E402
sys.path.insert(0, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts"))
import pak_extract_one as PX  # noqa: E402
vpak = os.path.join(GAME, "res.compressed.pak")
with open(vpak, "rb") as f:
    f.read(4)
    hsize = PX.struct.unpack("<i", f.read(4))[0]
    try:
        f.read(4)
        vanilla = {p for p, _, _ in PX.read_tree(f)}
    except Exception:
        vanilla = None
if vanilla is None or len(vanilla) < 1000:
    r = subprocess.run([sys.executable, os.path.join(REPO, ".claude", "skills", "dsw-model-modding", "scripts",
                                                     "pak_extract_one.py"), vpak, "--list"], capture_output=True, text=True)
    vanilla = {l.split(" ", 1)[1] for l in r.stdout.splitlines() if " " in l}
cdb_txt = open(os.path.join(res, "data.cdb"), encoding="utf-8").read()
refs = set(re.findall(r'"([A-Za-z0-9_\-/ .]+\.(?:png|jpg|jpeg|dds|tga|fx|prefab|fbx|l3d|hmd|wav|ogg|props))"', cdb_txt))
lost = sorted(p for p in refs if p not in vanilla and not os.path.exists(os.path.join(res, *p.split("/"))))
if lost:
    for p in lost:
        print("  MISSING ASSET", p)
    raise SystemExit("data.cdb names files that are neither vanilla nor staged")
print("data.cdb assets: %d paths, all vanilla or staged (%d vanilla files indexed)" % (len(refs), len(vanilla)))

for p in ("res.compressed1.pak",):
    if os.path.exists(os.path.join(ED, p)):
        os.remove(os.path.join(ED, p))
r = subprocess.run(["haxe", "-hl", "hxd.fmt.pak.Build.hl", "-lib", "heaps", "-main", "hxd.fmt.pak.Build"], cwd=ED,
                   capture_output=True, text=True, shell=True)
if r.returncode:
    raise SystemExit("haxe failed:\n" + r.stdout + r.stderr)
r = subprocess.run([HL, "hxd.fmt.pak.Build.hl", "-out", "res.compressed1"], cwd=ED, capture_output=True, text=True)
pak = os.path.join(ED, "res.compressed1.pak")
if r.returncode or not os.path.exists(pak):
    raise SystemExit("pak build failed:\n" + r.stdout + r.stderr)
print("built %s  %.1f MB  sha %s" % (pak, os.path.getsize(pak) / 1e6, sha(pak)))

if "--install" in sys.argv:
    arch = os.path.join(REPO, "pak_archive")
    os.makedirs(arch, exist_ok=True)
    stamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    for f in sorted(os.listdir(GAME)):
        if f.lower().endswith(".pak") and f != "res.compressed.pak":
            shutil.move(os.path.join(GAME, f), os.path.join(arch, "%s_%s" % (stamp, f)))
            print("archived game pak", f, "->", "pak_archive/%s_%s" % (stamp, f))
    shutil.copy2(pak, os.path.join(GAME, "res.compressed1.pak"))
    left = sorted(f for f in os.listdir(GAME) if f.lower().endswith(".pak"))
    assert left == ["res.compressed.pak", "res.compressed1.pak"], left
    assert sha(os.path.join(GAME, "res.compressed1.pak")) == sha(pak)
    print("installed; game paks:", left)
    if "--launch" in sys.argv:
        os.startfile("steam://rungameid/1605220")
        print("launched via Steam")
