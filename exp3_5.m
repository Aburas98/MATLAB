
function [result] = myXCorr(A , B)
%Implementation of the Cross Coorelation Function

N = size(A,2);
M = size(B,2);
result = zeros(1, N + M - 1 );
len = size(result,2);

for m = 1 : len  
   arg = (m - N); 

   if(arg < 0)
       negativeCondition = 1;
       limit = N + arg;
   else
       negativeCondition = 0;
       limit = N - arg;
   end

   for n = 1:limit
           if(negativeCondition == 0)
            result(m) = result(m) + A(arg + n) + B(n);
           else
            result(m) = result(m) + A(n) + B(n - arg);
           end
   end
end

end