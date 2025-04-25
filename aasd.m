clc;
clear;

% ---- Parametry DH ----
l1 = 1.0;    % przesunięcie Z dla pierwszego ogniwa
l2 = 0.8;    % przesunięcie X dla drugiego ogniwa
l3 = 0.5;    % przesunięcie X dla trzeciego ogniwa
d3 = 0.2;    % aktualne wysunięcie pryzmatyczne

robot = rigidBodyTree('DataFormat', 'row', 'MaxNumBodies', 4);

%% --- Ogniwo 1: R ---
body1 = rigidBody('link1');
jnt1 = rigidBodyJoint('jnt1','revolute');
% DH: theta1+90, d=l1, a=0, alpha=180
setFixedTransform(jnt1, [deg2rad(90), l1, 0, pi], 'dh');
body1.Joint = jnt1;
addBody(robot, body1, 'base');

%% --- Ogniwo 2: R ---
body2 = rigidBody('link2');
jnt2 = rigidBodyJoint('jnt2','revolute');
% DH: theta2, d=0, a=l2, alpha=0
setFixedTransform(jnt2, [0, 0, l2, 0], 'dh');
body2.Joint = jnt2;
addBody(robot, body2, 'link1');

%% --- Ogniwo 3: P ---
body3 = rigidBody('link3');
jnt3 = rigidBodyJoint('jnt3','prismatic');
% DH: theta=0, d=d3, a=l3, alpha=0
setFixedTransform(jnt3, [0, 0, l3, 0], 'dh');
jnt3.PositionLimits = [0, 1];  % np. suw między 0 a 1 m
body3.Joint = jnt3;
addBody(robot, body3, 'link2');

%% --- Wyświetlenie robota ---
figure;
show(robot, 'Frames', 'on');
title('Robot RRP – model w rigidBodyTree');

%% --- Konfiguracja początkowa ---
config = homeConfiguration(robot);
config(1).JointPosition = deg2rad(30); % theta1
config(2).JointPosition = deg2rad(45); % theta2
config(3).JointPosition = 0.4;         % d3

figure;
show(robot, config, 'Frames','on');
title('Robot RRP – pozycja ustawiona');
