syms theta1 theta2 l1 l2 l3 l4 l5 d3 m1 m2 m3 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3;
syms theta1bis theta2bis d3bis;

R01 = [cosd(theta1) -sind(theta1) 0 ; sind(theta1) cosd(theta1) 0 ; 0 0 1];

R02 = [cosd(theta1+theta2) sind(theta1+theta2) 0 ; sind(theta1+theta2) -cosd(theta1+theta2) 0 ; 0 0 -1];

R03 = R02;

Jv1 = [(l2*sind(theta1))/2 0 0 ; -(l2*cosd(theta1))/2 0 0 ; 0 0 0];
Jw1= [0 0 0 ; 0 0 0 ; 1 0 0];

Jv2= [ (l2*sind(theta1)+(l4*sind(theta1+theta2))/2) (l4*sind(theta1+theta2))/2 0 ;
    (-l2*cosd(theta1)+(l4*cosd(theta1+theta2))/2) (l4*cosd(theta1+theta2))/2 0 ; 0 0 0];
Jw2 = [0 0 0 ; 0 0 0 ; 1 1 0];

Jv3 = [ l2*sind(theta1)+l4*sind(theta1+theta2) l4*sind(theta1+theta2) 0 ;
    -l2*cosd(theta1)+l4*cosd(theta1+theta2) l4*cosd(theta1+theta2) 0 ; 0 0 0];
Jw3 = [0 0 0; 0 0 0; 1 1 -1];

I1 = [Ixx1 0 0 ; 0 Iyy1 0 ; 0 0 Izz1];
I2 = [Ixx2 0 0 ; 0 Iyy2 0 ; 0 0 Izz2];
I3 = [Ixx3 0 0 ; 0 Iyy3 0 ; 0 0 Izz3];


D1 = transpose(Jv1)*Jv1*m1 + transpose(Jw1)*R01*I1*transpose(R01)*Jw1 ; 
simplify(D1);

D2 = transpose(Jv2)*Jv2*m2 + transpose(Jw2)*R02*I2*transpose(R02)*Jw2 ; 
simplify(D2)

D3 = transpose(Jv3)*Jv3*m3 + transpose(Jw3)*R03*I3*transpose(R03)*Jw3 ; 
simplify(D3);

D= D1+D2+D3;
simplify(D)

qbis = [theta1bis ; theta2bis ; d3bis];
