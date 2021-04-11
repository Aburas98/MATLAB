%first load data files using the command load
%generate ecg signals 
fs=256;
t=0:1/fs:(length(fecg1)-1)/fs;
x=mecg1+fecg1+noise1;
figure(1)
subplot(411)
plot(t,fecg1)
title('ECG of Fetus');xlabel('t/s');ylabel('Amplitude/mV')

wt = modwt(fecg1,5);
wtrec = zeros(size(wt));
wtrec(4:5,:) = wt(4:5,:);
y = imodwt(wtrec,'sym4');

y = abs(y).^2;
[qrspeaks,locs] = findpeaks(y,t,'MinPeakHeight',0.35,...
    'MinPeakDistance',0.150);
figure
plot(t,y)
hold on
plot(locs,qrspeaks,'ro')
xlabel('Seconds')
title('R Peaks Localized by Wavelet Transform with Automatic Annotations')

subplot(412)
plot(t,mecg1)
title('ECG of Mother');xlabel('t/s');ylabel('Amplitude/mV')

wt2 = modwt(mecg1,5);
wtrec2 = zeros(size(wt2));
wtrec2(4:5,:) = wt2(4:5,:);
z = imodwt(wtrec2,'sym4');

z = abs(z).^2;
[qrspeaks2,locs2] = findpeaks(z,t,'MinPeakHeight',0.35,...
    'MinPeakDistance',0.150);
figure
plot(t,z)
hold on
plot(locs2,qrspeaks2,'ro')
xlabel('Seconds')
title('R Peaks Localized by Wavelet Transform with Automatic Annotations')

subplot(413)
plot(t,noise1);xlabel('t/s');ylabel('Amplitude/mV')
title('Noise')
subplot(414)
plot(t,x)
title('Mixed Signal');xlabel('t/s');ylabel('Amplitude/mV')

%use pwelch() function to estimate power spectram density PSD 
[p1,f1]=pwelch(fecg1,[],[],[],fs);
[p2,f2]=pwelch(mecg1,[],[],[],fs);
[p3,f3]=pwelch(noise1,[],[],[],fs);
[p4,f4]=pwelch(x,[],[],[],fs);
figure(2)
subplot(411)
plot(f1,p1);grid on;grid minor;
title('ECG of Fetus');xlabel('Frequency/Hz');ylabel('power/mV^2')
subplot(412)
plot(f2,p2);grid on;grid minor;
title('ECG of Mother');xlabel('Frequency/Hz');ylabel('power/mV^2')
subplot(413)
plot(f3,p3);grid on;grid minor;
xlabel('Frequency/Hz');ylabel('power/mV^2')
title('Noise')
subplot(414)
plot(f4,p4);grid on;grid minor;
xlabel('Frequency/Hz');ylabel('power/mV^2')
title('Mixed Signal')

%Estimate the PDF of signals 
figure(3)
subplot(411)
hist(fecg1,100)
title('PDF of fecg')
subplot(412)
hist(mecg1,100)
title('PDF of mecg')
subplot(413)
hist(noise1,100)
title('PDF of noise')
subplot(414)
hist(x,100)
title('PDF of mixed signal')

%find out the third standardized moment of distributions (skewness)
%find out the fourth standardized moment of ditributions (kurtosis)
%kurtosis is a measure of of how outlier-prone the distribution is 
%skewness is a measure of the data asymmetry of the data around the mean
%postive skewness indicates right-tailed dist.
%negative skewness indicates left-tailed dist.

ecg_k=[kurtosis(fecg1) kurtosis(mecg1) kurtosis(noise1) kurtosis(x)];
ecg_s=[skewness(fecg1) skewness(mecg1) skewness(noise1) skewness(x)];

%use the modified function wienerFilter to filter the data 
[yhat,H]= wienerFilter(fecg1,x,0,fs);
figure(4)
subplot(3,1,1);plot(t,yhat);title('Filtered signal')
subplot(3,1,2);plot(t,fecg1);title('Desired signal')
subplot(3,1,3);plot(t,x);title('Observed signal')
corrcoef(yhat,fecg1)

%using wiener-hopf equations constuct a FIR wiener filter
[hopt,error]=wiener(x,fecg1);
yhat2=filtfilt(hopt,1,x);
figure(5)
subplot(3,1,1);plot(t,yhat2);title('Filtered signal')
subplot(3,1,2);plot(t,fecg1);title('Desired signal')
subplot(3,1,3);plot(t,x);title('Observed signal')
corr_fir=corrcoef(yhat2,fecg1);