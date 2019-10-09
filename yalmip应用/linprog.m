clear;clc;close all;

c = [12 5 8];
A = [2 3 1; 4 1 5];
b = [30; 15];

%决策变量
x = sdpvar(3,1);

%目标函数
z = c*x;

%添加约束
% C = [];
% C = [C; A*x >= b];
% C = [C;x>=0];
C=[A*x >= b,x>=0];


%求解
result = optimize(C,z);
if result.problem == 0    %求解成功
    x_star = double(x)
    z_star = double(z)
    else
    disp('求解过程中出错');
end
