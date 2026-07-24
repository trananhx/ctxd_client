#!/usr/bin/env python3
"""
extract_assets.py — mo rong pipeline dich nguoc sang asset phi-Lua (anh, plist, audio).

Game goc dia chi moi file bang md5(duong-dan-tuong-doi) -> ten file tren dia la
hash 32 ky tu, khong co phan mo rong. Script nay khoi phuc ten goc bang 2 nguon:
  (a) String literal "res/....(plist|png|jpg|...)" trong Lua da decompile.
  (b) <textureFileName> trong moi plist -> suy ra duong dan texture cung thu muc.
Roi copy asset vao cay res/ dung cau truc goc; phan khong map duoc -> _unmapped/.

Dung:
    # 1. Giai nen assets/ tu APK:
    unzip "Xưng Đế Công Thành_1.apk" 'assets/*' -d out
    # 2. Chay (arg1 = thu muc assets da giai nen, arg2 = thu muc decompiled Lua, arg3 = thu muc output):
    python tooling/extract_assets.py out/assets decompiled assets

Sinh: assets/res/**, assets/_unmapped/**, assets/hash2asset.tsv, assets/res.lua, assets/version.lua
(ASSET-MANIFEST.md sinh rieng — xem build_report.json de lay so lieu.)
"""
import hashlib, os, re, glob, shutil, posixpath, sys, json
from collections import defaultdict

ASSETS = sys.argv[1] if len(sys.argv) > 1 else "out/assets"
DEC    = sys.argv[2] if len(sys.argv) > 2 else "decompiled"
OUT    = sys.argv[3] if len(sys.argv) > 3 else "assets"

def md5(s): return hashlib.md5(s.encode('utf-8')).hexdigest()

names = os.listdir(ASSETS)
aset  = set(names)

def kind(path):
    with open(path, 'rb') as f: hd = f.read(8)
    if hd[:5] == b'\x1bLJ\x01\x02':               return 'lua'
    if hd[:8] == b'\x89PNG\r\n\x1a\n':             return 'png'
    if hd[:2] == b'\xff\xd8':                      return 'jpg'
    if hd[:5] == b'<?xml':                         return 'plist'
    if hd[:4] == b'CCZ!':                          return 'ccz'
    if hd[:3] == b'ID3' or hd[:2] == b'\xff\xfb':  return 'mp3'
    return 'other'

# ---- (a) harvest static resource-path strings from decompiled Lua ----
pat = re.compile(r'"([^"\n]+?\.(?:plist|png|jpg|jpeg|mp3|pvr\.ccz|ccz|pvr|csb|ExportJson|fnt|tmx))"')
paths = set()
for fn in glob.glob(DEC + '/**/*.lua', recursive=True):
    t = open(fn, encoding='utf-8', errors='ignore').read()
    for m in pat.findall(t):
        if '%' in m:            # bo chuoi dung runtime (khong giai tinh duoc)
            continue
        paths.add(m)

hash2path = {}
for p in paths:
    for c in ({p} | ({'res/' + p} if not p.startswith('res/') else set())):
        h = md5(c)
        if h in aset:
            hash2path[h] = c

# ---- (b) recover atlas textures via plist <textureFileName> ----
tex_re = re.compile(r'<key>textureFileName</key>\s*<string>([^<]+)</string>')
for path, h in [(v, k) for k, v in hash2path.items() if v.endswith('.plist')]:
    t = open(os.path.join(ASSETS, h), encoding='utf-8', errors='ignore').read()
    m = tex_re.search(t)
    if not m:
        continue
    texpath = posixpath.join(posixpath.dirname(path), m.group(1))
    th = md5(texpath)
    if th in aset and th not in hash2path:
        hash2path[th] = texpath

# ---- copy ----
ext_for = {'png': 'png', 'jpg': 'jpg', 'plist': 'plist', 'ccz': 'pvr.ccz', 'mp3': 'mp3', 'other': 'bin'}
stats = defaultdict(lambda: {'named': 0, 'unmapped': 0, 'nb': 0, 'ub': 0})
os.makedirs(OUT, exist_ok=True)
for h in names:
    src = os.path.join(ASSETS, h)
    if h in ('res.lua', 'version.lua'):          # plaintext manifest giu ten that
        shutil.copy2(src, os.path.join(OUT, h)); continue
    k = kind(src)
    if k == 'lua':                               # bytecode da co o decompiled/
        continue
    sz = os.path.getsize(src)
    if h in hash2path:
        dst = os.path.join(OUT, hash2path[h].replace('/', os.sep))
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        shutil.copy2(src, dst)
        stats[k]['named'] += 1; stats[k]['nb'] += sz
    else:
        d = os.path.join(OUT, '_unmapped', k)
        os.makedirs(d, exist_ok=True)
        shutil.copy2(src, os.path.join(d, h + '.' + ext_for.get(k, 'bin')))
        stats[k]['unmapped'] += 1; stats[k]['ub'] += sz

with open(os.path.join(OUT, 'hash2asset.tsv'), 'w', encoding='utf-8') as f:
    f.write("# md5(original_path)\toriginal_path\n")
    f.write("# Khoi phuc tu: (a) string literal trong decompiled Lua, (b) <textureFileName> trong plist\n")
    for h, p in sorted(hash2path.items(), key=lambda x: x[1]):
        f.write(f"{h}\t{p}\n")

n = sum(v['named'] for v in stats.values()); u = sum(v['unmapped'] for v in stats.values())
print(f"named={n}  unmapped={u}  map_entries={len(hash2path)}")
for k in ['png', 'jpg', 'plist', 'ccz', 'mp3', 'other']:
    v = stats[k]
    print(f"  {k:6s} named {v['named']:4d}  unmapped {v['unmapped']:4d}")
