%单摆系统仿真与建模
close all;clc;clear
g=9.8;
m=1;
L=0.2;
sim('S_example3')
save result1

g=9.8;
m=1;
L=0.5;
sim('S_example3')
save result2

m=1;
L=1;
sim('S_example3')
save result3

m=1;
L=5;
sim('S_example3')
save result4

m=1;
L=10;
sim('S_example3')
save result5

load('result1')
figure;
h1=plot(tout,simout(:,1),'b')
hold on;
grid;

load('result2')
h2=plot(tout,simout(:,1),'g')
hold on;
grid;

load('result3')
h3=plot(tout,simout(:,1),'m')
hold on;
grid;

load('result4')
h4=plot(tout,simout(:,1),'k')
hold on;
grid;

load('result5')
h5=plot(tout,simout(:,1),'y')
xlabel('t/s');ylabel('\theta')
legend([h1,h2,h3,h4,h5],'L=0.2','L=0.5','L=1','L=5','L=10')
grid


