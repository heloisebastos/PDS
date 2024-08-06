pkg load signal

[Z,P,K] = butter(5,7,'s')
compass(P);
[N,D] = zp2tf(Z,P,K);
H=tf(N,D)
