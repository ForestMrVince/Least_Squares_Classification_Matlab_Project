function [train_images_output,test_images_output] = images_zero_columes_erase(train_images_input,test_images_input)
%ɾ��0Ԫ�ع����images����ֵ
%   ɾ����0Ԫ������600����images����ֵ

columes_zero_numbers = 0;

train_images_output = train_images_input;
test_images_output = test_images_input;

train_images_input_cols_size = size(train_images_input,2);
train_images_input_row_size = size(train_images_input,1);

window = waitbar(0,'ɾ��0Ԫ�ع����images����ֵ�У����Ժ�');

for i = train_images_input_cols_size:-1:1
    for j = 1:train_images_input_row_size
        if train_images_input(j,i) ~= 0
            columes_zero_numbers = columes_zero_numbers + 1;
        end
    end
    if columes_zero_numbers < 600
        train_images_output(:,i)=[];
        test_images_output(:,i)=[];
    end
    columes_zero_numbers = 0;
    waitbar((train_images_input_cols_size-i)/train_images_input_cols_size)
end

close(window);

end

