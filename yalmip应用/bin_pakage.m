clear;clc;close all;
c =load('zhipai.txt');


%���߱���
x = binvar(5,5,'full');

%Ŀ�꺯��
z = sum(sum(c.*x));

%���Լ��
C = [];

C = [C; sum(x,1)==1];   %  1 �������
C = [C; sum(x,2)==1];   %  2 ������� 

ops=sdpsettings('verbose',0);
%���
result = optimize(C,z,ops);
if result.problem == 0    %���ɹ�
    x_star = double(x);
    z_star = double(z);
    else
    disp('�������г���');
end