function [B,D] = DectoBin(D)


% B = zeros(1,7);
%     for k = 7:-1:1    %K is the positioning, going down in incremenets of -1
%         %done in reverse order
%       B(k) = mod(D,2); % record remainder in reverse
%       D = (D-B(k))/2; % setting equal to previous factor
% %       disp(k)
% %       disp(B)
% %       disp(D)
%       
%     end

%divide by 2 and record remainder
%use factor and divide by 2 till reach 0
%binary = reading remainders in reverse order

test=0;

if D<0
    D = D*-1;
    test = 1;
end 

K = 1;
%K is the positioning,  in incremenets of 1
q = floor(D/2);
%r = rem(dec_nr, 2);
r = mod(D,2);
bin(K) = num2str(r(K)); %creating a string rather than array to hold binary
%as string can be variable length. Stores the remainder. 
while 2 <= q
    D = q;
    K = K + 1;
    q = floor(D/2);
%     r = rem(dec_nr, 2);
    r = mod(D,2);
    bin(K) = num2str(r);
end
bin(K + 1) = num2str(q);
%In order to store the corresponding factor for "0" remainder
bin = fliplr(bin); % flip as remainders read in reverse order 
% B=bin;


%can tab in to convert string to array
B = bin-'0';

if test == 1
    
    fprintf(2,'\nNegative Binary number')

end 

