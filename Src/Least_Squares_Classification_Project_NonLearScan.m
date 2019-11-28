%������ʼ��
clc;
clear;

%��ʼ���������
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file  = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file  = '../Data/MNIST/t10k-labels.idx1-ubyte';
Character = 0;                  %��Ҫ��ѡ�ı���
Lambda = linspace(1e-5,1e3,9);	%Lambdaֵ
k_Max = linspace(1,10,10);      %���ѭ������
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

%�ȶ�ȡ���е��ļ����ݲ�������������
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%ɾ���ļ�·��
clearvars train_images_file train_labels_file test_images_file test_labels_file;

%�����
%����
[Theta,b]=Linear_solver(train_images,train_labels,Character);

for i = 1:m
    for j = 1:n
%������
        [beta,k(i,j)]=NonLinear_solver(Lambda(i),k_Max(j),Theta,b,train_images);

%������������
%������
        [train_Z_right(i,j),train_Z_wrong(i,j),train_NZ_right(i,j),train_NZ_wrong(i,j),...
            test_Z_right(i,j),test_Z_wrong(i,j),test_NZ_right(i,j),test_NZ_wrong(i,j)]...
            =NonLinear_solver_test(beta,train_images,train_labels,test_images,test_labels,Character);
    end
end