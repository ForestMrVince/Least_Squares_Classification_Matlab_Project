function [train_images_output,test_images_output] = FeatureExtraction(train_images_input,test_images_input)
%��������
%   ����һ��ȫΪ1�ĵ�һ��
train_images_new_columes = ones(size(train_images_input,1),1);
test_images_new_columes = ones(size(test_images_input,1),1);

train_images_output = [train_images_new_columes,train_images_input];
test_images_output = [test_images_new_columes,test_images_input];

%�����������
[train_images_output,test_images_output] = random_feature(train_images_output,test_images_output);

end

