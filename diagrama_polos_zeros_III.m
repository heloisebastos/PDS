%G1(z) é de fase mínima, pois seu polo (-1) e zero
% (-10) estão ambos situados no semi-plano esquerdo.
pkg load signal
pkg load control
clc
n=[0.1, 1];
d=[1, 1];
w=tf(n,d);
[z,p,k]= tf2zp(n,d);
figure;
pzmap(w);
figure;
zplane(z,p);
