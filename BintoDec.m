function [D,B] = BintoDec(B)  

%B = Binary(B);

D = sum(B.*(2.^(6:-1:0))); %.* is matrix element multiplication 
% B(1) corresponds to 2^6 place 
end