function [y] = sigmoid_derivative(u)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

y = 1 - ((exp(0-u)-exp(u))^2)/((exp(0-u)+exp(u))^2);

end

