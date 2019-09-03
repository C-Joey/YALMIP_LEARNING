% 利用yamlip求解VRP问题
clear;clc;close all;

%载入邻接矩阵
d=load('text-name');
n = size(d,1);
m = 1;

%决策变量
x = binvar(n,n,m,full);
y = binvar();