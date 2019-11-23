function [Theta,b] = Linear_solver(train_images,train_labels,Character)
%���������
%   ��images�е�Character��������Ȼ�����������С����ģ��

train_images_m = size(train_images,1);

b = train_labels;
A = train_images;

window = waitbar(0,'����b�����У����Ժ�');
for i = 1:train_images_m
    if train_labels(i) == Character
        b(i) = 1;
    else
        b(i) = -1;
    end
    waitbar(i/train_images_m);
end
close(window);

window = waitbar(0,'��������У����Ժ�');
[Q,R]=qr(A,0);
waitbar(2/5);
Q_T = Q.';
Matrix_temp = Q_T*b;
waitbar(3/5);
Theta = R\Matrix_temp;
waitbar(5/5);
close(window);

end

