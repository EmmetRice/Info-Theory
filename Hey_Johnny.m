%ASCII

 string = 'Hey Johnny';
 Mdec = double(string); %convert to ASCII
 %Double uses ASCII Table to connvert letters 

 % Encoding
 
S = randi([0 127]);    %Psuedo random easily cracked

% S chosen in range of valid ASCII code

% chooses a random integer in the range of ASCII decimal charcters
%to use as secret key S

S = DectoBin(S); %convert to binary

%convert message to Binary
% 

%cells used as can hold array of arrays

MBin = cell(1,length(Mdec)); %array to hold binary
Etemp = cell(1,length(Mdec));
EBin = cell(1,length(Mdec));
EDec = cell(1,length(Mdec));
% Etemp = zeros(length(Mdec),7);
i = 1;
while i <= (length(Mdec))
    
    MBin{i} = DectoBin(Mdec(i));
    x = cell2mat(MBin(i)); % converting cell element back to array
        if length(x) < length(S) %testing if length not same and adjusting
            x= padarray(x,[0, length(S)-length(x)],0,'pre'); % adding pre 0s if needed to start so array same length for adding
            %x = mat2cell(x);
            MBin{i} = x; % putting altered array back into cell
            
        end  
        
        %same procedure as above but if key S is smaller, it shouldnt be as
        %from chosen but its a fail safe
        
        if length(x) > length(S)
            S= padarray(S,[0, length(x)-length(S)],0,'pre');
            
        end    
            
    Etemp{i} = MBin{i} + S; %adding private key (symmetric)
    EBin{i} = mod(Etemp{i},2); %th encrypted
    EDectemp = EBin{i};
    EDec{i} = BintoDec(EDectemp); 
    i=i+1;
   
end

EDec = cell2mat(EDec);  % Convert back from cell

fprintf('\n Hey Johnny in ASCII\n')
disp(Mdec)
fprintf('\n Encoding Key:\n')
disp(S)
fprintf('\n Encoded as:\n')
disp(EDec)


%DECRYPTION
%setting up cell arrays
MBinDCRYPT = cell(1,length(Mdec));
MBinDCRYPTemp = MBinDCRYPT;
MDecDCrypt = MBinDCRYPT;
i = 1;
while i <= (length(Mdec)) 
   MBinDCRYPTemp{i} =  EBin{i} + S;
   MBinDCRYPT{i} = mod(MBinDCRYPTemp{i},2);
    MDectemp = MBinDCRYPT{i};
    MDecDCrypt{i} = BintoDec(MDectemp); %convert back to decimal
    i=i+1;
   
end

disp('Decrypt')
MDecDCrypt = cell2mat(MDecDCrypt);
char([MDecDCrypt]) %converting back from ASCII

