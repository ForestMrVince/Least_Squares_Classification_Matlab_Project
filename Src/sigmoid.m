function [output] = sigmoid(u)
%sigmoidº¯Êý
%   ´úÌæ·ûºÅº¯Êý

output = (exp(u)-exp(0-u))/(exp(u)+exp(0-u));
%an=[1,2,3;1,2,3;1,2,3]
%an = arrayfun(@sigmoid,an)
%https://www.ilovematlab.cn/forum.php?mod=viewthread&s_tid=NumBestAnswers&tid=329412&page=1
%https://ww2.mathworks.cn/help/symbolic/sym.taylor.html
%https://ww2.mathworks.cn/help/symbolic/jacobian.html
%https://ww2.mathworks.cn/help/matlab/ref/arrayfun.html

end

