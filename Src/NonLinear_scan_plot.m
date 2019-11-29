function NonLinear_scan_plot(k_Max,Lambda,...
    train_NZ_wrong,train_Z_wrong,train_NZ_right,train_Z_right,...
    test_NZ_wrong,test_Z_wrong,test_NZ_right,test_Z_right)

train_error_rate = (train_NZ_wrong + train_Z_wrong)./(train_NZ_wrong + train_Z_wrong + train_NZ_right + train_Z_right);
test_error_rate = (test_NZ_wrong + test_Z_wrong)./(test_NZ_wrong + test_Z_wrong + test_NZ_right + test_Z_right);

contourf(k_Max,Lambda,train_error_rate)
colorbar;
title('训练集错误率等高线图');
xlabel('最大循环次数 k\_Max');
ylabel('正则化系数 λ');
set(gca,'fontsize',12,'fontname','宋体');
grid on;

figure;
contourf(k_Max,Lambda,test_error_rate)
colorbar;
title('测试集错误率等高线图');
xlabel('最大循环次数 k\_Max');
ylabel('正则化系数 λ');
set(gca,'fontsize',12,'fontname','宋体');
grid on;

end

