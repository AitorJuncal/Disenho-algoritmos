## Este código genera un dibujo de la curva.

import numpy as np
import matplotlib.pyplot as plt
import math
import numpy as np

"""EJERCICIO 2:"""
theta = (1-math.sqrt(5))/2
F = [np.float32(theta), np.float32(theta)]
for i in range(50):
    F.append(F[-1] + F[-2])
F[0], F[1]

k = F[40] / F[39]
#k si cumple la ecuacion.
"""FIN EJERCICIO 2"""


def f(x, a):
    tx = x.reshape(x.shape[0], 1)
    return np.sum((np.array([np.cos(a*tx), np.sin(a*tx)])), axis=2)


gamma = np.array([3, 6, 7])
x = f(np.array(np.linspace(0, 2 * np.pi, 500)), gamma)
y = x[:, 1:]-x[:, :-1]
lon = np.sum(np.sqrt(np.square(y[0]) + np.square(y[1])))
plt.plot(x[0, :], x[1, :])
fname = "/tmp/ex.png"
plt.savefig(fname)
fname

# Esto genera una rejilla de lineas
y = x.transpose()
# D es la lista de segmentos no verticales
# V es la lista de segmentos verticales
D, V = [], []
T = 0.1

for i, j in zip(y[1:], y[:-1]):
    if np.count_nonzero(i-j) == 2:
        D.append((tuple(i), tuple(j)))
    else:
        V.append((tuple(i), tuple(j)))


def rotation(point, theta):
    ''' This function rotate a set of points'''
    d = np.array([[np.sin(theta), -np.cos(theta)],
                  [np.cos(theta), np.sin(theta)]])
    if point.shape in ((2, 1), (1, 2), (2, )):
        return np.matmul(point, d)
    else:
        d = d.reshape(1, 2, 2)
        points_temp = point.reshape(point.shape + (1, ))
        points_temp = np.matmul(d, points_temp)
        points_temp = points_temp.reshape(points_temp.shape[:-1])
        return points_temp


def set_lines(r, T, theta, down, up):
    pos = down/T
    result = []
    while pos*T<= up:
        temp_down = np.zeros(2)
        temp_down[0] = down
        temp_down[1] = pos*T
        temp_up = np.zeros(2)
        temp_up[0] = up
        temp_up[1] = pos*T
        pos += 1
        temp_down += r
        temp_up += r
        result.append((tuple(rotation(temp_down,theta)),
                      tuple(rotation(temp_up,theta))))
    return result


plt.clf()
for i, j in set_lines(np.array([0.1, 0]),
                      1,
                      0.4,
                      -4,
                      4):
    plt.plot([i[0], j[0]], [i[1], j[1]], '-ok', color='blue')
gamma = np.array([1, 3])
x = f(np.array(np.linspace(0, 2 * np.pi, 500)), gamma)
y = x[:, 1:] - x[:, :-1]
lon = np.sum(np.sqrt(np.square(y[0]) + np.square(y[1])))
plt.plot(x[0, :], x[1, :])
fname = '/tmp/sui.png'
plt.savefig(fname)
fname   