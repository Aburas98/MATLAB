function [hopt,error]=wien(x,s,N)
rxx=xcorr(x,'biased');
rx=rxx(length(x):end);
Rxx=toeplitz(rx(1:N));
rss=xcorr(s,'biased');
rs=rss(length(s):length(s)+N-1);
hopt=(inv(Rxx))*rs;
error=rs(1)-rs'*hopt;