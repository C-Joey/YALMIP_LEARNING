clear;clc;close all;

c = [12 5 8];
A = [2 3 1; 4 1 5];
b = [30; 15];

%���߱���
x = sdpvar(3,1);

%Ŀ�꺯��
z = c*x;

%���Լ��
% C = [];
% C = [C; A*x >= b];
% C = [C;x>=0];
C=[A*x >= b,x>=0];


%���
result = optimize(C,z);
if result.problem == 0    %���ɹ�
    x_star = double(x)
    z_star = double(z)
    else
    disp('�������г���');
end
