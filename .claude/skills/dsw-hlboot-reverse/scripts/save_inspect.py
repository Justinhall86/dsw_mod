"""Read a D4X save and report what actually exists in the game state. It works from the game's own data, not from screenshots.

    python save_inspect.py                     newest .sav in the game's save folder
    python save_inspect.py <file.sav> [word ...]   also count extra id strings

Save layout (Save.buildFullSaveData): "D4X" + version + Haxe-serialized meta (player faction, game time, config),
then zlib blocks: the WORLD (map) block, then the HXS (hxbit) game-state block. The state block stores cdb ids as
strings, so counting an id shows whether such an object (raid kind, structure kind, unit kind, trait, mission)
exists in that game. Field names are stored too, which is why lowercase words aren't counted.
"""
import glob
import os
import re
import sys
import zlib

SAVES = r"C:\Program Files (x86)\Steam\steamapps\common\D4X\save"
DEFAULT = ["Renegade_Drop", "Renegade_Pillagers", "Th_RenegadeStrike", "RenegadeControl", "Th_RenegadeBase",
           "ThR_Trooper", "ThR_Ranger", "ThR_Guard", "ThR_Ship", "Renegades_Drone",
           "Th_RenegadePact", "Th_TestFreeArmy", "Th_RenegadeStrike_Signal", "Th_IronLandfall",
           "Th_MRenegadeStrike", "Th_MIronLandfall", "Th_MRenegadeTakeover", "GhostMarket",
           "TH_Ornithopter", "TH_Trooper", "TH_Soldier", "TH_Special", "TH_Elite", "TH_Ship", "TH_Frigate", "G_Soldier"]


def blocks(b):
    out, i = [], 0
    while i < len(b) - 2:
        if b[i] == 0x78 and b[i + 1] in (0x01, 0x5E, 0x9C, 0xDA):
            try:
                d = zlib.decompressobj(); data = d.decompress(b[i:])
                if len(data) > 1000:
                    out.append(data); i = len(b) - len(d.unused_data); continue
            except zlib.error:
                pass
        i += 1
    return out


def main():
    args = sys.argv[1:]
    path = args.pop(0) if args and args[0].endswith(".sav") else max(
        (p for p in glob.glob(os.path.join(SAVES, "*.sav")) if not os.path.basename(p).startswith(("udat_", "profile_"))), key=os.path.getmtime)
    words = DEFAULT + args
    b = open(path, "rb").read()
    meta = b[:4000].decode("latin-1")
    m = re.search(r"y2:mey(\d+):", meta)  # Haxe serializer: y<len>:<string>
    player = meta[m.end():m.end() + int(m.group(1))] if m else "?"
    t = re.search(r"y4:timed([\d.]+)", meta)
    bl = blocks(b)
    state = next((x for x in bl if x[:4] == b"\x04HXS" or b"HXS" in x[:8]), bl[-1] if bl else b"")
    print(f"save: {path}")
    secs = float(t.group(1)) if t else 0.0
    print(f"  player: {player}   game time: {secs:.0f} s = {secs / 30:.1f} days")
    print(f"  state block: {len(state)} bytes")
    for w in words:
        n = len(re.findall(rb"(?<![A-Za-z0-9_])" + re.escape(w.encode()) + rb"(?![A-Za-z0-9_])", state))
        print(f"  {w:28s} {n}")


if __name__ == "__main__":
    main()
