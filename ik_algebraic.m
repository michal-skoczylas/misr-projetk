syms theta1 theta2 d3 l1 l2 l3 l4 x y z

eq1 = l4*cos(theta1+theta2) + l2*cos(theta1) == x;
eq2 = l4*sin(theta1+theta2) + l2*sin(theta1) == y;
eq3 = l1 + l3 - d3 == z;

s = solve([eq1, eq2, eq3], [theta1, theta2, d3]);

% Teraz simplify każdego rozwiązania osobno:
simplify(s.theta1)
simplify(s.theta2)
simplify(s.d3)



t1=2*atan((2*l2*y + (- l2^4 + 2*l2^2*l4^2 + 2*l2^2*x^2 + 2*l2^2*y^2 - l4^4 + 2*l4^2*x^2 + 2*l4^2*y^2 - x^4 - 2*x^2*y^2 - y^4)^(1/2))/(l2^2 + 2*l2*x - l4^2 + x^2 + y^2));
t2=-2*atan(((- l2^2 + 2*l2*l4 - l4^2 + x^2 + y^2)*(l2^2 + 2*l2*l4 + l4^2 - x^2 - y^2))^(1/2)/(- l2^2 + 2*l2*l4 - l4^2 + x^2 + y^2));
d=l1 + l3 - z;


