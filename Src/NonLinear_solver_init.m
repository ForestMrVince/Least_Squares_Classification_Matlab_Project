function [fun,jacobian_matrix_fun] = NonLinear_solver_init(beta_char,pre_fun,b)
%�������������ʼ��
%   ��

window = waitbar(0,'�������������ʼ���У����Ժ�');

i_max = size(b,1);
fun = sym('f%d',[size(pre_fun,1),1]);

parfor i = 1:i_max
    fun(i) = pre_fun(i)-b(i);
end
waitbar(3/4);
jacobian_matrix_fun = jacobian(fun,beta_char);
waitbar(4/4);

close(window);

end

