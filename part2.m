%RSA

digits(50)


%MUST FIRST IMPORT FILE AS A CELL USING THE MATLAB TOOL
%CELL FILE WHEN IMPORTED MUST BE CALLED RSA1bencrypted

disp('Running...')

N = 165073;
[p,q] = factorprog(N);
to = (p-1)*(q-1); % totient as p and q prime
e = 307; % is part of public key and must be 1<e<to integer

%check gcd (e,to) = 1
%using EEA algorithim write algorithim?

% calculate modular inverse from EEA 

[D,K,gcd] = EEA(e,to);





%test that D is correct

test = mod((e*D),to);
%test should equal 1



fprintf ('Public key ( E,N) = (%i, %i)',e,N);
fprintf ('\nPrivate key ( D,N) = (%i, %i)',D,N);




%Encryption 

%inport code as directed above
%inport data > choose file > output type: Cell Array > import selection


C = cell2mat(RSA1bencrypted); %converts from cell to array
%alternativly just comment this out and import as numeric matrix

LCDec = length(C);

DBin = DectoBin(D);

test2=0;

if D < 0 
     D= D+to; %shifting so positive from modular arthimetics
    test2 = 1; 
end 

Mdecoded = zeros(1, LCDec);
Mdecoded2 = Mdecoded;

%setting up store arrays

%as M = (C^D)mod(N)
%and D is negative. instead can
%M = (C^-D)Mod(N) = ((C^-1)D)Mod(N)
%using the Mod inverse of C, C^-1
%find C^-1 from EEA



  %decoding merthod 1 using Shor's algorithim    
for j = 1:LCDec
    
    Mdecoded(j) = RSAde(C(j),D,N);
end 



Cin = zeros(1,LCDec); %array to hold inverse of coded

for i = 1:LCDec
    [Cin(i)] = EEA(C(i),N); %calculating mod inverse
end

if test2 == 1
D = ((D-to)*-1); %resetting back to negative value
end

for j = 1:LCDec
    
    Mdecoded2(j) = RSAde(Cin(j),D,N);
end 

decode1 = char(Mdecoded); %converting back out of ASCII
decode2 = char(Mdecoded2);

%errors

errors = Mdecoded - Mdecoded2;
Error_index_Locations = find(errors ~=0);


fprintf('\n Original Message\t %s',string)
fprintf('\n Decode1: \t %s', decode1)
if isprime(N) ~=1 %checking if prime, as if N not prime bb^-1 = 1(modN)  b^-1 may not exist 
    fprintf(2,'\nN is not prime, not every Code word may have a modular inverse\n Decode2 may not be accurate');
end 
fprintf('\n Decode2: \t %s', decode2)
fprintf('\n Number of errors between decodings = %i\n',length(Error_index_Locations));


