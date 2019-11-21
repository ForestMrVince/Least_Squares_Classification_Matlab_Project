function [train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]=test(Theta,train_images,train_labels,test_images,test_labels)
%测试
%   训练集测试和测试集测试

%训练集测试
Data_number = size(train_images,1);
train_results = ones(Data_number,10);
window = waitbar(0,'训练集分类求解中，请稍候！');
for i = 1:10
    train_results(:,i) = train_images * Theta(:,i);
    waitbar(i/10);
end
close(window);
window = waitbar(0,'训练集分类分析中，请稍候！');
for j = 1:Data_number
    for k = 1:10
        Character_New = abs(train_results(k,j) - 1);
        if k==1
            Character_Old = Character_New;
            Win = k;
        elseif Character_New < Character_Old
            Character_Old = Character_New;
            Win = k;
        end
    end
    
    if Win == 0
        if train_labels(1,j) == 0
            train_Z_right = train_Z_right + 1;
        else
            train_Z_wrong = train_Z_wrong + 1;
        end
    else
        if train_labels(1,j) == 0
            train_NZ_wrong = train_NZ_wrong + 1;
        else
            train_NZ_right = train_NZ_right + 1;
        end
    end
    
    waitbar(j/Data_number);
end
close(window);

%测试集测试
Data_number = size(test_images,1);
test_results = ones(Data_number,10);
window = waitbar(0,'测试集集分类求解中，请稍候！');
for i = 1:10
    test_results(:,i) = test_images * Theta(:,i);
    waitbar(i/10);
end
close(window);

window = waitbar(0,'测试集分类分析中，请稍候！');
for j = 1:Data_number
    for k = 1:10
        Character_New = abs(test_results(k,j) - 1);
        if k==1
            Character_Old = Character_New;
            Win = k;
        elseif Character_New < Character_Old
            Character_Old = Character_New;
            Win = k;
        end
    end
    
    if Win == 0
        if test_labels(1,j) == 0
            test_Z_right = test_Z_right + 1;
        else
            test_Z_wrong = test_Z_wrong + 1;
        end
    else
        if test_labels(1,j) == 0
            test_NZ_wrong = test_NZ_wrong + 1;
        else
            test_NZ_right = test_NZ_right + 1;
        end
    end
    
    waitbar(j/Data_number);
end
close(window);

end

