#!/usr/bin/env python3
import numpy as np
import math
import csv

# Parametry manipulatora SCARA z URDF
l1 = 0.05    # Wysokość podstawy (base_link + joint1 offset)
l2 = 0.425   # Długość pierwszego ramienia (link1)
l3 = 0.345   # Długość drugiego ramienia (link2)
l5 = 0.25    # Połowa długości końcówki (link3)

def forward_kinematics(theta1, theta2, d3):
    """Oblicza kinematykę prostą dla manipulatora SCARA"""
    x = l2 * math.cos(theta1) + l3 * math.cos(theta1 + theta2)
    y = l2 * math.sin(theta1) + l3 * math.sin(theta1 + theta2)
    z = l1 - l5 - d3  # minus d3 bo oś Z w dół
    return (x, y, z)

def generate_point_cloud():
    """Generuje chmurę punktów dla przestrzeni roboczej"""
    # Zakresy ruchu zgodne z limitami z URDF
    theta1_range = np.linspace(-1.57, 1.57, 30)  # joint1: -π/2 do π/2
    theta2_range = np.linspace(-1.57, 1.57, 30)  # joint2: -π/2 do π/2
    d3_range = np.linspace(0, 0.3, 15)          # joint3: 0 do 0.3m
    
    points = []
    for theta1 in theta1_range:
        for theta2 in theta2_range:
            for d3 in d3_range:
                x, y, z = forward_kinematics(theta1, theta2, d3)
                points.append((x, y, z))
    return points

def save_to_csv(points, filename):
    """Zapisuje punkty do pliku CSV"""
    with open(filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['x', 'y', 'z'])  # nagłówek
        writer.writerows(points)
    print(f"Zapisano {len(points)} punktów do {filename}")

if __name__ == '__main__':
    # Generowanie chmury punktów
    points = generate_point_cloud()
    
    # Zapis do CSV
    save_to_csv(points, 'scara_workspace_points.csv')
    
    # Dodatkowe informacje
    print("Przykładowe punkty:")
    for i in range(5):  # Wyświetl pierwsze 5 punktów
        print(f"Punkt {i+1}: x={points[i][0]:.3f}, y={points[i][1]:.3f}, z={points[i][2]:.3f}")