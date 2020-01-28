%EEA 

function [m,n,a] = EEA(a,b)
%{D,K,GCD]

%m is the modular inverse of a mod b
%n is the modular inverse of b mod a
%a is the GCD

%a is the GCD

%a = qb + r
i=1;

r = zeros(1,100);
x0 = zeros(1,100);
y0 = zeros(1,100);
r(1,i) = mod(a, b);
q = (a - r(1,i))/b;
x0(1,i) = 0;
x1=1;
y0(1,i)=1;
y1=0;





    while b ~= 0 %not equal zero
        i=i+1;
        
        a = b;
        b = r(1,i-1);
        r(1,i) = mod(a, b);
        x0(1,i)=x1-q*x0(1,i-1);
        x1=x0(1,i-1);
        y0(1,i)=y1-q*y0(1,i-1);
        y1=y0(1,i-1);
        q = (a - r(1,i))/b;
    end 
    
    m = x0(1,i-1);
    n = y0(1,i-1);
    

 end
    