n=0:N-1;
s=mecg1';
n=0.8*randn(1,N);
d=s+n;
x=[0 d(1:end-1)];
[w,y]=mylms(x,d,0.001,15);
subplot(221);plot(s);title('????')
subplot(222);plot(d);title('?????????');hold on;plot(s,'r')
subplot(223);plot(y);title('?????????');hold on;plot(s,'r')
subplot(224);plot(d-y);title('?????????????')
