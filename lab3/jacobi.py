import numpy as np


def is_correct(m, a, x):
    rows, cols = m.shape
    for i in range(rows):
        s = sum(m[i, j] * x[j] for j in range(cols))
        if abs(s - a[i]) > exp: return False
    return True


if __name__ == '__main__':
    b = np.array([[32, 2, 1], [2, 32, 3], [1, 3, 6]], np.float32)
    c = np.array([2, 32, 0], np.float32)
    eps = 0.01

    rows, cols = b.shape
    x = np.zeros(cols, np.float32)
    temp_x = x.copy()

    i = 0
    while not is_correct(b, c, x) and i < 10:
        for j in range(rows):
            s = sum(b[j, k] * x[k] for k in range(cols) if k != j)
            temp_x[j] = (c[j] - s) / b[j, j]
        x = temp_x.copy()
        i += 1
        print(i, x)
    
    # checking

    results = np.zeros(cols, np.float32)

    for i in range(cols):
        results[i] = sum(b[i, j] * x[j] for j in range(cols))
    results = np.around(results)
    print(all(results == c))
