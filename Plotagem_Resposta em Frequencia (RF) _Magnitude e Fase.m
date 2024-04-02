% Resposta em Frequência (RF) - Magnitude e Fase
clc;
b=[1];
a=[1,-0.9];
figure
zplane(b,a);
[H,w] = freqz(b,a,100);
magH = abs(H);
faseH = angle(H);
figure
subplot(2,1,1);
plot(w/pi,magH); grid;
xlabel('Frequências'); ylabel('Magnitude');title('Magnitude RF');
subplot(2,1,2);
plot(w/pi,faseH/pi); grid;
xlabel('Frequências'); ylabel('Fase');title('Fase RF');
pkg load control
clc;
s = tf('s');
num = 1;
den = s^2 + s + 10;
G=num/den;
bode(G)
title('Diagram de Bode')
