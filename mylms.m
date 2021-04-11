function [w,y]=mylms(x,d,delta,N)
% LMS Algorithm for coefficient adjustment
M=length(x);
y=zeros(1,M);
w=zeros(1,N);
for n=N:M
    x1=x(n:-1:n-N+1);
    y(n)=w*x1';
    e=d(n)-y(n);
    w=w+2*delta*e*x1;
end

% w=estimated FIR FILTER
% y=output array 
% x=input array 
% d=desired array,length must be same as x
% delta=step size <1
% N=length of FIR filter,N<length of x
