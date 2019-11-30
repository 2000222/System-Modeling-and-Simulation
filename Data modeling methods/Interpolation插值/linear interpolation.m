function M = linear1(x,y,x0) %一维线性插值
syms t; 
n=length(x);
M=0;
for(i=1:n)
    if x0>x(i)& x(i+1)>x0
           M=y(i)*(t-x(i+1))/(x(i)-x(i+1))+y(i+1)*(t-x(i))/(x(i+1)-x(i));    
       end
    M=subs(M,'t',x0);
    M=vpa(M,6);  %设置精度，为有效数字位数
end