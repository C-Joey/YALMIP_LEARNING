% https://blog.csdn.net/qq_16309049/article/details/91549610




%定义变量
x = sdpvar(10, 1);

% 定义约束
Constraints = [sum(x) <= 10, x(1)==0, 0.5 <= x(2) <= 1.5];	
for i = 1:7
	Constraints = [Constraints, x(i) + x(i+1)  <= x(i+2) + x(i+3)];
end

%定义目标函数
Objective = x' * x + norm(x,1);


%为YALMIP以及求解器设置一些选项
options = sdpsettings('verbose', 1, 'solver', 'quadprog', 'quadprog.maxiter', 100)

%求解问题
sol = optimize(Constraints, Objective, options);


%分析错误标志
if sol.problem == 0
	% 说明计算成功,此时展示得到的结果
	solution = value(x);
else
	disp('错了亲');
	sol.info
	yalmiperror(sol.problem)
end

