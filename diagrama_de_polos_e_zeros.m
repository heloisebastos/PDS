pkg load signal
figure;
num=[2,4];den=[1,4,-3];
[z,p,k]=tf2zp(num,den);
zplane(z,p)
roots(den)

figure;
num=[1,2,6];den=[1,3];
[z,p,k]=tf2zp(num,den);
zplane(z,p)
roots(den)



