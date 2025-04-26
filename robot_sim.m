% Definicja robota RRP
robot = SerialLink([
    Revolute('d', 1, 'a', 1, 'alpha', pi, 'qlim', [-pi pi],'offset',pi/2)   % Joint 1
    Revolute('d', 0, 'a', 1, 'alpha', 0, 'qlim', [-pi pi])    % Joint 2
    Prismatic('theta', 0, 'a', 1, 'alpha', 0, 'qlim', [0 2])  % Joint 3
], 'name', 'RRP Robot');

% Pożądana pozycja (x, y, z)
T_desired = transl(-1, 2,-0.5 );  

% Początkowe przybliżenie
q0 = [0, 0, 1];  

% Rozwiązanie IK (tylko pozycja, bez orientacji)
q_sol = robot.ikine(T_desired, 'q0', q0, 'mask', [1 1 1 0 0 0], 'tol', 1e-3);

% Wynik
disp('Rozwiązanie IK:');
disp(q_sol);  % [theta1, theta2, d3]

% Weryfikacja
T_achieved = robot.fkine(q_sol);
disp('Osiągnięta pozycja:');
disp(T_achieved.transl);  

% Wizualizacja
robot.plot(q_sol, 'workspace', [-3 3 -3 3 -1 3]);
hold on;
plot3(-1, 2, 1, 'ro', 'MarkerSize', 10);  % Cel