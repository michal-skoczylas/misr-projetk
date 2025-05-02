syms theta1 theta2 l1 l2 l3 l4 l5 d3;

dh = [
    theta1 1 1 0;
    theta2 1 1 pi;
    0 d3 0 0
];

L(1) = Link('revolute','d',1,'a',1,'alpha',0);
L(2)= Link('revolute','d',1,'a',1,'alpha',pi);
L(3) = Link('prismatic','theta',0,'a',0,'alpha',0,'offset',1);

q=[1 2 0.5];
robot = SerialLink(L,'name','RRP');
robot.plot(q,'workspace', [-3 3 -3 3 -1 3]);

display(robot.fkine(q))

