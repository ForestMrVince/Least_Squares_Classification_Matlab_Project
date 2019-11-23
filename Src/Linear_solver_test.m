function [train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong]...
    =Linear_solver_test(Theta,train_images,train_labels,test_images,test_labels,Character)
%œﬂ–‘«ÛΩ‚∆˜≤‚ ‘
%   —µ¡∑ºØ≤‚ ‘∫Õ≤‚ ‘ºØ≤‚ ‘

train_Z_right = 0;
train_Z_wrong = 0;
train_NZ_right = 0;
train_NZ_wrong = 0;
test_Z_right = 0;
test_Z_wrong = 0;
test_NZ_right = 0;
test_NZ_wrong = 0;

%—µ¡∑ºØ≤‚ ‘
Data_number = size(train_images,1);
window = waitbar(0,'—µ¡∑ºØ≤‚ ‘÷–£¨«Î…‘∫Ú£°');
for i = 1:Data_number
    Result = train_images(i,:)*Theta;
    Result_sign = sign(Result);
    if Result_sign == 1
        if train_labels(i) == Character
            train_Z_right = train_Z_right + 1;
        else
            train_Z_wrong = train_Z_wrong + 1;
        end
    else
        if train_labels(i) == Character
            train_NZ_wrong = train_NZ_wrong + 1;
        else
            train_NZ_right = train_NZ_right + 1;
        end
    end
    waitbar(i/Data_number);
end
close(window);

%≤‚ ‘ºØ≤‚ ‘
Data_number = size(test_images,1);
window = waitbar(0,'—µ¡∑ºØ≤‚ ‘÷–£¨«Î…‘∫Ú£°');
for j = 1:Data_number
    Result = test_images(j,:)*Theta;
    Result_sign = sign(Result);
    if Result_sign == 1
        if test_labels(j) == Character
            test_Z_right = test_Z_right + 1;
        else
            test_Z_wrong = test_Z_wrong + 1;
        end
    else
        if test_labels(j) == Character
            test_NZ_wrong = test_NZ_wrong + 1;
        else
            test_NZ_right = test_NZ_right + 1;
        end
    end
    waitbar(j/Data_number);
end
close(window);

end

