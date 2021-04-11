function [hopt,error]=wiener(x,s)
M=2;[h,error(1)]=wien(x,s,1);
[h,error(2)]=wien(x,s,M);
while abs(error(M)-error(M-1))>=0.0001
    M=M+1;
    [h,error(M)]=wien(x,s,M);
end
hopt=h;
error=error(M);