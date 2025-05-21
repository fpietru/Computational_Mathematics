import numpy as np
import matplotlib.pyplot as plt
import math


def f(t, x):
    return t + x  # dla równania x' = t + x


def df_dt(t, x):
    # pochodna funkcji f(t, x) względem  t ( na podstawie reguły łańcuchowej)
    # ∂f/∂t + ∂f/∂x * dx/dt
    return 1 + 1 * (t + x)


# Metoda Eulera
def Euler(t_0, x_0, h, n):
    t = np.zeros(n + 1)
    x = np.zeros(n + 1)
    t[0] = t_0
    x[0] = x_0

    for i in range(n):
        t[i + 1] = t[i] + h
        x[i + 1] = x[i] + h * f(t[i], x[i])

    return t, x


# Metoda Taylora do rzędu drugiego
def Taylor(t_0, x_0, h, n):
    t = np.zeros(n + 1)
    x = np.zeros(n + 1)
    t[0] = t_0
    x[0] = x_0

    for i in range(n):
        t[i + 1] = t[i] + h
        x[i + 1] = x[i] + h * f(t[i], x[i]) + (h ** 2 / 2) * df_dt(t[i], x[i])

    return t, x


def RungeKutta4(t_0, x_0, h, n):
    t = np.zeros(n + 1)
    x = np.zeros(n + 1)
    t[0] = t_0
    x[0] = x_0

    for i in range(n):
        K_1 = f(t[i], x[i])
        K_2 = f(t[i] + h / 2, x[i] + h/2 * K_1)
        K_3 = f(t[i] + h / 2, x[i] + h/2 * K_2)
        K_4 = f(t[i] + h,     x[i] + h * K_3)
        x[i + 1] = x[i] + h/6 * (K_1 + 2*K_2 + 2*K_3 + K_4)
        t[i + 1] = t[i] + h

    return t, x

# Rozwiązanie analityczne
def Roz_analityczne(t_0, x_0, h, n):
    t = np.zeros(n + 1)
    x = np.zeros(n + 1)
    t[0] = t_0
    x[0] = x_0

    for i in range(n):
        t[i + 1] = t[i] + h
        x[i + 1] = -t[i] - 1 + math.exp(t[i]) + x_0 * math.exp(t[i])

    return t, x


# Wartości początkowe dla parametrów
t_0 = 0
x_0 = 1
h = 0.1
n = 100

# rozwiąż używająć schematu Taylora
t_1, x_1 = Taylor(t_0, x_0, h, n)
# rozwiąż używająć schematu Eulera
t_2, x_2 = Euler(t_0, x_0, h, n)
t_3, x_3 = RungeKutta4(t_0, x_0, h, n)
# rozwiąż dokładnie
t_a, x_a = Roz_analityczne(t_0, x_0, h, n)

# Rysowanie
plt.plot(t_1, x_1, label='Metoda Taylora', color='red')
plt.plot(t_2, x_2, label='Metoda Eulera', color='blue')
plt.plot(t_3, x_3, label='Metoda Rungego-Kutty', color='green')
plt.plot(t_a, x_a, label='Rozwiazanie dokładne', color='black')
plt.title("Rozwiązanie równania dx/dt=x+t")
plt.xlabel("t")
plt.ylabel("x")
plt.legend()
plt.grid(True)
plt.show()