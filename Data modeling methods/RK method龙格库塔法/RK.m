clear ;close all;clc
h=0.01;%步长
n=1000;%次数
X(1,:)=[0.3 -0.7];%初始值
t=0;
T(1)=0;
Y=size(n);
for (i=1:n)
   x=X(i,:)';
   K1=f(t,x);
   K2=f(t+h/2,x+(h/2)*K1);
   K3=f(t+h/2,x+(h/2)*K2);
   K4=f(t,x+h*K3);
   X(i+1,:)=X(i,:)+h/6*(K1+2*K2+2*K3+K4)';
   T(i+1)=T(i)+h;
end
Y=X(:,1)-2*X(:,2);
figure;
subplot(2,1,1);plot(T,X(:,1),'b-');
xlabel('t/s');legend('x1');
subplot(2,1,2);plot(T,X(:,2),'g--');
xlabel('t/s');legend('x2');
figure;
plot(T,Y);
xlabel('t/s');ylabel('y');








