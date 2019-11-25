function [fun,jacobian_matrix_fun] = NonLinear_solver_init(beta_char,pre_fun,b)
%非线性求解器初始化
%   无

window = waitbar(0,'非线性求解器初始化中，请稍候！');

fun = pre_fun-b;
waitbar(3/4);
jacobian_matrix_fun = jacobian(fun,beta_char);
waitbar(4/4);

close(window);

end

