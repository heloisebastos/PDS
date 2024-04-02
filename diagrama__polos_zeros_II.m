pkg load signal
pkg load control
clc
n=[-1/2, 1];
d=[-1/0.5, 1];
w=tf(n,d)
[z,p,k]= tf2zp(n,d);
figure;
pzmap(w);
figure;
zplane(z,p);
