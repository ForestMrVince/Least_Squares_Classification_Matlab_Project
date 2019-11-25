function [beta_char,pre_fun] = NonLinear_solver_pre_init(train_images)
%非线性求解器预初始化
%   无

window = waitbar(0,'非线性求解器预初始化中，请稍候！');

beta_char = sym('b%d',[size(train_images,2),1]);
pre_fun = sym('p%d',[size(train_images,1),1]);
i_max = size(train_images,1);
waitbar(1/(1+i_max));

parfor i = 1:i_max
    pre_fun(i) = sigmoid(train_images(i,:)*beta_char);
end
waitbar((1+i_max)/(1+i_max));%生成一个雅各布矩阵的行模板，然后向内带入元素

close(window);

end

