import numpy as np
from sympy import *

x = Symbol("x")
f = acot(x) + x

xs = [-3, 0, 1, 3]
ys = list(map(lambda v: N(f.subs(x, v)), xs))

x_ = -0.5

pol = 0
temp_l = ys.copy()
length = len(xs)

for i in range(length):
    fr = [(x - xs[j]) for j in range(i)] if i > 0 else [1]
    pol += temp_l[0] * np.prod(fr)
    temp_l = [(temp_l[j + 1] - temp_l[j]) / 
              (xs[j + i + 1] - xs[j]) for j in range(length - i - 1)]

print(pol)

# checking
for i, v in enumerate(xs):
    print(f'{pol.subs(x, v)} == {ys[i]}; {pol.subs(x, v) == ys[i]}')


result = pol.subs(x, x_)
error = result.evalf() - result.evalf(6)
p_error = (error / result * 100).evalf()

print(result.evalf(6), error, p_error)

