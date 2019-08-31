x = sdpvar(1,2);

C = [
    x(1)+x(2) >=2
    x(2)-x(1) <=1
    x(1) <=1
    ];

ops;

z = -(x(1)+2*x(2))/(2*x(1)+x(2));

result = optimize(C,z,ops);
