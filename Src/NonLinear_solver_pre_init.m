function [beta_char,pre_fun] = NonLinear_solver_pre_init(train_images)
%�����������Ԥ��ʼ��
%   ��

window = waitbar(0,'�����������Ԥ��ʼ���У����Ժ�');

beta_char = sym('b%d',[size(train_images,2),1]);
Sigmoid_array = sym('S%d',[size(train_images,1),1]);
i_max = size(train_images,1);
waitbar(1/(3+i_max));
parfor i = 1:i_max
    Sigmoid_array(i) = train_images(i,:)*beta_char;
    waitbar((2+i)/(3+i_max));
end
waitbar((2+i_max)/(3+i_max));
pre_fun = arrayfun(@sigmoid,Sigmoid_array);
waitbar((3+i_max)/(3+i_max));

close(window);

end

