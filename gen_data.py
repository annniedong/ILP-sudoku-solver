import random
random.seed(0)
R = lambda c: c // 9
C = lambda c: c % 9
B = lambda c: (c // 9 // 3) * 3 + (c % 9) // 3
cells = range(81)

with open("bk.pl", "w") as f:
    for name, fn in (("row", R), ("col", C), ("box", B)):
        for c in cells:
            f.write(f"{name}({c},{fn(c)}).\n")

peer = lambda a, b: a != b and (R(a) == R(b) or C(a) == C(b) or B(a) == B(b))
pairs = [(a, b) for a in cells for b in cells if a != b]
pos = [p for p in pairs if peer(*p)]
neg = [p for p in pairs if not peer(*p)]
random.shuffle(pos); random.shuffle(neg)
with open("exs.pl", "w") as f:
    for a, b in pos[:80]: f.write(f"pos(peer({a},{b})).\n")
    for a, b in neg[:80]: f.write(f"neg(peer({a},{b})).\n")