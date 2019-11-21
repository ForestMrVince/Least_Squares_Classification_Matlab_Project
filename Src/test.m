function [train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]=test(Theta,train_images,train_labels,test_images,test_labels)
%����
%   ѵ�������ԺͲ��Լ�����

%ѵ��������
Data_number = size(train_images,1);
train_results = ones(Data_number,10);
window = waitbar(0,'ѵ������������У����Ժ�');
for i = 1:10
    train_results(:,i) = train_images * Theta(:,i);
    waitbar(i/10);
end
close(window);
window = waitbar(0,'ѵ������������У����Ժ�');
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

%���Լ�����
Data_number = size(test_images,1);
test_results = ones(Data_number,10);
window = waitbar(0,'���Լ�����������У����Ժ�');
for i = 1:10
    test_results(:,i) = test_images * Theta(:,i);
    waitbar(i/10);
end
close(window);

window = waitbar(0,'���Լ���������У����Ժ�');
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

