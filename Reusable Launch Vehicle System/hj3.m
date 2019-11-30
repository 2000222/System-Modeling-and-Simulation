function dv=hj3(t,r,v,m)  %2个发动机
r0=6.371*1000000;
g0=9.8;
if abs(v)>0 & abs(v)<5000
   k=interp1(x,y,abs(v),'linear'); 
else
   k=2.0*10^-5   
end
T=2*7600*1000;
Isp=342;
dv=-g0*(r0/(r+r0))^2+T/m-k*v*abs(v)/m;
end