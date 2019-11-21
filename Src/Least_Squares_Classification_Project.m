%环境初始化
clc;
clear;

%初始化运算变量
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file = '../Data/MNIST/t10k-labels.idx1-ubyte';

%第一步：先读取所有的文件内容
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%删除文件路径
clearvars train_images_file train_labels_file test_images_file test_labels_file;

%求解器初始化
[Theta]=Solver(train_images,train_labels);

%测试
[train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]=test(Theta,train_images,train_labels,test_images,test_labels);
