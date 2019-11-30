function dx = ff (x,T,k)  %Î¢·Ö  
g0=9.8; r0=6371000.0; Isp=342;  
r=x(1); v=x(2); m=x(3);  
dot_r=v; 
dot_v=-g0*(r0/(r+r0))^2+T/m-k*v*abs(v)/m; 
dot_m=-T/(Isp*g0);  
dx = [dot_r;dot_v;dot_m]; 
end 