clear all
clc
t=linspace(-5,5,1000);
s = 2*sin(2*pi*t)+4*sin(pi*t);
T = 2*pi/pi*100;
n = randn(1,length(t));
a = linspace(0,30,31);
a_len = length(a);
a_t = zeros(1,a_len);
weight = zeros(1,a_len);
x = zeros(1000,a_len);
corr_sx = zeros(a_len,1);
xcorr_x = zeros(2*1000-1,a_len);
for i = 1:length(a)
    x(:,i) = s + a(i)*n ;    
    corr_sx(i) = corr(s',x(:,i));
    if a(i)==1
        figure(1)
        plot(x(:,i),'y');
        hold on;
        plot(s,'r');
        hold on;
        figure(2)
        xcorr_x(:,i) = xcorr(x(:,i),s,'biased')';
        [pks,locs]=findpeaks(xcorr_x(:,i));
        lo_cs = find(pks>0.1);
        locs = locs(lo_cs);
        T_c = mean(diff(locs));
        plot( xcorr_x(:,i));
    end
end
    figure(3)
    plot(0:30,corr_sx,'o');
disp('Original period?');disp(T);
disp('Period tested by correlation?');disp(T_c);