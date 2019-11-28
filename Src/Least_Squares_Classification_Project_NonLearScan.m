%环境初始化
clc;
clear;

%初始化运算变量
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file  = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file  = '../Data/MNIST/t10k-labels.idx1-ubyte';
Character = 0;                  %需要挑选的变量
Lambda = linspace(1e-5,1e3,9);	%Lambda值
k_Max = linspace(1,10,10);      %最大循环次数
m = size(Lambda,2);
n = size(k_Max,2);
train_Z_right  = zeros(m,n);
train_Z_wrong  = zeros(m,n);
train_NZ_right = zeros(m,n);
train_NZ_wrong = zeros(m,n);
test_Z_right   = zeros(m,n);
test_Z_wrong   = zeros(m,n);
test_NZ_right  = zeros(m,n);
test_NZ_wrong  = zeros(m,n);
k = zeros(m,n);

%先读取所有的文件内容并进行特征工程
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%删除文件路径
clearvars train_images_file train_labels_file test_images_file test_labels_file;

%求解器
%线性
[Theta,b]=Linear_solver(train_images,train_labels,Character);

main_window = waitbar(0,'非线性求解扫描中，请稍候！');
for m_i = 1:m
    for n_j = 1:n
%非线性
        [beta,k(m_i,n_j)]=NonLinear_solver(Lambda(m_i),k_Max(n_j),Theta,b,train_images);

%求解器结果测试
%非线性
        [train_Z_right(m_i,n_j),train_Z_wrong(m_i,n_j),train_NZ_right(m_i,n_j),train_NZ_wrong(m_i,n_j),...
            test_Z_right(m_i,n_j),test_Z_wrong(m_i,n_j),test_NZ_right(m_i,n_j),test_NZ_wrong(m_i,n_j)]...
            =NonLinear_solver_test(beta,train_images,train_labels,test_images,test_labels,Character);
    end
    waitbar(m_i/m);
end
close(main_window);