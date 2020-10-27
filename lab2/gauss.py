import numpy as np

# [[22, 5, 2], [5, 22, -2], [2, -2, 22]]
# [1, 22, -2]
# or
# [[27, 0, 2, 2], [3, 3, 0, 2], [2, 5, 3, 22], [22, 24, 22, 1]]
# [2, 2, 2, 22]

a = np.array([[22, 5, 2], [5, 22, -2], [2, -2, 22]], np.float32)
b = np.array([1, 22, -2], np.float32)

val1 = a.copy()
val2 = b.copy()

rows, cols = a.shape

for k in range(rows - 1):
    for i in range(k + 1, rows):
        b[i] = b[i] - a[i, k] * b[k] / a[k, k]
        for j in range(k + 1, rows):
            a[i, j] = a[i, j] - a[i, k] * a[k, j] / a[k, k]
        a[i, k] = 0

print(f'a =\n {a};\nb = {b}.')

x = np.zeros(cols, np.float32)

for i in range(rows - 1, -1, -1):
    s = 0
    for j in range(i + 1, rows):
        s = s + a[i, j] * x[j]
    x[i] = (b[i] - s) / a[i, i]

print(x)

# cheking

results = np.zeros(cols, np.float32)
for i in range(rows):
    for j in range(cols):
        results[i] += val1[i, j] * x[j]
results = np.around(results)
print(all(results == val2))