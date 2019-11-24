%������ʼ��
clc;
clear;

%��ʼ���������
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file = '../Data/MNIST/t10k-labels.idx1-ubyte';
Character = 0;  %��Ҫ��ѡ�ı���
Lambda = 100;   %Lambdaֵ
k_Max = 6;      %���ѭ������

%�ȶ�ȡ���е��ļ����ݲ�������������
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%ɾ���ļ�·��
clearvars train_images_file train_labels_file test_images_file test_labels_file;

%�����
%����
[Theta,b]=Linear_solver(train_images,train_labels,Character);
%������
[beta,k]=NonLinear_solver(train_images,b,Lambda,k_Max,Theta);

%������������
% %����
% [train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
%     test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]...
%     =Linear_solver_test(Theta,train_images,train_labels,test_images,test_labels,Character);
%������
[train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]...
    =NoLinear_solver_test(Theta,train_images,train_labels,test_images,test_labels,Character);

%������
Results_output_xlsx(train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong);
