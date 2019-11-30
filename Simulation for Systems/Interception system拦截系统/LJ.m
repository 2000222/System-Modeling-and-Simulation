%根据仿真数据绘制相关变量曲线
clear;close all;clc;N = 3;
sim('S_example4')
data1=[Data(:,1:16),t,Data(:,17)];

N = 2.5;
sim('S_example4')
data2=[Data(:,1:16),t,Data(:,17)];

N = 3.5;
sim('S_example4')
data3=[Data(:,1:16),t,Data(:,17)];

rad2Deg=180/pi;

figure(1); %轨迹
h1=plot(data1(:,1),data1(:,2),'b.-');
hold on;
plot(data1(:,3),data1(:,4),'r.-');hold on;

figure(1); %轨迹
h2=plot(data2(:,1),data2(:,2),'g.-');
hold on;
plot(data2(:,3),data2(:,4),'r.-');hold on;

figure(1); %轨迹
h3=plot(data3(:,1),data3(:,2),'k.-');
hold on;
plot(data3(:,3),data3(:,4),'r.-');hold on;
title('Trajectory');
xlabel('x/m')
ylabel('y/m')
legend([h1,h2,h3],'N=3','N=2.5','N=3.5')

figure(2);%攻角
h4=plot(data1(:,17),data1(:,18)*rad2Deg);hold on;
h5=plot(data2(:,17),data2(:,18)*rad2Deg);hold on;
h6=plot(data3(:,17),data3(:,18)*rad2Deg);
title('alpha');
xlabel('t/s')
ylabel('\alpha/deg')
legend([h4,h5,h6],'N=3','N=2.5','N=3.5')