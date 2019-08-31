% https://blog.csdn.net/qq_16309049/article/details/91549610




%�������
x = sdpvar(10, 1);

% ����Լ��
Constraints = [sum(x) <= 10, x(1)==0, 0.5 <= x(2) <= 1.5];	
for i = 1:7
	Constraints = [Constraints, x(i) + x(i+1)  <= x(i+2) + x(i+3)];
end

%����Ŀ�꺯��
Objective = x' * x + norm(x,1);


%ΪYALMIP�Լ����������һЩѡ��
options = sdpsettings('verbose', 1, 'solver', 'quadprog', 'quadprog.maxiter', 100)

%�������
sol = optimize(Constraints, Objective, options);


%���������־
if sol.problem == 0
	% ˵������ɹ�,��ʱչʾ�õ��Ľ��
	solution = value(x);
else
	disp('������');
	sol.info
	yalmiperror(sol.problem)
end

