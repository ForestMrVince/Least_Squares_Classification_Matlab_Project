function [Beta]=NonLinear_solver(train_images,b,Lambda,k_Max,Theta)
%非线性求解器
%   将images中的Character挑出来，然后求解非线性最小二乘模型

%非线性求解器设置
Lambda_i = 0.1;
Beta_i = Theta;

for i = 1:k_Max
    %[output] = MNIST_nonLinear_fun(train_images,b,Lambda,Beta_i);
end

%an=[1,2,3;1,2,3;1,2,3]
%an = arrayfun(@sigmoid,an)
%https://www.ilovematlab.cn/forum.php?mod=viewthread&s_tid=NumBestAnswers&tid=329412&page=1
%https://ww2.mathworks.cn/help/symbolic/sym.taylor.html
%https://ww2.mathworks.cn/help/symbolic/jacobian.html
%https://ww2.mathworks.cn/help/matlab/ref/arrayfun.html

% a_1=sym('a_1_%d%d',[3,1]);a_2=[1,2,3];a_3=jacobian(a_2*(a_1.*a_1),(a_1))
% a_4 = [1;2;3];a_5 = subs(a_3,a_1,a_4)
% a_6 = double(a_5)

% x_double = [1,2,3;4,5,6;7,8,9]
% x_double = [ones(size(x_double,1),1),x_double]
% y = ones(size(x_double,1),1)
% y(2)=-1
% beta = sym('beta%d',[4,1])
% jacobian_matrix = jacobian(arrayfun(@sigmoid,x_double*beta)-y,beta)
% subs(jacobian_matrix,beta,[1;2;3;4])
% double(ans)

end

