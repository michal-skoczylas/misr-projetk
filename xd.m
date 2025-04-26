clc 
clear all
%REcznie wyliczone
l1 = 1;
l2 = 1;
l3 = 1;
l4 = 1;
l5 = 1;
y=0.001;
x=0.001;
z=0;

t1 = atan(y/x)-acos((x^2+y^2)/(2*sqrt(x^2+y^2)))
t2=pi-acos((x^2+y^2-2)/(-2))
d=1-z



at1=2*atan((2*l2*y - (- l2^4 + 2*l2^2*l4^2 + 2*l2^2*x^2 + 2*l2^2*y^2 - l4^4 + 2*l4^2*x^2 + 2*l4^2*y^2 - x^4 - 2*x^2*y^2 - y^4)^(1/2))/(l2^2 + 2*l2*x - l4^2 + x^2 + y^2))

at2= 2*atan(((- l2^2 + 2*l2*l4 - l4^2 + x^2 + y^2)*(l2^2 + 2*l2*l4 + l4^2 - x^2 - y^2))^(1/2)/(- l2^2 + 2*l2*l4 - l4^2 + x^2 + y^2))

ad=l1 + l3 -l5 - z
