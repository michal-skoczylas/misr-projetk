syms theta1 theta2 l1 l2 l3 l4 l5 d3 m1 m2 m3 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3;
syms theta1bis theta2bis d3bis;

R01 = [cosd(theta1) -sind(theta1) 0 ; sind(theta1) cosd(theta1) 0 ; 0 0 1];

R02 = [cosd(theta1+theta2) sind(theta1+theta2) 0 ; sind(theta1+theta2) -cosd(theta1+theta2) 0 ; 0 0 -1];

R03 = R02;

A0_1=[cosd(theta1) -sind(theta1) 0 0;sind(theta1) cosd(theta1) 0 0;0 0 1 l1;0 0 0 1]*[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];

A1_2=[cosd(theta2) -sind(theta2) 0 0 ;sind(theta2) cosd(theta2) 0 0;0 0 1 l3;0 0 0 1]*[1 0 0 l4;0 cosd(180) -sind(180) 0; 0 sind(180) cosd(180) 0; 0 0 0 1];
A2_3=[1 0 0 0 ;0 1 0 0;0 0 1 l5+d3;0 0 0 1];

ForwardKin=A0_1*A1_2*A2_3;
simplify(ForwardKin);

A0_2=simplify(A0_1*A1_2);
A0_3=ForwardKin;

R0_1 = A0_1(1:3,1:3);
R0_2 = A0_2(1:3,1:3);
R0_3 = A0_3(1:3,1:3);

OC1 = 1/2*A0_1(1:3,end);
OC2 = 1/2*(A0_2(1:3,end)-A0_1(1:3,end)) +A0_1(1:3,end);
OC3 = simplify(1/2*(A0_3(1:3,end)-A0_2(1:3,end))+A0_2(1:3,end));

Joc1=[cross(z0,OC1-p0) [0;0;0] [0;0;0];z0 [0;0;0] [0;0;0]];
Joc2=[cross(z0,OC2-p0) cross(z1,OC2-p1) [0;0;0];z0 z1 [0;0;0]];
Joc3 =[cross(z0,OC3-p0) cross(z1,OC3-p1) z2; z0 z1 [0;0;0]];


Jv1=Joc1(1:3,:);
Jw1=Joc1(4:6,:);
Jv2=Joc2(1:3,:);
Jw2=Joc2(4:6,:);
Jv3=Joc3(1:3,:);
Jw3=Joc3(4:6,:);

I1 = [Ixx1 0 0 ; 0 Iyy1 0 ; 0 0 Izz1];
I2 = [Ixx2 0 0 ; 0 Iyy2 0 ; 0 0 Izz2];
I3 = [Ixx3 0 0 ; 0 Iyy3 0 ; 0 0 Izz3];


D1 = transpose(Jv1)*Jv1*m1 + transpose(Jw1)*R0_1*I1*transpose(R0_1)*Jw1 ; 
simplify(D1);

D2 = transpose(Jv2)*Jv2*m2 + transpose(Jw2)*R0_2*I2*transpose(R0_2)*Jw2 ; 
simplify(D2);

D3 = transpose(Jv3)*Jv3*m3 + transpose(Jw3)*R0_3*I3*transpose(R0_3)*Jw3 ; 
simplify(D3);

D= D1+D2+D3;
simplify(D)


qbis = [theta1bis ; theta2bis ; d3bis];
q= [theta1 ; theta2; d3]

c111 = simplify(1/2*(diff(D(1,1,1), q(1)) ))
q(1)

cijk(1,1) = simplify(1/2*(diff(D(1,1,1), q(1)) ));



cijk = sym(zeros(3,3,3)); % tensor 3D

for i = 1:3
    for j = 1:3
        for k = 1:3
            cijk(i,j,k) = simplify(1/2*(diff(D(j,k), q(i)) + diff(D(i,k), q(j)) - diff(D(i,j), q(k))))
        end
    end
end

