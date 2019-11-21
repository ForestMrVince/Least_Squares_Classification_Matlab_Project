%������ʼ��
clc;
clear;

%��ʼ���������
train_images_file = '../Data/MNIST/train-images.idx3-ubyte';
train_labels_file = '../Data/MNIST/train-labels.idx1-ubyte';
test_images_file = '../Data/MNIST/t10k-images.idx3-ubyte';
test_labels_file = '../Data/MNIST/t10k-labels.idx1-ubyte';

%��һ�����ȶ�ȡ���е��ļ�����
[train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file);
%ɾ���ļ�·��
clearvars train_images_file train_labels_file test_images_file test_labels_file;

%�������ʼ��
[Theta]=Solver(train_images,train_labels);

%����
[train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]=test(Theta,train_images,train_labels,test_images,test_labels);
