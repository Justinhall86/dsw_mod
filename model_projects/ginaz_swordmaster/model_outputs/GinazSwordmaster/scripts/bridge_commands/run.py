import sys, os, time
B = r"C:\Users\justi\AppData\Local\Temp\claude\c--Users-justi-OneDrive-Python-dsw-mod\bcfd5601-f811-4ebb-8e18-d846ff537b3d\scratchpad\bridge\cmd"
name = sys.argv[1]; src = sys.stdin.read()
tmp = os.path.join(B, name + ".tmp"); open(tmp, "w", encoding="utf-8").write(src)
os.replace(tmp, os.path.join(B, name + ".py"))
out = os.path.join(B, name + ".out"); t = time.time()
while not os.path.exists(out):
    if time.time() - t > float(sys.argv[2] if len(sys.argv) > 2 else 120): print("TIMEOUT"); sys.exit(1)
    time.sleep(0.3)
time.sleep(0.2); print(open(out, encoding="utf-8").read())
