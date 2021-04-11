close = load('eegclose');
open = load('eegopen');
close=close.eegclose(:,2);
open=open.eegopen(:,2);
n = length(close);
fs = 250;
x = (0:n-1)'/fs;
figure(1)
subplot(2,1,1)
plot(x,close);
xlabel('Time/s');ylabel('Mag./mV');title('closed eye signal')
subplot(2,1,2)
plot(x,open);
xlabel('Time/s');ylabel('Mag./mV');title('open eye signal')
len = 500;
d_num = 100;
%Building FIR 
win = cell(1,4);
rect= boxcar(n-len);win{1,1}=rect;
trian=triang(n-len);win{1,2}=trian;
hamm=hamming(n-len);win{1,3}=hamm;
bman=blackman(n-len);win{1,4}=bman;
close_w = cell(1,4);
open_w = cell(1,4);

for i = 1:length(win)
    close_w{1,i} = zeros(n-len,1);
    open_w{1,i} = zeros(n-len,1);
         for j = 1:d_num:len;
             a_1=close(j:n-len-1+j,1).*win{1,i};
             b_1=open(j:n-len-1+j,1).*win{1,i};
             a=10*log10(abs(fft(a_1)).^2/(n-len));
             b=10*log10(abs(fft(b_1)).^2/(n-len));
             close_w{1,i}= a+close_w{1,i};
             open_w{1,i}=b+open_w{1,i};
         end
end
%Spectral Averaging
for i = 1:length(win)
    close_w{1,i}=close_w{1,i}/len;
    open_w{1,i}=open_w{1,i}/len;
end

freq=(0:(n-len)/2-1)/(n-len)*fs;
figure(2)
names={'Rectangular window','Triangular window','Hamming window','Kaiser window'};
locate_mid = [1.5,5.5,10.5,22,45];
loc = {[1,3] [4,7] [8,13] [14,30]};
for i = 1:4
    subplot(4,2,2*i-1)
    plot(freq,close_w{1,i}(1:(n-len)/2))
    xlabel('Freq./Hz');ylabel('db');
    title(['closed eye signal plus ',names{1,i},' power spectrum']);
    axis([0 100 min(close_w{1,i}) max(close_w{1,i})])
    set(gca,'XTickmode','manual','XTick',locate_mid)
    subplot(4,2,2*i)
    plot(freq,open_w{1,i}(1:(n-len)/2))
    xlabel('Freq./Hz');ylabel('db');
    title(['open eye signal plus ',names{1,i},' power spectrum']);
    axis([0 100 min(open_w{1,i}) max(open_w{1,i})])
    set(gca,'XTickmode','manual','XTick',locate_mid)
end