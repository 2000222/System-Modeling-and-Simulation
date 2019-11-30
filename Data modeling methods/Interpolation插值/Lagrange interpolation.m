function L=lagrange(x,y,x0)
%   x为已知数据点的x坐标
%   y为已知数据点的y坐标
%   x0为插值点的x坐标
%   f为求得的拉格朗日多项式
%   f0为在x0处的插值
syms t;%申明变量，否则不可使用，t即为公式中的x
L=0;%初始化
n=length(x)
for(i=1:n)
    e=y(i);
    for(j=1:i-1)
        e=e*((t-x(j))/(x(i)-x(j)));
    end
    for(j=i+1:n)
        e=e*((t-x(j))/(x(i)-x(j)));
    end
    L=L+e;
    L= simplify(L);      %多项式化简
    L = subs(L,'t',x0);  %计算插值点的函数值,解释一下subs的意思， 在函数L中用‘x0’替换‘t’，计算赋给L.
    L = vpa(L,6);        %设置精度，为有效数字位数
end   