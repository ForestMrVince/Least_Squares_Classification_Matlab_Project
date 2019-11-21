function [Theta] = Sover(train_images,train_labels)
%最小二乘求解器初始化
%   生成最小二乘计算所需要的矩阵A和B

label_size = size(train_labels,2);
train_images_m = size(train_images,1);
train_images_n = size(train_images,2);

A = zeros(train_images_m,train_images_n,10);

Theta = zeros(train_images_n,10);
b_size = zeros(10,1);
A_rows = ones(10,1);

window = waitbar(0,'特征值分类中，请稍候！');

for i = 1:label_size
    switch train_labels(1,i) 
        case 0
            A(A_rows(1),:,1) = train_images(i,:);
            A_rows(1) = A_rows(1) + 1;
            b_size(1) = b_size(1) + 1;
        case 1
            A(A_rows(2),:,2) = train_images(i,:);
            A_rows(2) = A_rows(2) + 1;
            b_size(2) = b_size(2) + 1;
        case 2
            A(A_rows(3),:,3) = train_images(i,:);
            A_rows(3) = A_rows(3) + 1;
            b_size(3) = b_size(3) + 1;
        case 3
            A(A_rows(4),:,4) = train_images(i,:);
            A_rows(4) = A_rows(4) + 1;
            b_size(4) = b_size(4) + 1;
        case 4
            A(A_rows(5),:,5) = train_images(i,:);
            A_rows(5) = A_rows(5) + 1;
            b_size(5) = b_size(5) + 1;
        case 5
            A(A_rows(6),:,6) = train_images(i,:);
            A_rows(6) = A_rows(6) + 1;
            b_size(6) = b_size(6) + 1;
        case 6
            A(A_rows(7),:,7) = train_images(i,:);
            A_rows(7) = A_rows(7) + 1;
            b_size(7) = b_size(7) + 1;
        case 7
            A(A_rows(8),:,8) = train_images(i,:);
            A_rows(8) = A_rows(8) + 1;
            b_size(8) = b_size(8) + 1;
        case 8
            A(A_rows(9),:,9) = train_images(i,:);
            A_rows(9) = A_rows(9) + 1;
            b_size(9) = b_size(9) + 1;
        case 9
            A(A_rows(10),:,10) = train_images(i,:);
            A_rows(10) = A_rows(10) + 1;
            b_size(10) = b_size(10) + 1;
        otherwise
            disp('Sover_init_Error!!!')
    end
    
    waitbar(i/label_size);
end

close(window);

window = waitbar(0,'求解中，请稍候！');

for j = 1:10
    b_temp = ones(b_size(j),1);
    A_temp = A((1:b_size(j)),train_images_n,j);
    
    [Q,R]=qr(A_temp);
    Matrix_temp = (Q.')*b_temp;
    Theta(:,j) = Matrix_temp/R;
    
    waitbar(j/10);
end

close(window);

end

