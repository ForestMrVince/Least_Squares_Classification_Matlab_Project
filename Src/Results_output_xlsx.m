function Results_output_xlsx(train_Z_right,train_Z_wrong,train_NZ_right,train_NZ_wrong,...
    test_Z_right,test_Z_wrong,test_NZ_right,test_NZ_wrong)
%������Խ��
%   ��ѵ�����Ͳ��Լ��Ĳ��Խ�������results.xlsx�ĵ��ӱ����

% % ����
% txt_Line_1={'���','Ԥ��ֵ��+1','Ԥ��ֵ��-1','�ϼ�'};
% txt_Line_2={'��ֵ��+1'};
% txt_Line_3={'��ֵ��-1'};
% txt_Line_4={'�ϼ�'};
% %ѵ�������Խ�����
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
% xlswrite('linear_results.xlsx',txt_Line_1,'ѵ�������Խ��','A1');
% xlswrite('linear_results.xlsx',txt_Line_2,'ѵ�������Խ��','A2');
% xlswrite('linear_results.xlsx',txt_Line_3,'ѵ�������Խ��','A3');
% xlswrite('linear_results.xlsx',txt_Line_4,'ѵ�������Խ��','A4');
% xlswrite('linear_results.xlsx',train_table,'ѵ�������Խ��','B2');
% 
% %���Լ����Խ�����
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
% xlswrite('linear_results.xlsx',txt_Line_1,'���Լ����Խ��','A1');
% xlswrite('linear_results.xlsx',txt_Line_2,'���Լ����Խ��','A2');
% xlswrite('linear_results.xlsx',txt_Line_3,'���Լ����Խ��','A3');
% xlswrite('linear_results.xlsx',txt_Line_4,'���Լ����Խ��','A4');
% xlswrite('linear_results.xlsx',test_table,'���Լ����Խ��','B2');

% ������
txt_Line_1={'���','Ԥ��ֵ��+1','Ԥ��ֵ��-1','�ϼ�'};
txt_Line_2={'��ֵ��+1'};
txt_Line_3={'��ֵ��-1'};
txt_Line_4={'�ϼ�'};
%ѵ�������Խ�����
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
xlswrite('Nonlinear_results.xlsx',txt_Line_1,'ѵ�������Խ��','A1');
xlswrite('Nonlinear_results.xlsx',txt_Line_2,'ѵ�������Խ��','A2');
xlswrite('Nonlinear_results.xlsx',txt_Line_3,'ѵ�������Խ��','A3');
xlswrite('Nonlinear_results.xlsx',txt_Line_4,'ѵ�������Խ��','A4');
xlswrite('Nonlinear_results.xlsx',train_table,'ѵ�������Խ��','B2');

%���Լ����Խ�����
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
xlswrite('Nonlinear_results.xlsx',txt_Line_1,'���Լ����Խ��','A1');
xlswrite('Nonlinear_results.xlsx',txt_Line_2,'���Լ����Խ��','A2');
xlswrite('Nonlinear_results.xlsx',txt_Line_3,'���Լ����Խ��','A3');
xlswrite('Nonlinear_results.xlsx',txt_Line_4,'���Լ����Խ��','A4');
xlswrite('Nonlinear_results.xlsx',test_table,'���Լ����Խ��','B2');

end

