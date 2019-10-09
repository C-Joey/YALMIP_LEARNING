% 利用yamlip求解最短路问题
clear;clc;close all;
C = load('1.txt');
n = size(C,1);

% 决策变量
x = binvar(n,n,'full');

% 目标
z=sum(sum(C.*x));
% 约束添加
C=[];
C = [C,(sum(x(1,:))-sum(x(:,1))==1)];
C = [C,(sum(x(n,:))-sum(x(:,n))==-1)];

for i=2:(n-1)
    C = [C,(sum(x(i,:))-sum(x(:,i))==0)];
end

% 求解
result=solvesdp(C,z);
if result.problem == 0
    x_star = value(x)
    z_star = value(z)
else
    disp('求解过程中出错');
end










