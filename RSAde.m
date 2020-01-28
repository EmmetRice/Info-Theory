
function [M] = RSADe(C,D,N)

%for encoding same as [C] = RSAde(M,E,N)

DBin = DectoBin(D);


Farr = zeros(1,length(DBin));
%array to store modulo values

 

for j = 1:length(DBin)

    if j ==1 %first poition is code word assuming decoding)
        
        Farr(1) = C;
        continue
    end 
    
    if DBin(j) == 0 %if binary value of D at position j is 0
        
        Farr(j) = Farr(j-1)^2; %previous array elemnt squared
        Farr(j) = mod(Farr(j),N);
    end 
    
    if j>1 && DBin(j) ==1 %first numbe rin binary always 1, if other numbers are 1 then:
        
        Farr(j) = C*(Farr(j-1)^2);
        Farr(j) = mod(Farr(j),N);
    end 
end 

M = Farr(end); %last value in the store array is the message in ASCII decimal
