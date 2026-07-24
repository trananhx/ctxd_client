import sys, os, re, collections
sys.stdout.reconfigure(encoding='utf-8')
ROOT = r"C:\Users\ADMIN\AppData\Local\Temp\claude\D--Unity-Training-ctxd-client\41de61c7-6091-4718-ae08-4eb8fcada6c6\scratchpad"
A = os.path.join(ROOT,'apk','assets')
OUT = os.path.join(ROOT,'strings'); os.makedirs(OUT, exist_ok=True)

def good(ch):
    return ch!='�' and ch.isprintable()

def runs(data, minlen=3):
    text = data.decode('utf-8','replace')
    out=[]; cur=[]
    for ch in text:
        if good(ch): cur.append(ch)
        else:
            if len(cur)>=minlen: out.append(''.join(cur))
            cur=[]
    if len(cur)>=minlen: out.append(''.join(cur))
    return out

dotted = collections.Counter()
idents = collections.Counter()
vitext = []  # strings containing non-ascii letters (Vietnamese/CJK)
DOTRE = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)+$')
IDRE  = re.compile(r'^[A-Za-z_][A-Za-z0-9_]{1,30}$')
NONASCII = re.compile(r'[^\x00-\x7f]')

nlj=0
for n in os.listdir(A):
    p=os.path.join(A,n)
    if not os.path.isfile(p): continue
    with open(p,'rb') as f:
        head=f.read(3)
        if head!=b'\x1bLJ': continue
        f.seek(0); data=f.read()
    nlj+=1
    ss=runs(data)
    with open(os.path.join(OUT,n+'.txt'),'w',encoding='utf-8') as g:
        g.write('\n'.join(ss))
    for s in ss:
        if DOTRE.match(s): dotted[s]+=1
        elif IDRE.match(s): idents[s]+=1
        if NONASCII.search(s) and len(s)>=4:
            vitext.append((n,s))

# save aggregates
with open(os.path.join(ROOT,'_modules.txt'),'w',encoding='utf-8') as f:
    for s,c in dotted.most_common():
        f.write(f"{c}\t{s}\n")
with open(os.path.join(ROOT,'_idents.txt'),'w',encoding='utf-8') as f:
    for s,c in idents.most_common():
        f.write(f"{c}\t{s}\n")
with open(os.path.join(ROOT,'_text_vi.txt'),'w',encoding='utf-8') as f:
    for n,s in vitext:
        f.write(f"{n}\t{s}\n")

print(f"LJ files processed: {nlj}")
print(f"Unique dotted-paths: {len(dotted)} | unique idents: {len(idents)} | non-ascii text lines: {len(vitext)}")
print("\n=== TOP 60 DOTTED PATHS (module/config structure) ===")
for s,c in dotted.most_common(60):
    print(f"{c:4d}  {s}")
