import numpy as np
from sympy import *

x = Symbol("x")
f = atan(x) + x

xs = [-3, -1, 1, 3]
ys = list(map(lambda v: f.subs(x, v), xs))

x_ = 0.5

pol = 0
length = len(xs)

for i, v in enumerate(xs):
    fr = [(x - xs[j]) / (v - xs[j]) for j in range(length) if j != i]
    pol += ys[i] * np.prod(fr)

print(pol)

# checking

for i, v in enumerate(xs):
    print(f'{pol.subs(x, v)} == {ys[i]};', pol.subs(x, v) == ys[i])

result = pol.subs(x, x_)
error = result.evalf() - result.evalf(6)
p_error = (error / result * 100).evalf()

print(result.evalf(6))
print(error)
print(p_error)