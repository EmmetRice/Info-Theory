
%FActorisation Algorithim

%RSAde = Left to right binary modular exponentiation method algorithim

 function [fac1,fac2]= factorprog(N)
% N = 165073;
% disp('Running')
gcd = 0;
%  y = floor(N/1000);
y =2;
r=1;
valid = 1; %used to test if factors produce N
fac1=0; %Fac1,2 are the prime factors sought 
fac2=0;
modtest = 0; %italising modular period
z = mod(r,2); %test wether r is even

    while z~=0 %keep going till r is even
        
        disp('running...')

              

            while gcd ~=1 %run until a number is coprime with N

               [~,~,gcd] = EEA(y,N);
               y = y+1;
               fprintf('new y\t %i',y);
            end

            if gcd == 1
                y = y-1;
%             must reduce back to correct value
                
            end 

            
            % r is the modular period
            

            while  modtest ~= 1 % run till md period is 1
                
                 modtest = RSAde(y,r,N); %applying modular algorithim
                 
%                 fprintf(2,'\nmodtest = %i',modtest);
                r = r+1;
                
                    
            end 
            
           
            if modtest == 1
                    r = r-1; %reduce back to correct value
                     z = mod(r,2); %test if even, and change Z value in outer loop to run again if not
            end
            
            %is reven?
            
            rtest = mod(r,2);
            
            
            
            
           if  rtest ==1   %resetting tests
                r=1; %reset period
                y=y+1; %go back up to new Y
                gcd = 0;
                modtest = 0;
                fprintf(2,'\nrestart')
                continue
           end
            
           
%           
          
           
    end
    


             

            if rtest == 0 %if even go to next step of algorithim

                r2 = r/2;
                x = RSAde(y,r2,N); %applying modular algorithim

                xplus = x + 1;
                xminus = x - 1;

                [~,~,f1] = EEA(xplus,N); %finding GCD
                [~,~,f2] = EEA(xminus,N);

                valid = N - (f1 * f2); %testing if factors
            end 

            if valid == 0

                fac1 = f1;
                fac2 = f2;
            end
            disp(f1)
            disp(f2)
            disp(y)
 end 



