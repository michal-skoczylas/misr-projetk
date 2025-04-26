syms theta1 theta2 l1 l2 l3 l4 l5 d3;

T0_1=[cosd(theta1) -sind(theta1) 0 0;sind(theta1) cosd(theta1) 0 0;0 0 1 l1;0 0 0 1]*[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];

T1_2=[cosd(theta2) -sind(theta2) 0 0 ;sind(theta2) cosd(theta2) 0 0;0 0 1 l3;0 0 0 1]*[1 0 0 l4;0 cosd(180) -sind(180) 0; 0 sind(180) cosd(180) 0; 0 0 0 1];
T2_3=[1 0 0 0 ;0 1 0 0;0 0 1 l5+d3;0 0 0 1];

FK=T0_1*T1_2*T2_3;
simplify(FK)