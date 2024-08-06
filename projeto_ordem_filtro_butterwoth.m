wa = 500;
wp = 40/500;
ws = 150/wa;
[n,wn] = buttord(wp,ws,3,60); %wn freq de corte
[b,a] = butter(n,wn);
freqz(b,a,512,1000);
tf(b,a)
