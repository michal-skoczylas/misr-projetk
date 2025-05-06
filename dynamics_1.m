%Wyznaczenie macierzy przejsc
syms theta1 theta2 l1 l2 l3 l4 l5 d3;

T0_1=[cosd(theta1) -sind(theta1) 0 0;sind(theta1) cosd(theta1) 0 0;0 0 1 l1;0 0 0 1]*[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];

T1_2=[cosd(theta2) -sind(theta2) 0 0 ;sind(theta2) cosd(theta2) 0 0;0 0 1 l3;0 0 0 1]*[1 0 0 l4;0 cosd(180) -sind(180) 0; 0 sind(180) cosd(180) 0; 0 0 0 1];
T2_3=[1 0 0 0 ;0 1 0 0;0 0 1 l5+d3;0 0 0 1];

FK=T0_1*T1_2*T2_3;
simplify(FK);

T0_2=simplify(T0_1*T1_2);
T0_3=FK;


%Wyznaczenie OC
OC1 = 1/2*T0_1(1:3,end);
OC2 = 1/2*(T0_2(1:3,end)-T0_1(1:3,end)) +T0_1(1:3,end);
OC3 = simplify(1/2*(T0_3(1:3,end)-T0_2(1:3,end))+T0_2(1:3,end));

%Wyznaczenie Jakobianów
z0=T0_1(1:3,3);
z1=T0_1(1:3,3);
z2=T0_2(1:3,3);
p0=[0; 0; 0 ];
p1=T0_1(1:3,end);
Joc1=[cross(z0,OC1-p0) [0;0;0] [0;0;0];z0 [0;0;0] [0;0;0]];
Joc2=[cross(z0,OC2-p0) cross(z1,OC2-p1) [0;0;0];z0 z1 [0;0;0]];
Joc3 =[cross(z0,OC3-p0) cross(z1,OC3-p1) z2; z0 z1 [0;0;0]];

%Wyliczenie macierzy D
%D1
Jv1=Joc1(1:3,:);
Jw1=Joc1(4:6,:);
Jv



