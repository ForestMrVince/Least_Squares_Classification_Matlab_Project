function [train_images_output,test_images_output] = random_feature(train_images_input,test_images_input)
%增加随机特征
%   增加5000个随机特征

train_images_output = train_images_input;
test_images_output = test_images_input;

image_leagth = size(train_images_input,2);

R = randsrc(5000,image_leagth);
R_T = (R.');

train_images_insert = train_images_input*R_T;
test_images_insert = test_images_input*R_T;

train_images_insert(train_images_insert<0)=0;
test_images_insert(test_images_insert<0)=0;

train_images_output = [train_images_output,train_images_insert];
test_images_output = [test_images_output,test_images_insert];

end

