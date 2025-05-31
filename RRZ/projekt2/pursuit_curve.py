import numpy as np
import matplotlib.pyplot as plt

def krzywa_pogoni(x0, y0, d, r, h=1e-2, max_steps=100000, eps=1e-10, y_limit=1e3):
    x_vals = [x0]
    y_vals = [y0]
    dy_vals = [-y0 / (d - x0)]

    for _ in range(max_steps):

        x = x_vals[-1]
        y1 = y_vals[-1]  # y1 = y(x)
        y2 = dy_vals[-1]  # y2 = dy/dx

        if abs(d - x) < eps:
            break

        def f1(x, y1, y2):
            return y2

        def f2(x, y1, y2):
            return np.sqrt(1 + y2 ** 2) / (r * (d - x))

        k1_y1 = h * f1(x, y1, y2)
        k1_y2 = h * f2(x, y1, y2)

        k2_y1 = h * f1(x + h/2, y1 + k1_y1/2, y2 + k1_y2/2)
        k2_y2 = h * f2(x + h/2, y1 + k1_y1/2, y2 + k1_y2/2)

        k3_y1 = h * f1(x + h/2, y1 + k2_y1/2, y2 + k2_y2/2)
        k3_y2 = h * f2(x + h/2, y1 + k2_y1/2, y2 + k2_y2/2)

        k4_y1 = h * f1(x + h, y1 + k3_y1, y2 + k3_y2)
        k4_y2 = h * f2(x + h, y1 + k3_y1, y2 + k3_y2)

        y1 += k1_y1/6 + k2_y1/3 + k3_y1/3 + k4_y1/6
        y2 += k1_y2/6 + k2_y2/3 + k3_y2/3 + k4_y2/6
        x += h

        x_vals.append(x)
        y_vals.append(y1)
        dy_vals.append(y2)

        if abs(y1) > y_limit:
            break

    return np.array(x_vals), np.array(y_vals)


x0, y0 = 0, 5
d = 5
r = 1.5

x_vals, y_vals = krzywa_pogoni(x0, y0, d, r)

plt.plot(x_vals, y_vals, label="Krzywa Pogoni")
plt.axvline(x=d, color='gray', linestyle='--', label="x = d")
plt.scatter([x0], [y0], color='green', label='Start drapieżnika')
plt.xlabel("x")
plt.ylabel("y(x)")
plt.title("Wykres Krzywej Pogoni")
plt.legend()
plt.grid()
plt.axis('equal')
plt.show()