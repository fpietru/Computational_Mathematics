# Franciszek Pietrusiak

import matplotlib.pylab as plt
import math
import numpy as np

def f(t, x):
    return t + x

def df_dt(t, x):
    return 1 + 1 * (t + x)

def taylor(h, t_0, x_0, t_max):
    t_n=[t_0]
    x_n=[x_0]
    while t_n[-1] < t_max:
        t_n.append(t_n[-1] + h)
        x_n.append(x_n[-1] + f(t_n[-1], x_n[-1])*h + ((h**2)/2)*df_dt(t_n[-1], x_n[-1]))
    return t_n, x_n

def euler(h, t_0, x_0, t_max):
    t_n=[t_0]
    x_n=[x_0]
    while t_n[-1] < t_max:
        t_n.append(t_n[-1]+h)
        x_n.append(x_n[-1]+f(t_n[-1], x_n[-1])*h)
    return t_n, x_n

def roz_analityczne(h, t_0, x_0, t_max):
    t=[t_0]
    x_d=[x_0]
    while t[-1] < t_max:
        x_d.append(x_0*math.exp(t[-1]) - t[-1] - 1 + math.exp(t[-1]))
        t.append(t[-1]+h)
    return t, x_d


h, t_0, x_0, t_max = 0.1, 0, 1, 10
t, x_d = roz_analityczne(h, t_0, x_0, t_max)
t1_n, x1_n = taylor(h, t_0, x_0, t_max)
t2_n, x2_n = euler(h, t_0, x_0, t_max)

plt.plot(t, x_d, label="Rozwiazanie dokladne", linewidth=4)
plt.plot(t1_n, x1_n, label="Metoda Taylora", linewidth=4)
plt.plot(t2_n, x2_n, label="Metoda Eulera", linewidth=4)
plt.title("Rozwiazanie rownania dx/dt = x+t")
plt.xlabel("t")
plt.ylabel("x")
plt.legend()
plt.show()