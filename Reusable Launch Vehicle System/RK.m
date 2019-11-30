clear all;clc;close all;  
h=0.1;%仿真步长 
SimTime=100;%仿真总时长  
r=zeros(1,SimTime/h);%高度 
v=zeros(1,SimTime/h);%速度 
m=zeros(1,SimTime/h);%质量 
time=zeros(1,SimTime/h);%时间  
r(1)=80000;%初始高度 
v(1)=-5000;%初始速度
m(1)=200*10^3;%初始质量 
time(1)=0;%开始时间  
T=7600*10^3;%单个发动机推力  
work_num_table=[9,9,0,0,2,2,0,0,2,2,0,0,1,1,0,0];%工作发动机个数
t_stage_table=[0,7.3,7.4,67.9,68.0,69.3,69.4,73.3,73.4,73.9,74.0,74.5,74.6, 74.8,74.9,100];%工作发动机时间  
v_table=[0,500,2000,5000];%速度插值表 
k_table=[1e-5,1.5e-5,1.8e-5,2.0e-5];%阻力系数k插值表  
x(:,1)=[r(1);v(1);m(1)];  
for i=1:SimTime/h-1  
    xtemp = abs(x(2,i));     
    if xtemp>5000        
        xtemp = 5000;     
    end %超出速度范围不外插    
    k = interp1(v_table,k_table,xtemp);    
    num = interp1(t_stage_table,work_num_table,time(i),'nearest');     
    T_all=num*T;          
    K1 = ff(x(:,i),T_all,k);     
    K2 = ff (x(:,i)+h/2*K1,T_all,k);    
    K3 = ff (x(:,i)+h/2*K2,T_all,k);     
    K4 = ff (x(:,i)+h*K3,T_all,k);     
    x(:,i+1) = x(:,i)+h/6*(K1+2*K2+2*K3+K4);  
    time(i+1) = i*h; 
end  
fprintf('x=\n')
disp(x')
figure(1) 
plot(time,x(1,:),'r'); xlabel('t/s'); ylabel('r/m'); grid on;  
figure(2) 
plot(time,x(2,:),'b'); xlabel('t/s'); ylabel('v/(m/s)'); grid on; 
figure(3) 
plot(time,x(3,:),'g'); grid on; xlabel('t/s'); ylabel('m/kg');