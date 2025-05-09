syms theta1 theta2 l1 l2 l3 l4 l5 d3;

T0_1 = [cosd(theta1) -sind(theta1) 0 0; sind(theta1) cosd(theta1) 0 0; 0 0 1 l1; 0 0 0 1] * [1 0 0 l2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T1_2 = [cosd(theta2) -sind(theta2) 0 0; sind(theta2) cosd(theta2) 0 0; 0 0 1 l3; 0 0 0 1] * [1 0 0 l4; 0 cosd(180) -sind(180) 0; 0 sind(180) cosd(180) 0; 0 0 0 1];
T2_3 = [1 0 0 0; 0 1 0 0; 0 0 1 l5 + d3; 0 0 0 1];
FK = T0_1 * T1_2 * T2_3;
T0_2 = simplify(T0_1 * T1_2);
T0_3 = simplify(FK);

d0_3 = T0_3(1:3, end);  
d0_2 = T0_2(1:3, end);   
d0_1 = T0_1(1:3, end);   
d0_0 = [0; 0; 0];        

% Macierze rotacji
R0_0 = eye(3);
R0_1 = T0_1(1:3, 1:3);
R0_2 = T0_2(1:3, 1:3);

% Obliczenie Jakobiana geometrycznego
Jv = [
    cross(R0_0 * [0; 0; 1], d0_3 - d0_0), ...  % Składowa liniowa dla przegubu 1
    cross(R0_1 * [0; 0; 1], d0_3 - d0_1), ...  % Składowa liniowa dla przegubu 2
    R0_2 * [0; 0; 1]       % Składowa liniowa dla przegubu 3
];

Jw = [
    R0_0 * [0; 0; 1], ...  % Składowa kątowa dla przegubu 1 (obrotowego)
    R0_1 * [0; 0; 1], ...  % Składowa kątowa dla przegubu 2 (obrotowego)
    R0_2 * [0; 0; 0]       % Składowa kątowa dla przegubu 3 (przesuwnego)
];

% Pełna macierz Jakobiana (6x3)
J = simplify([Jv; Jw]);

disp('Macierz Jakobiana:');
disp(J);
% 
% 
% disp('T0_1:');
% disp(T0_1)
% 
% 
% disp('T0_2:');
% disp(T0_2)
% 
% 
% disp('T0_3:');
% disp(T0_3)
% 
% 
% disp('d0_0');
% disp(d0_0);
% 
% disp('d0_1');
% disp(d0_1);
% 
% disp('d0_2');
% disp(d0_2);
% 
% disp('d0_2');
% disp(d0_2);
% 
% disp('d0_3');
% disp(d0_3);
% 
% 
% 
% disp('R0_0');
% disp(R0_0)
% 
% disp('R0_1');
% disp(R0_1)
% disp('R0_2');
% disp(R0_2)