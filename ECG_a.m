%% Loading the ECG file  %%
fnam = input('Enter the ECG file name :','s');
fid = fopen(fnam);
ecg = fscanf(fid,'%f ');
fs = 200; %sampling rate
sze = length(ecg);
maxecg=max(ecg);
necg = ecg/maxecg; % normalize the maximum value to unity
time = (1 : sze)/fs;
figure;
plot(time,necg);
axis tight;
ylabel('ECG');
xlabel('Time in seconds');
g=[zeros(10,1);necg;zeros(10,1)];
gmax=max(g);
rate=0.7;
th=rate*gmax;
%Find data above threshold
a=find(g>th);
len_a=length(a);
r_wave=[];M=5;
%Compare with the contiguous datas
for j = 1:len_a
    if g(a(j))==max(g((a(j)-M):(a(j)+M)))
        r_wave=[r_wave;a(j) g(a(j))];
    end
end
j = 1;

while j<size(r_wave,1)
    if (r_wave(j+1,1)-r_wave(j,1))/fs<0.4
        if r_wave(j,2)<r_wave(j+1,2)
            r_wave(j,:)=[];
        else
            r_wave(j+1,:)=[];
        end
    else
        j=j+1;
    end
end
t=0:1/fs:(length(g)-1)/fs;
plot(t,g(:,1));hold on;
i = 1;
j = 1;
for j = 1:length(g)
    if r_wave(i,1) == j 
        g(j,2) = g(j,1);
        i =i+1;
    else g(j,2) = 0;
    end

end
k=g(:,2);
plot(t,k,'o')