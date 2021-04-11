N=32;w0=1.1*pi/4;%w0=1.1*pi/4;
n=0:N-1;
x=cos(w0*n);
xk=fft(x);
subplot(212);plot(x);
subplot(211);stem(n,abs(xk));