N=1000;                    %length
Fs=50;                     %sampling frequency
n=0:N-1; t=n/Fs;           %Time sequence
A=0.4;A1=0.5;A2=0.6;       %Attenuation Coefficient
c0=340;   %c0
d1=620;
d2=500;
t1=d1/c0;
t2=(d1+2*d2)/c0;
tc=2*(d1+d2)/c0;

Lag=500;                   
pt=sinc(2*pi*t);           %Original Signal
xt = pt + A1*sinc(2*pi*(t-tc)) ;
figure(1)
plot((1:N)/Fs,xt);
yt = A*sinc(2*pi*(t-t1))+ A2*sinc(2*pi*(t-t2));
figure(2)
plot((1:N)/Fs,yt);
[Rpp,lags] = xcorr(pt,'biased');                %p(t)Auto-corr
[Rxx,lagx] = xcorr(xt,'biased');                %x(t)Auto-corr
[Ryy,lagt] = xcorr(yt,'biased');                %y(t)Auto-corr
[Rxy,lagy] = xcorr(xt,yt,'biased');             %x(t)& y(t) cross corr.

rts=lags/Fs;rtx=lagx/Fs;rtt=lagt/Fs;rty=lagy/Fs;
figure(3)
[pks,locs]=findpeaks(Rxy);
lo_cs = find(pks>1E-3);
locs = (locs(lo_cs)-999)/Fs;
pks = pks(lo_cs);
plot(locs,pks,'o');
hold on;
plot(rty,Rxy);
figure(4)
subplot(2,2,1)
plot(rts,Rpp)
title('%p(t)Auto-corr')
xlabel('Time/s')
subplot(2,2,2)
plot(rtx,Rxx)
title('x(t) Auto-corr')
xlabel('Time/s')
subplot(2,2,3)
plot(rtt,Ryy)
title('%y(t) Auto-corr')
xlabel('Time/s')
subplot(2,2,4)
plot(rty,Rxy)
title('%x(t)&y(t) cross-corr.')
xlabel('Time/s')
d1_c = (locs(3) * c0 - locs(2) * c0)/2;
d2_c = ((locs(4) * c0 - d1_c)/2 + (-locs(1) * c0 - d1_c)/2)/2;
