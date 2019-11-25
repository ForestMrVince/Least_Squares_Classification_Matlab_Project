function Results_output_xlsx(train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong)
%输出测试结果
%   将训练集和测试集的测试结果输出到results.xlsx的电子表格中

% % 线性
% txt_Line_1={'输出','预测值：+1','预测值：-1','合计'};
% txt_Line_2={'真值：+1'};
% txt_Line_3={'真值：-1'};
% txt_Line_4={'合计'};
% %训练集测试结果输出
% train_table = zeros(3,3);
% train_table(1,1) = train_Z_right;
% train_table(1,2) = train_NZ_wrong;
% train_table(1,3) = train_Z_right + train_NZ_wrong;
% train_table(2,1) = train_Z_wrong;
% train_table(2,2) = train_NZ_right;
% train_table(2,3) = train_Z_wrong + train_NZ_right;
% train_table(3,1) = train_Z_right + train_Z_wrong;
% train_table(3,2) = train_NZ_right + train_NZ_wrong;
% train_table(3,3) = train_Z_right + train_Z_wrong + train_NZ_right + train_NZ_wrong;
% xlswrite('linear_results.xlsx',txt_Line_1,'训练集测试结果','A1');
% xlswrite('linear_results.xlsx',txt_Line_2,'训练集测试结果','A2');
% xlswrite('linear_results.xlsx',txt_Line_3,'训练集测试结果','A3');
% xlswrite('linear_results.xlsx',txt_Line_4,'训练集测试结果','A4');
% xlswrite('linear_results.xlsx',train_table,'训练集测试结果','B2');
% 
% %测试集测试结果输出
% test_table = zeros(3,3);
% test_table(1,1) = test_Z_right;
% test_table(1,2) = test_NZ_wrong;
% test_table(1,3) = test_Z_right + test_NZ_wrong;
% test_table(2,1) = test_Z_wrong;
% test_table(2,2) = test_NZ_right;
% test_table(2,3) = test_Z_wrong + test_NZ_right;
% test_table(3,1) = test_Z_right + test_Z_wrong;
% test_table(3,2) = test_NZ_right + test_NZ_wrong;
% test_table(3,3) = test_Z_right + test_Z_wrong + test_NZ_right + test_NZ_wrong;
% xlswrite('linear_results.xlsx',txt_Line_1,'测试集测试结果','A1');
% xlswrite('linear_results.xlsx',txt_Line_2,'测试集测试结果','A2');
% xlswrite('linear_results.xlsx',txt_Line_3,'测试集测试结果','A3');
% xlswrite('linear_results.xlsx',txt_Line_4,'测试集测试结果','A4');
% xlswrite('linear_results.xlsx',test_table,'测试集测试结果','B2');

% 非线性
txt_Line_1={'输出','预测值：+1','预测值：-1','合计'};
txt_Line_2={'真值：+1'};
txt_Line_3={'真值：-1'};
txt_Line_4={'合计'};
%训练集测试结果输出
train_table = zeros(3,3);
train_table(1,1) = train_Z_right;
train_table(1,2) = train_NZ_wrong;
train_table(1,3) = train_Z_right + train_NZ_wrong;
train_table(2,1) = train_Z_wrong;
train_table(2,2) = train_NZ_right;
train_table(2,3) = train_Z_wrong + train_NZ_right;
train_table(3,1) = train_Z_right + train_Z_wrong;
train_table(3,2) = train_NZ_right + train_NZ_wrong;
train_table(3,3) = train_Z_right + train_Z_wrong + train_NZ_right + train_NZ_wrong;
xlswrite('Nonlinear_results.xlsx',txt_Line_1,'训练集测试结果','A1');
xlswrite('Nonlinear_results.xlsx',txt_Line_2,'训练集测试结果','A2');
xlswrite('Nonlinear_results.xlsx',txt_Line_3,'训练集测试结果','A3');
xlswrite('Nonlinear_results.xlsx',txt_Line_4,'训练集测试结果','A4');
xlswrite('Nonlinear_results.xlsx',train_table,'训练集测试结果','B2');

%测试集测试结果输出
test_table = zeros(3,3);
test_table(1,1) = test_Z_right;
test_table(1,2) = test_NZ_wrong;
test_table(1,3) = test_Z_right + test_NZ_wrong;
test_table(2,1) = test_Z_wrong;
test_table(2,2) = test_NZ_right;
test_table(2,3) = test_Z_wrong + test_NZ_right;
test_table(3,1) = test_Z_right + test_Z_wrong;
test_table(3,2) = test_NZ_right + test_NZ_wrong;
test_table(3,3) = test_Z_right + test_Z_wrong + test_NZ_right + test_NZ_wrong;
xlswrite('Nonlinear_results.xlsx',txt_Line_1,'测试集测试结果','A1');
xlswrite('Nonlinear_results.xlsx',txt_Line_2,'测试集测试结果','A2');
xlswrite('Nonlinear_results.xlsx',txt_Line_3,'测试集测试结果','A3');
xlswrite('Nonlinear_results.xlsx',txt_Line_4,'测试集测试结果','A4');
xlswrite('Nonlinear_results.xlsx',test_table,'测试集测试结果','B2');

end

