# hlboot for Steam build 19145763 (September 2025)

- `vanilla/`: unpatched `hlboot.dat` and `hlbootdx.dat`, copied from `D:\Steam\steamapps\common\D4X`.
- `patched/`: the same files with Quinn's `resource_trades` feature, which adds the top-bar Convert button.

**These are older than `mod_files/data.cdb`,** which is based on the October 2026 game. Update the game in Steam, then rebuild from its new files:

```
python tool/quinn.py build --base "D:\Steam\steamapps\common\D4X\hlboot.dat" --ticks resource_trades --out <folder>\hlboot.dat
python tool/quinn.py build --base "D:\Steam\steamapps\common\D4X\hlbootdx.dat" --ticks resource_trades --out <folder>\hlbootdx.dat
python tool/quinn.py install --built <folder>\hlboot.dat --game "D:\Steam\steamapps\common\D4X"
python tool/quinn.py install --built <folder>\hlbootdx.dat --game "D:\Steam\steamapps\common\D4X"
```

`install` refuses a build whose base does not match the file in the game folder, and keeps a backup in `tool/hlboot_backups/`.

Never tested in game. These are game binaries, so do not push them to a public repo.
