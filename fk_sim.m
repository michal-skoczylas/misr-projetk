robot=SerialLink( [
    Revolute('d',0,'a',1,'alpha',pi,'offset',pi/2,'qlim',[-pi,pi])
    Revolute('d',0,'a',1,'alpha',0)
    Prismatic('theta',0,'a',10,'alpha',0)],'name','RRP');
robot.plot([0 0 0],'workspace',[-3 3 -3 3 -1 3]);
robot.display()
