pkg load signal

%[B,A] = butter(N,Wn)


Wn = 2*(10/50)
Wn= 0.4000
[b,a]=butter(4,Wn)
[H,W] = freqz(B,N,A)
[H,W] = freqz(b,a,1024);
semilogy(W,abs(H));
