function NonLinear_scan_plot(k_Max,Lambda,...
    train_NZ_wrong,train_Z_wrong,train_NZ_right,train_Z_right,...
    test_NZ_wrong,test_Z_wrong,test_NZ_right,test_Z_right)
%���򻯲��������ѭ������������ʵȸ���ͼ����
%   ��

train_error_rate = (train_NZ_wrong + train_Z_wrong)./(train_NZ_wrong + train_Z_wrong + train_NZ_right + train_Z_right);
test_error_rate = (test_NZ_wrong + test_Z_wrong)./(test_NZ_wrong + test_Z_wrong + test_NZ_right + test_Z_right);

contourf(k_Max,Lambda,train_error_rate*1000);
colorbar;
title('ѵ���������ʵȸ���ͼ���룩');
xlabel('���ѭ������ k\_Max');
ylabel('����ϵ�� ��');
set(gca,'fontsize',12,'fontname','����');
grid on;

figure;
contourf(k_Max,Lambda,test_error_rate*1000);
colorbar;
title('���Լ������ʵȸ���ͼ���룩');
xlabel('���ѭ������ k\_Max');
ylabel('����ϵ�� ��');
set(gca,'fontsize',12,'fontname','����');
grid on;

end
