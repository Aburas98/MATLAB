close=load('eegclose');
open=load('eegopen');
close=close.eegclose(:,2);
open=open.eegopen(:,1);
n=length(close);
fs=250;
x=(0:n-1)'/fs;
figure(1)
subplot(2,1,1)
plot(x,close);
xlabel('Time / s');ylabel('Magnitude / mV');title('Closed eye signal')
subplot(2,1,2)
plot(x,open);
xlabel('Time / s');ylabel('Magnitude / mV');title('Open eye signal')
%build window_func
win=cell(1,4);
rect=boxcar(n);win{1,1}=rect;
trian=triang(n);win{1,2}=trian;
hamm=hamming(n);win{1,3}=hamm;
bman=blackman(n);win{1,4}=bman;
figure(2)
plot(1:n,rect);hold on
plot(1:n,trian);hold on
plot(1:n,hamm);hold on
plot(1:n,bman);
legend('Rectangular window','Triangular window','Hamming window','Blackman window')

close_w=cell(1,4);
open_w=cell(1,4);
for i = 1:length(win)
    close_w{1,i}=abs(fft(close.*win{1,i})).^2/n;
    [pks1,locs1]=findpeaks(close_w{1,i});
    open_w{1,i}=abs(fft(open.*win{1,i})).^2/n;
    [pks2,locs2]=findpeaks(open_w{1,i});
end
freq=(0:n/2-1)/n *fs;
 
figure(3)
names={'rectangular window','triangular wiindow','hamming window','blackman window'};
locate_mid=[1.5,5.5,10.5,22];
loc={[1,3] [4,7] [8,13] [14,30]};
for i = 1:4
    subplot(4,2,2*i-1)
    plot(freq,close_w{1,i}(1:n/2))
    xlabel('Frequency/Hz')
    title(['closed eye +',names{1,i},'power spectrum']);
    axis([0 40 0 max(close_w{1,i})/10])
    set(gca,'XTickmode','manual','Xtick',locate_mid)
    subplot(4,2,2*i)
    plot(freq,open_w{1,i}(1:n/2))
    xlabel('Frequency/Hz')
    title(['open eye +',names{1,i},'power spectrum']);
    axis([0 40 0 max(close_w{1,i})/10])
    set(gca,'XTickmode','manual','Xtick',locate_mid)

end
peaks_c=zeros(4,4);
peaks_o=zeros(4,4); 
locate = cell(1,4);
for j=1:4
    for i = 1:4
        locate{1,i}= find((freq>loc{1,i}(1))&(freq<loc{1,i}(2)));
        peaks_c(j,i)=max(findpeaks(close_w{1,j}(locate{1,i})));
        peaks_o(j,i)=max(findpeaks(open_w{1,j}(locate{1,i})));
    end
end
f = figure('Position',[440 500 461 146]);
%Create the column and row names in cell arrays
cnames = {'Delta(1-3Hz)','Theta(4-7Hz)','Alpha(8-13Hz)','Beta(14-30Hz)'};
%Create the uitable
t1 = uitable(f,'Data',peaks_c,'ColumnName',cnames,'RowName',names);
%Set width and height
t1.Position(3)=t1.Extent(3);
t1.Position(4)=t1.Extent(4);

f=figure('Position',[440 500 461 146]);
%Create the column and row names in cell arrays
cnames={'Delta(1-3Hz)','Theta(4-7Hz)','Alpha(8-13Hz)','Beta(14-30Hz)'};
%Create the uitable
t2 = uitable(f,'Data',peaks_o,'ColumnName',cnames,'RowName',names);
t2.Position(3)=t2.Extent(3);
t2.Position(4)=t2.Extent(4);

D=t2-t1;
