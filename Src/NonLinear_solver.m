function [beta,k]=NonLinear_solver(Lambda,k_Max,Theta,beta_char,fun,size_2)
%非线性求解器
%   将images中的Character挑出来，然后求解非线性最小二乘模型

window = waitbar(0,'非线性求解中，请稍候！');

%非线性求解器设置
k = 0;
beta_i1 = Theta;
Epsilon = 0.0001;

%初始量
j_max = size(fun,1);
jacobian_matrix = ones(j_max,size_2);

%第一个f的值
beta_i0 = beta_i1;
f = subs(fun,beta_char,beta_i0);
waitbar(1/(3+k_Max));
f = double(f);
waitbar(3/(3+k_Max));

for i = 1:k_Max
    if sum(f) < Epsilon
       break; 
    end
    
    beta_i0 = beta_i1;
    f = f_1;
    
    MyPar = parpool;
    parfor j = 1:j_max
        jacobian_matrix_row_fun = jacobian(fun(j),beta_char);
        jacobian_matrix_row = subs(jacobian_matrix_row_fun,beta_char,beta_i0);
        jacobian_matrix(j,:) = double(jacobian_matrix_row);
    end
    delete(MyPar);
    
    beta_i1 = beta_i0 - ((jacobian_matrix.')*jacobian_matrix+Lambda*I)\(Lambda*beta_i0+(jacobian_matrix.')*f);
    
    f_1 = subs(fun,beta_char,beta_i1);
    f_1 = double(f_1);
    
    if f_1 > f
        break;
    end
    
    k = i;
    
    waitbar((3+k)/(3+k_Max));
end

beta = beta_i0;

waitbar((3+k_Max)/(3+k_Max));

close(window);

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
% f = arrayfun(@sigmoid,x_double*beta)-y
% jacobian_matrix = jacobian(f,beta)
% subs(jacobian_matrix,beta,[1;2;3;4])
% double(ans)

end

