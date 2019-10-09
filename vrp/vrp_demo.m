% ����yamlip���VRP����
clear;clc;close all;

%�����ڽӾ���,
d=load('tsp_jin.txt');
n = size(d,1);
m = 4;
Q=100;
q=load('demond.txt');

%���߱���
x = binvar(n,n,m,'full');
y = binvar(n,m);
%y1=round(rand(10,2))
u = sdpvar(1,n);

% Ŀ��
z=0;
for i=1:n
    for j=1:n
        if i~=j
            z=z+ d(i,j)*sum(x(i,j,:));
        end
    end
end


%Լ��
C = [];
% 1
for i = 2:n
    s =sum(x(i,:,:))-sum(x(i,i,:));
    C = [C,s==1];
end

% 2
for j =2:n
    for k=1:m
        C = [C, sum(x(:,j,k))==y(j,k)];
    end
end

%3
for i =2:n
    for k=1:m
        C = [C, sum(x(i,:,k))==y(i,k)];
    end
end
        
%4
for i = 2:n
    C = [C, sum(y(i,:))==1];
end

%5
C = [C, sum(x(1,2:n,:))==m];

%6 ????????
for i = 2:n
    for j = 2:n
        if i~=j
            for k= 1:2
            C = [C,u(i)-u(j) + n*x(i,j,k)<=n-1];
            end
        end
    end
end



%7        
for k = 1:m
    C = [C, sum(q(:).*y(: ,k))<=Q];
end

% ��������
% ops = sdpsettings('verbose',0);
% ���
result= optimize(C);
if result.problem == 0
    value(x)
    value(y)
    value(z)
else
    disp('�������г���');
end



