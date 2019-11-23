function [Theta,b] = Linear_solver(train_images,train_labels,Character)
%线性求解器
%   将images中的Character挑出来，然后求解线性最小二乘模型

train_images_m = size(train_images,1);

b = train_labels;
A = train_images;

window = waitbar(0,'向量b生成中，请稍候！');
for i = 1:train_images_m
    if train_labels(i) == Character
        b(i) = 1;
    else
        b(i) = -1;
    end
    waitbar(i/train_images_m);
end
close(window);

window = waitbar(0,'线性求解中，请稍候！');
[Q,R]=qr(A,0);
waitbar(2/5);
Q_T = Q.';
Matrix_temp = Q_T*b;
waitbar(3/5);
Theta = R\Matrix_temp;
waitbar(5/5);
close(window);

end

