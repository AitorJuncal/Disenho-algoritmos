# -*- coding: utf-8 -*-
"""
Created on Tue Oct 25 19:50:08 2022

@author: Aitor
"""
import networkx as nx

def topological_sort(G):
    L = []
    S = set()
    nodos = list(G.nodes)
    for nodo in nodos:
        aristas_incidentes = G.in_edges(nodo)
        if len(aristas_incidentes) == 0:
            S.add(nodo)
            
    while S:
        n = S.pop()
        L.append(n)
        aristas_salida = G.out_edges(n)
        nodos_salida = [arista[1] for arista in aristas_salida]
        for m in nodos_salida:
            G.remove_edge(n,m)
            aristas_incidentes = G.in_edges(m)
            if len(aristas_incidentes) == 0:
                S.add(m)
    
    if len(G.edges) > 0:
        return "ERROR, EL GRAFO TIENE ALGÚN CICLO"
    else:
        return L
    
    

G = nx.DiGraph()
G.add_node(0)
G.add_node(1)
G.add_node(2)
G.add_node(3)
G.add_node(4)
G.add_node(5)
G.add_edge(1,2)
G.add_edge(2,3)
G.add_edge(3,4)
G.add_edge(4,5)

lista = topological_sort(G)
print("ESTA ES LA LISTA RESULTANTE DEL ORDENAMIENTO TOPOLÓGICO : ",lista)