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
[Theta]=Sover(train_images,train_labels);
