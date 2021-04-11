audiowrite('wiener_filter.wav',y,Fs)
clear y Fs
[y,Fs] = audioread('wiener_filter.wav');
info = audioinfo('wiener_filter.wav');
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
n=1/100*randn(size(y));
g=y+n;
[hopt,error]=wien(g,y,100);
ghat=filtfilt(hopt,1,g);
subplot(311);plot(t,y);xlabel('Time');ylabel('Audio Signal');
title('Original Audio')
subplot(312);plot(t,g);xlabel('Time');ylabel('Audio Signal');
title('Corrupted Aduio')
subplot(313);plot(t,ghat);xlabel('Time');ylabel('Audio Signal');
title('Filtered Audio')