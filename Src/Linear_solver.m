function [Theta] = Linear_solver(train_images,train_labels,Character)
%���������
%   ��images�е�Character��������Ȼ�����������С����ģ��

train_images_m = size(train_images,1);

Character_vec = Character*ones(train_images_m,1);

b = arrayfun(@b_generate,train_labels,Character_vec);

window = waitbar(0,'��������У����Ժ�');
[Q,R]=qr(train_images,0);
waitbar(2/5);
Q_T = Q.';
Matrix_temp = Q_T*b;
waitbar(3/5);
Theta = R\Matrix_temp;
waitbar(5/5);
close(window);

end

