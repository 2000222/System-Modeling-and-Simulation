function dv=hj(t,r,v,m) %9个发动机
r0=6.371*1000000;
g0=9.8;
x=[0,500,2000,5000];
y=[10^-5,1.5*10^-5,1.8*10^-5,2.0*10^-5];
if abs(v)>0 & abs(v)<5000
    k=interp1(x,y,abs(v),'linear');
else
    k=2.0*10^-5
end
T=9*7600*1000;
Isp=342;
dv=-g0*(r0/(r+r0))^2+T/m-k*v*abs(v)/m;
end