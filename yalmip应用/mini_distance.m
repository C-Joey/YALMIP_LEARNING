% ����yamlip������·����
clear;clc;close all;
C = load('1.txt');
n = size(C,1);

% ���߱���
x = binvar(n,n,'full');

% Ŀ��
z=sum(sum(C.*x));
% Լ�����
C=[];
C = [C,(sum(x(1,:))-sum(x(:,1))==1)];
C = [C,(sum(x(n,:))-sum(x(:,n))==-1)];

for i=2:(n-1)
    C = [C,(sum(x(i,:))-sum(x(:,i))==0)];
end

% ���
result=solvesdp(C,z);
if result.problem == 0
    x_star = value(x)
    z_star = value(z)
else
    disp('�������г���');
end










