function [output] = sigmoid(u)
%sigmoid����
%   ������ź���

output = (exp(u)-exp(0-u))/(exp(u)+exp(0-u));

end

