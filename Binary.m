function [B] = Binary(B)
%creates an array of the binarty based on offset from 0
   s = num2str(B);
   B = s-'0';
end