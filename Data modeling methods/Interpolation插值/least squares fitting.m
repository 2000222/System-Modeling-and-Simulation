function N = least2(x,y,x0) %最小二乘法
syms t;
R=[];
x1=[(x').^2];
x3=ones(4,1)
R=[x1,(x'),x3];
A=inv(R'*R)*(R')*(y');
X=[t^2,t,1];
N=X*A;
N=subs(N,'t',x0);
N=vpa(N,6)
