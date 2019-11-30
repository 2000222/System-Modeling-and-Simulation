function L=lagrange(x,y,x0)
%   xΪ��֪���ݵ��x����
%   yΪ��֪���ݵ��y����
%   x0Ϊ��ֵ���x����
%   fΪ��õ��������ն���ʽ
%   f0Ϊ��x0���Ĳ�ֵ
syms t;%�������������򲻿�ʹ�ã�t��Ϊ��ʽ�е�x
L=0;%��ʼ��
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
    L= simplify(L);      %����ʽ����
    L = subs(L,'t',x0);  %�����ֵ��ĺ���ֵ,����һ��subs����˼�� �ں���L���á�x0���滻��t�������㸳��L.
    L = vpa(L,6);        %���þ��ȣ�Ϊ��Ч����λ��
end   