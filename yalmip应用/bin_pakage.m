clear;clc;close all;
c =load('zhipai.txt');


%决策变量
x = binvar(5,5,'full');

%目标函数
z = sum(sum(c.*x));

%添加约束
C = [];

C = [C; sum(x,1)==1];   %  1 横向相加
C = [C; sum(x,2)==1];   %  2 纵向相加 

ops=sdpsettings('verbose',0);
%求解
result = optimize(C,z,ops);
if result.problem == 0    %求解成功
    x_star = double(x);
    z_star = double(z);
    else
    disp('求解过程中出错');
end