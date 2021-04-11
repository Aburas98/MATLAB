N=10000;
x1=randn(1,N);
x2=rand(1,N);
%mean and variance
mean_x1=mean(x1);
mean_x2=mean(x2);
var_x1=var(x1);
var_x2=var(x2);
%correlation function
corr_x1=xcorr(x1,'biased');
corr_x2=xcorr(x2,'biased');
%plots
figure(1)
subplot(3,2,1)
plot(1:N,x1)
title('Normally distributed(x1)')
subplot(3,2,2)
plot(1:N,x2)
title('Uniformly distributed(x2)')
subplot(3,2,3)
plot(1:length(corr_x1),corr_x1)
title('Autocorrelation of x1')
subplot(3,2,4)
plot(1:length(corr_x2),corr_x2)
title('Autocorrelation of x2')
xvar_x1=xcov(x1,'biased');
xvar_x2=xcov(x2,'biased');
subplot(3,2,5)
plot(1:length(xvar_x1),xvar_x1)
title('covariance od x1')
subplot(3,2,6)
plot(1:length(xvar_x2),xvar_x2)
title('covariance of x2')
figure(2)
subplot(3,2,1)
histogram(x1,100);
title('Histogram of x1')
subplot(3,2,2)
histogram(x2,100);
title('Histogram of x2')
[f1,s1]=ksdensity(x1);
[f2,s2]=ksdensity(x2);
subplot(3,2,3)
plot(s1,f1)
title('PDF curve of x1')
subplot(3,2,4)
plot(s2,f2)
title('PDF curve of x2')
F1=zeros(1,length(f1));
F2=zeros(1,length(f2));
for i = 1:length(f1)
    F1(i)= sum(f1(1:i));
end
for i = 1:length(f2)
    F2(i)= sum(f2(1:i));
end
subplot(3,2,5)
plot(1:length(F1),F1)
title('Probability distribution function(x1)')
subplot(3,2,6)
plot(1:length(F2),F2)
title('Probability distribution function(x2)')
periodn=abs(fft(x1,2*N-1)).^2/N;
xcor1_fft=abs(fft(flip(fftshift(corr_x1))));
d1=periodn-xcor1_fft;
period=abs(fft(x2,2*N-1)).^2/N;
xcor2_fft=abs(fft(flip(fftshift(corr_x2))));
d2=period-xcor2_fft;
figure(3)
subplot(1,2,1)
plot(1:length(periodn),periodn,'*',1:length(xcor1_fft),xcor1_fft,'o')
legend('Periodogram of x1','FFT of corr function');
subplot(1,2,2)
plot(1:length(period),period,'*',1:length(xcor2_fft),xcor2_fft,'o')
legend('Periodogram of x2','FFT of corr function');
max(d1)
max(d2)
