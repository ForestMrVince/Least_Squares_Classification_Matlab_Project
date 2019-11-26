function [y] = sigmoid_derivative(u)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

y = 1 - ((exp(0-u)-exp(u))^2)/((exp(0-u)+exp(u))^2);

end

