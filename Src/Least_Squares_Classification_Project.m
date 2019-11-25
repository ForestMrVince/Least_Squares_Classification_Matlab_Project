%环境初始化
clc;
clear;

%初始化运算变量
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file = '../Data/MNIST/t10k-labels.idx1-ubyte';
Character = 0;  %需要挑选的变量
Lambda = 100;   %Lambda值
k_Max = 6;      %最大循环次数

%先读取所有的文件内容并进行特征工程
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%删除文件路径
clearvars train_images_file train_labels_file test_images_file test_labels_file;
%非线性求解器预初始化
[beta_char,pre_fun] = NonLinear_solver_pre_init(train_images);

%求解器
%线性
[Theta,b]=Linear_solver(train_images,train_labels,Character);
%非线性
[fun,jacobian_matrix_fun] = NonLinear_solver_init(beta_char,pre_fun,b);%初始化
[beta,k]=NonLinear_solver(Lambda,k_Max,Theta,beta_char,fun,jacobian_matrix_fun);

%求解器结果测试
% %线性
% [train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
%     test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]...
%     =Linear_solver_test(Theta,train_images,train_labels,test_images,test_labels,Character);
%非线性
[train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]...
    =NoLinear_solver_test(Theta,train_images,train_labels,test_images,test_labels,Character);

%输出结果
Results_output_xlsx(train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong);
