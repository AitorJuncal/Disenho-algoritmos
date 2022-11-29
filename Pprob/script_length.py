## Este cÃ³digo genera un dibujo de la curva.

import numpy as np
import matplotlib.pyplot as plt
import math

"""EJERCICIO 2:"""
theta = (1-math.sqrt(5))/2
F = [np.float32(theta), np.float32(theta)]
for i in range(50):
    F.append(F[-1] + F[-2])
F[0], F[1]

k = F[40] / F[39]
#k si cumple la ecuacion.
"""FIN EJERCICIO 2"""

"""EJERCICIO 3: Calcule una estimación de la longitud de está curva a mano, y compare con la longitud real, suponiendo
que la separación entre las rectas es uno"""
puntos_corte = 12
estimacion = puntos_corte * (math.pi / 2)
#Obtenemos una estimación de longitud de la curva de 18.84, que se acerca bastante a la
#longitud real que es 19.37.
"""FIN EJERCICIO 3"""


def f(x, a):
    tx = x.reshape(x.shape[0], 1)
    return np.sum((np.array([np.cos(a*tx), np.sin(a*tx)])), axis=2)


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

gamma = np.array([3, 6, 7])
x = f(np.array(np.linspace(0, 2 * np.pi, 500)), gamma)
y = x[:, 1:]-x[:, :-1]

"""EJERCICIO 1: OBTENEMOS LA LONGITUD EN FUNCION DE LA DISTANCIA ENTRE PUNTOS"""
lon = np.sum(np.sqrt(np.square(y[0]) + np.square(y[1])))
plt.plot(x[0, :], x[1, :])
fname = "ex.png"
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
fname = 'sui.png'
plt.savefig(fname)
fname

"""Ejercicio 4"""
if y.shape[-1] != 2:
    y = y.transpose()
def count_intersection(y,T,r,theta):
    y_temp = rotation(y, theta)
    up, down = np.max(y_temp), np.min(y_temp)
    pos = np.floor((down-r)/T)
    total = 0
    while r+pos*T<= up:
        positions0 = np.logical_and(y_temp[1:,0]>= r+pos*T,y_temp[:-1,0]<= r+pos*T)
        positions1 = np.logical_and(y_temp[1:,0]<= r+pos*T,y_temp[:-1,0]>= r+pos*T)
        positions = np.logical_or(positions0, positions1)
        total += np.sum(positions)
        pos += 1
    return total

T = 0  # Distancia entre rectas
r = 0.09 # posicion inicial (tiene que estar entre 0 y T)
theta = 0.85 # Angulo
simulations = []
distancias = []
for i in range(100):
    T = i
    r = T* np.random.rand()
    theta = np.pi/2 * np.random.rand()
    temp = 0.5*T*np.pi*count_intersection(y,T,r,theta)
    simulations.append(temp)
    distancias.append(T)
    
plt.scatter(distancias,simulations)
fname = 'EJ4.png'
plt.savefig(fname)
fname
"""FIN EJERCICIO 4"""