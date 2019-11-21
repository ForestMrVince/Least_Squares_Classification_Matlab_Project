function [train_images,train_labels,test_images,test_labels] = Project_Init(train_images_file,train_labels_file,test_images_file,test_labels_file)
%工程初始化
%   读取数据文件并进行数据预处理

%读取文件
train_images = Read_image(train_images_file);
train_labels = Read_label(train_labels_file);
test_images = Read_image(test_images_file);
test_labels = Read_label(test_labels_file);
%转置
train_images = train_images.';
train_labels = train_labels.';
test_images = test_images.';
test_labels = test_labels.';

%清除0元素过多的列
[train_images,test_images] = images_zero_columes_erase(train_images,test_images);

%特征工程
[train_images,test_images] = FeatureExtraction(train_images,test_images);

end

