function [beta_char,pre_fun] = NonLinear_solver_pre_init(train_images)
%�����������Ԥ��ʼ��
%   ��

window = waitbar(0,'�����������Ԥ��ʼ���У����Ժ�');

beta_char = sym('b%d',[size(train_images,2),1]);
pre_fun = sym('p%d',[size(train_images,1),1]);
i_max = size(train_images,1);
waitbar(1/(1+i_max));

parfor i = 1:i_max
    pre_fun(i) = sigmoid(train_images(i,:)*beta_char);
end
waitbar((1+i_max)/(1+i_max));%����һ���Ÿ����������ģ�壬Ȼ�����ڴ���Ԫ��

close(window);

end

