clear;clc;close all;

c = [1 3 5 7 13; 6 4 3 14 8; 13 3 1 7 4;
    1 10 12 7 11];
a = [40 50 30 80];
b = [10 20 15 18 25];

%决策变量
x = intvar(4,5);

%目标函数
z = sum(sum(c.*x));

%添加约束
C = [];
for i=1:4
    C = [C; sum(x(i,:))<=a(i)];
end
for j=1:5
    C = [C;sum(x(:,j))>=b(j)];
end

C = [C;x>=0];

result = optimize(C,z);
if result.problem == 0    %求解成功
    x_star = double(x)  
    z_star = double(z)
    else
    disp('求解过程中出错');
end