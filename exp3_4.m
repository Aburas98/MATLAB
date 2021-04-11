close=load('eegclose');
open=load('eegopen');
close1 = close.eegclose(:,8*2);
close2 = close.eegclose(:,9*2);
open1 = open.eegopen(:,8*2);
open2 = open.eegopen(:,9*2);
fs = 1000;
t = -5:1/fs:5;
s1 = sin(50*2*pi*t) + 2*sin(250*2*pi*t) + randn(1,length(t));
s2 = sin(150*2*pi*t) + 4*sin(250*2*pi*t) + randn(1,length(t));
figure(1)
pwelch(s1,hamming(512),50,1024,fs);
figure(2)
pwelch(s2,hamming(512),50,1024,fs);
figure(3)
mscohere(s1,s2,hamming(512),50,1024,fs);
% ?????????(1-3Hz)??(4-7Hz)??(8-13Hz)??(14-30Hz)
locate_mid = [1.5,5.5,10.5,22,50,100];
fs2 = 250;n = 128;nfft = 512;
noverlap = 1/2*n;
figure(4)
[Cxy,F] = mscohere(open1,open2,blackman(n),noverlap,nfft,fs2);
plot(F,Cxy);
title('Coherence Function for Open eye Signal')
set(gca,'XTickmode','manual','Xtick',locate_mid)
figure(5)
[Cxy,F] = mscohere(close1,close2,blackman(n),noverlap,nfft,fs2);
plot(F,Cxy);
title('Coherence Function for CLosed eye Signal')
set(gca,'XTickmode','manual','Xtick',locate_mid)
figure(6)
[Cxy,F] = mscohere(close1,open1,blackman(512),256,1024,fs2);
plot(F,Cxy);
title('Coherence Function for Signals from the Same Channel')
set(gca,'XTickmode','manual','Xtick',locate_mid)
