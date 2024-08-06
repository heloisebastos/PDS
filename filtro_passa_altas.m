pkg load signal

[Z,P,K] = butter(2,1,'high','s')
compass(P);
[N,D] = zp2tf(Z,P,K);
H=tf(N,D)
