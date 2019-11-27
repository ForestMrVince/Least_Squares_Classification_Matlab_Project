function [beta,k]=NonLinear_solver(Lambda,k_Max,Theta,b,train_images)
%�����������
%   ��images�е�Character��������Ȼ������������С����ģ��

window = waitbar(0,'����������У����Ժ�');

%��ʼ��
n = size(train_images,2);
I = eye(n);
B_Zero1 = zeros(n-1,1);%����ϵ����Lambda����Ӧ�ľ���B���ĵ�һ��
B_I = eye(n-1);%����ϵ����Lambda����Ӧ�ľ���B���ĵ�һ�к������

%���������������
k = 0;
% beta_i1 = zeros(n,1);
beta_i1 = Theta;
Epsilon = 0.0000000001;
Lambda_k = 0.1;

% %��ʼ��
% beta_i0 = beta_i1;
% f = arrayfun(@sigmoid,(train_images*beta_i0))-b;
% waitbar(3/(3+k_Max));

for i = 1:k_Max
    
    beta_i0 = beta_i1;
    
    f_0_before_b = arrayfun(@sigmoid,(train_images*beta_i0));                       %���Ÿ�������
    jacobian_matrix = arrayfun(@sigmoid_derivative,f_0_before_b).*train_images;     %���Ÿ�������
    f_0 = f_0_before_b - b;     %���ʱf�����ֵ
    B = [B_Zero1,B_I];          %��Lambda��Ӧ����
    beta_i1 = beta_i0 - ((jacobian_matrix.')*jacobian_matrix+Lambda*(B.')*B+Lambda_k*I)\(Lambda*(B.')*B*beta_i0+(jacobian_matrix.')*f_0);
    %����׼��������С���˼��㹫ʽ�����Ľ��
    
    if ((f_0.')*f_0) < Epsilon
        break;
    end
    
    if i == 1
        f_1 = f_0;
    else
        if ((f_1.')*f_1) < ((f_0.')*f_0)
            break;
        else
            f_1 = f_0;
            if beta_i1 == beta_i0
                Lambda_k = 2*Lambda_k;
            else
                Lambda_k = 0.8*Lambda_k;
            end
        end
    end
    
    k = i;
    
    waitbar(k/k_Max);
end

beta = beta_i0;

waitbar(k_Max/k_Max);

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

