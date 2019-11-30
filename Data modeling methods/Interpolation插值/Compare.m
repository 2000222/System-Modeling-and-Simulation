clear;close all;clc
%拉格朗日插值法
x=[0 500 2000 5000];
y=[1e-5 1.15e-5 1.8e-5 4.0e-5];
x0=[300 1500 3000];
y0=[];
x01=[0:300:6000]
y01=[];
for(i=1:3)
   y0=[y0,lagrange(x,y,x0(i))]
end
fprintf('拉格朗日插值法\n');
disp(y0)
for(j=1:21)
    y01=[y01,lagrange(x,y,x01(j))]
end
figure
set(gca,'fontsize',16)
h1=plot(x,y,'k-');hold on
h2=scatter(x0,y0,'k+');hold on
h5=plot(x01,y01,'m*');
xlabel('速度(m/s)');grid on;hold on
%一维线性插值法
y1=[];
for(i=1:3)
   y1=[y1,linear1(x,y,x0(i))]
end
fprintf('一维线性插值法\n');
disp(y1)
h3=plot(x0,y1,'g*');
set(gca,'fontsize',16)
xlabel('速度(m/s)');grid on;hold on
%最小二乘法
y2=[];
for(i=1:3)
   y2=[y2,least2(x,y,x0(i))]
end
y03=[];
x03=[0:300:6000];
for(j=1:21)
   y03=[y03,least2(x,y,x03(j))]
end
fprintf('最小二乘法\n');
disp(y2)
h4=scatter(x0,y2,'yo');hold on;
fprintf('y03')
disp(y03)
h6=plot(x03,y03,'b-.')
set(gca,'fontsize',16)
xlabel('速度(m/s)');ylabel('阻力系数k');grid on;
legend([h5,h1,h6],'拉格朗日插值法','一维线性插值法','最小二乘法','Location','northwest');


