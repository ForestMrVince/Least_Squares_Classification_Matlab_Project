function [fun,jacobian_matrix_fun] = NonLinear_solver_init(beta_char,pre_fun,b)
%�������������ʼ��
%   ��

window = waitbar(0,'�������������ʼ���У����Ժ�');

fun = pre_fun-b;
waitbar(3/4);
jacobian_matrix_fun = jacobian(fun,beta_char);
waitbar(4/4);

close(window);

end

