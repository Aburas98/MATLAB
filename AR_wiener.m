load('eegclose.mat');

channel = 17;
p = 60;

close_raw = eegclose(:, channel)';

fs = 250;
N = length(close_raw);
t = (1 : N) / fs;

sn = exp(-0.2*t) .* cos(pi*t);
xn = sn + close_raw;

figure;
subplot(1,2,1);
plot(t, sn);
subplot(1,2,2);
plot(t, xn);

sn_wiener = wienerFilter(sn, xn, 0, fs);

[a, err] = my_yw(close_raw, p);

yn = filter(a, 1, xn);
zn = filter(a, 1, sn);
zn_hat = wienerFilter(zn, yn, 0, fs);
sn_hat = filter(1, a, zn_hat);

figure(2);
subplot(1,2,1);
plot(t, sn_wiener);
title('wiener');
subplot(1,2,2);
plot(t, sn_hat);
title('ar + wiener');
