clc
clear all
close all
disp('Processing')

 %------------------------------------------
 %Especificações filtro
 %------------------------------------------
 fs=1800; % frequência de Amostragem
 fp=100; % largura banda de passagem
 fr=300; % banda de rejeição
 Ap=0.5; % Ganho banda de passagem
 Ar=20; % Atenuação banda de rejeição

 %------------------------------------------
 %Sinal a ser filtrado
 %------------------------------------------
 f1=50; % frequência dentro da banda de passagem
 f2=800; % frequência dentro da banda de rejeição (ruído)
 t=0:1:1000;
 % Sinal de entrada com ruido
 x = 6*sin((2*pi*f1*t/fs))+2*sin((2*pi*f2*t/fs))+0.5*sin((2*pi*600*t/fs))+3*sin((2*pi*700*t/fs));

 %------------------------------------------
 %Plota sinal de entrada com ruído
 %------------------------------------------
 figure
 plot(x) % Plota sinal de entrada com ruído
 title('Sinal de entrada com Ruído')


 %------------------------------------------
 %Plota espectro de frequência para o sinal de entrada
 %------------------------------------------
 figure
 n= max(size(t)); % Composição do eixo da frequência.
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da frequência.
 J=abs(fftshift(fft(x))); %FFT – espectro de frequência
 stem(F,J);
 xlabel('Frequência Hz')
 title('Espectro de frequência')
 %------------------------------------------
 % Butterworth
 %------------------------------------------
 % Ordem do filtro e frequência
 [N,Wn]=buttord(fp/500,fr/500,Ap,Ar) %Frequência banda passagem, frequência banda rejeição e ganhos
 % Numerador e denominador
 [num,den]=butter(N,Wn)
 %plota modulo e fase do filtro
 figure
 freqz(num,den,7000,1800)
 title('Filtro Passa-Baixas Butterworth')

 %------------------------------------------
% Filtra o sinal de entrada
 %------------------------------------------
 Y = filter(num,den,x);
 %------------------------------------------
 % Plota o sinal de saída do filtro(filtrado)
 %------------------------------------------
 figure
 plot(Y)
 title('Sinal Filtrado Butterworth')
 %------------------------------------------
 % Plota o espectro do sinal filtrado
 %------------------------------------------
 figure %espectro do sinal de entrada com ruído
 n= max(size(Y)); % Composição do eixo da frequência..
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da frequência..
 J=abs(fftshift(fft(Y))); %FFT
 stem(F,J)
 title('Espectro Sinal Filtrado Butterworth')
 xlabel('Frequência Hz')


