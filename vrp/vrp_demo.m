% ����yamlip���VRP����
clear;clc;close all;

%�����ڽӾ���
d=load('text-name');
n = size(d,1);
m = 1;

%���߱���
x = binvar(n,n,m,full);
y = binvar();