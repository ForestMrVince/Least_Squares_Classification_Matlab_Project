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

main_window = waitbar(0,'���������ɨ���У����Ժ�');
for m_i = 1:m
    for n_j = 1:n
%������
        [beta,k(m_i,n_j)]=NonLinear_solver(Lambda(m_i),k_Max(n_j),Theta,b,train_images);

%������������
%������
        [train_Z_right(m_i,n_j),train_Z_wrong(m_i,n_j),train_NZ_right(m_i,n_j),train_NZ_wrong(m_i,n_j),...
            test_Z_right(m_i,n_j),test_Z_wrong(m_i,n_j),test_NZ_right(m_i,n_j),test_NZ_wrong(m_i,n_j)]...
            =NonLinear_solver_test(beta,train_images,train_labels,test_images,test_labels,Character);
    end
    waitbar(m_i/m);
end
close(main_window);