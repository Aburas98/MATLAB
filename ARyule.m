load('eegclose.mat');
load('eegopen.mat');
channel = 17;
p = 12;
close_raw = eegclose(:,channel)';
open_raw = eegopen(:,channel)';
fs = 250;
N = length(close_raw);
t = (1:N) / fs;

%modeling
[ac1, ec1] = aryule(close_raw, p);
[ac2, ec2] = my_yw(close_raw, p);
[ao1, eo1] = aryule(open_raw, p);
[ao2, eo2] = my_yw(open_raw, p);

%reconstucted open eye signal
wc = ec2*rand(1,N);
close_sim = filter(1, ac2, wc);

%reconstructed closed eye signal
wo = eo2*rand(1,N);
open_sim = filter(1, ao2, wo);

%plot signals for comparison
figure(1)
subplot(2,1,1);hold on;
plot(t, close_raw);
plot(t, close_sim, 'r');
legend('raw','reconstructed');
title('Closed eye')
subplot(2,1,2);hold on;
plot(t, open_raw);
plot(t, open_sim, 'r')
legend('raw','reconstructed');
title('Open eye')

%PSD estimation
[Pc, fc] = pwelch(close_raw,[],[],[],fs); 
[Pc_sim, fc_sim] = pwelch(close_sim,[],[],[],fs);

figure(2);hold on;
plot(fc, 10*log10(Pc));
plot(fc_sim, 10*log10(Pc_sim),'r');
legend('Original','reconstructed');
title('PSD for Original and Reconstructed Signals');

%AR model PSD estimation
[PcAR, fAR] = pyulear(close_raw, p, [], fs);
figure(3); hold on;
plot(fc_sim, 10*log10(Pc));
plot(fAR, 10*log10(PcAR),'r');
legend('pwelch ','AR model');
title('Comparison between ''AR'' and ''welch''');

%PSD estimation for open eye
[Po, fo] = pwelch(open_raw,[],[],[],fs); 
[Po_sim, fo_sim] = pwelch(open_sim,[],[],[],fs);

figure(4);hold on;
plot(fo, 10*log10(Po));
plot(fo_sim, 10*log10(Po_sim),'r');
legend('Original','reconstructed');
title('PSD for Original and Reconstructed Signals');

%AR model PSD estimation for open
[PoAR, foAR] = pyulear(open_raw, p, [], fs);
figure(5); hold on;
plot(fo_sim, 10*log10(Po));
plot(foAR, 10*log10(PoAR),'r');
legend('pwelch ','AR model');
title('Comparison between ''AR'' and ''welch''');

% finding the optimum order using FPE and AIC criterion
max_p = 100;
fpe_close= zeros(1, max_p);
aic_close= zeros(1, max_p);

for p = 1:max_p
    [~,err] = my_yw(close_raw, p);
    fpe_close(p) = err * (N+p+1) / (N-p-1);
    aic_close(p) = N * log(err) + 2 * p;
end

figure(6);
subplot(1,2,1);hold on;
[value_fpe, index_fpe] = min(fpe_close);
plot(1:max_p, fpe_close);
plot(index_fpe, value_fpe,'*');
title('FPE');

subplot(1,2,2);hold on;
[value_aic, index_aic] = min(aic_close);
plot(1:max_p, aic_close);
plot(index_aic, value_aic,'*');
title('AIC');
p= index_fpe;
%comparison between p = 60 and p = 12
[ac12, ec12] = my_yw(close_raw, 12);
wc12 = ec12*rand(1,N);
close_sim12 = filter(1, ac12, wc12);

[ac60, ec60] = aryule(close_raw, 60);
wc60 = ec60*rand(1,N);
close_sim60 = filter(1, ac60, wc60);

figure(7);hold on;
plot(t,close_sim12);
plot(t,close_sim60,'r');
plot(t,close_raw,'k');
legend('P = 12','P = 60','Original');
title('Signal Comparison');

[Pc60, fc60] = pyulear(close_raw, 60, [], fs);

figure(8); hold on;
plot(fc, 10*log10(Pc),'k');
plot(fc60, 10*log10(Pc60),'r');
plot(fAR, 10*log10(PcAR),'b');
legend('pwelch ','AR, P = 60','AR, P = 12');
title('Comparison between ''AR'' and ''welch'' PSD estimation');

% poles and zeros
[ac2, ec2] = my_yw(close_raw,p);
pd = roots(ac2);
[ao2, eo2] = my_yw(open_raw,p);
pdo = roots(ao2);
figure(9);
subplot(1,2,1)
zplane(0, pd);
subplot(1,2,2)
zplane(0, pdo);