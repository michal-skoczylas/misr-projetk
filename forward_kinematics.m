

syms theta1 theta2 d3 l1 l2 l3;

% ------------------------------------------------------
% 1. Transformacje dla ogniwa 1 (theta1+90, l1, 0, 180)
% ------------------------------------------------------
% Rotacja Z o theta1 + 90 stopni
Rot_Z1 = [cosd(theta1+90) -sind(theta1+90) 0 0;
          sind(theta1+90)  cosd(theta1+90) 0 0;
          0               0               1 0;
          0               0               0 1];

% Translacja Z o l1
Trans_Z1 = [1 0 0 0;
            0 1 0 0;
            0 0 1 l1;
            0 0 0 1];

% Translacja X o 0 (pominięta, bo a1=0)

% Rotacja X o 180 stopni
Rot_X1 = [1  0        0        0;
          0  cosd(180) -sind(180) 0;
          0  sind(180)  cosd(180) 0;
          0  0        0        1];

% Pełna macierz A1
A1 = Rot_Z1 * Trans_Z1 * Rot_X1;
A1 = simplify(A1); % Uproszczenie

% ------------------------------------------------------
% 2. Transformacje dla ogniwa 2 (theta2, 0, l2, 0)
% ------------------------------------------------------
% Rotacja Z o theta2
Rot_Z2 = [cosd(theta2) -sind(theta2) 0 0;
          sind(theta2)  cosd(theta2) 0 0;
          0             0            1 0;
          0             0            0 1];

% Translacja Z o 0 (pominięta)

% Translacja X o l2
Trans_X2 = [1 0 0 l2;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];

% Rotacja X o 0 stopni (pominięta)

% Pełna macierz A2
A2 = Rot_Z2 * Trans_X2;
A2 = simplify(A2);

% ------------------------------------------------------
% 3. Transformacje dla ogniwa 3 (0, 0, l3, 0)
% ------------------------------------------------------
% Rotacja Z o 0 (pominięta)

% Translacja Z o 0 (pominięta)

% Translacja X o l3
Trans_X3 = [1 0 0 l3;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];

% Rotacja X o 0 (pominięta)

% Pełna macierz A3
A3 = Trans_X3;

% ------------------------------------------------------
% 4. Transformacje dla ogniwa 4 (0, d3, 0, 0)
% ------------------------------------------------------
% Rotacja Z o 0 (pominięta)

% Translacja Z o d3
Trans_Z4 = [1 0 0 0;
            0 1 0 0;
            0 0 1 d3;
            0 0 0 1];

% Translacja X o 0 (pominięta)

% Rotacja X o 0 (pominięta)

% Pełna macierz A4
A4 = Trans_Z4;

% ------------------------------------------------------
% Obliczenie pełnej kinematyki prostej (FK)
% ------------------------------------------------------
FK = A1 * A2 * A3 * A4;
FK = simplify(FK);

% ------------------------------------------------------
% Wyświetlenie wyników
% ------------------------------------------------------
disp('Macierz A1:');
disp(A1);
disp('Macierz A2:');
disp(A2);
disp('Macierz A3:');
disp(A3);
disp('Macierz A4:');
disp(A4);
disp('Pełna kinematyka prosta (FK):');
disp(FK);

% ------------------------------------------------------
% Przykład obliczeń numerycznych
% ------------------------------------------------------
% Podstawienie przykładowych wartości
theta1_val = 0;
theta2_val = 0;
d3_val = 0;
l1_val = 1;
l2_val = 1;
l3_val = 1;

FK_num = subs(FK, {theta1, theta2, d3, l1, l2, l3}, ...
                {theta1_val, theta2_val, d3_val, l1_val, l2_val, l3_val});
disp('FK dla theta1=0, theta2=0, d3=0, l1=1, l2=1, l3=1:');
disp(FK_num);