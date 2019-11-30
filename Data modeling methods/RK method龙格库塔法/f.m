function [dx]=f(t,x)
u=x(1)-x(2);
dx=[-3 0.5;-1 -7]*x+[0;1]*u;
end