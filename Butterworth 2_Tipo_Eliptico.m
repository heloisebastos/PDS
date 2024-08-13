%------------------------
 %TIPO ELIPTICO
 pkg load signal
pkg load control
 clc;
 clear;
 disp('Processing')
 %------------------------------------------
 %Especificações filtro
 %------------------------------------------
 fs=1800;
 fp=100;
 fr=300;
 Ap=0.5;
 Ar=20;
 %------------------------------------------
 %Sinal a ser filtrado
 %------------------------------------------
 f1=50; % frequência dentro da banda de passagem
 f2=800; % frequência dentro da banda de rejeição (ruído)
 t=0:1:1000;
 % Sinal de entrada com ruido.
 x = 6*sin((2*pi*f1*t/fs))+2*sin((2*pi*f2*t/fs))+0.5*sin((2*pi*600*t/fs))+3*sin((2*
pi*700*t/fs));
%------------------------------------------
 %Plota sinal de entrada com ruído
 %------------------------------------------
 figure
 plot(x) % Plota sinal de entrada com ruído
 title('Sinal de entrada com Ruído')
 %------------------------------------------
 % Cria filtro Eliptico
 %------------------------------------------
 [ne,We]=ellipord(fp/500,fr/500,Ap,Ar);
[b,a] = ellip(ne,Ap,Ar,We);
 %------------------------------------------
 % Plota Magnitude e fase
 %------------------------------------------
 figure
 title(' Eliptc Lowpass Filter')
 freqz(b,a,7000,1800);
 %
 %------------------------------------------
 % Filtra sinal de entrada
 %------------------------------------------

 K = filter(b,a,x);
 %------------------------------------------
 % Plota espectro de saida
 %------------------------------------------
 figure
 n= max(size(K)); % Composição do eixo da freqüência..
 F = fs*(-n/2:(n/2)-1)/n;
 J1=abs(fftshift(fft(K))); %FFT
 stem(F,J1');
 title('Espectro Sinal filtrado');
 xlabel('Frequencia Hz');
 %------------------------------------------
 % Plota saída
 %------------------------------------------
 figure
 plot(K);
 title('Sinal filtrado');




 %------------------------------------------
 % Cria filtro Eliptico
 %------------------------------------------
 [ne, We]=ellipord(fp/500,fr/500,Ap,Ar)
 [b,a] = ellip(ne,Ap,Ar,We)
 %------------------------------------------
 % Plota Magnitude e fase
 %------------------------------------------
 figure
 title(' Eliptc Lowpass Filter')
 freqz(b,a,7000,1800)
 %
 %------------------------------------------
 % Filtra sinal de entrada
 %------------------------------------------
 K = filter(b,a,x)

 %------------------------------------------
 % Plota espectro de saida
 %------------------------------------------
 figure %espectro do sinal de entrada com ruido
 n= max(size(K)); % Composição do eixo da freqüência..
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da freqüência..
 J1=abs(fftshift(fft(K))); %FFT
 stem(F,J1')
 title('Espectro Sinal filtrado')
 xlabel('Frequencia Hz')

 %------------------------------------------


 % Plota saida
 %------------------------------------------
 figure
 plot(K)
 title('Sinal filtrado')
 %------------------------------------------
 % Filtro Cheby II
 %------------------------------------------
 [nc,Ws] = cheb2ord(fp/500,fr/500,Ap,Ar)
 [b2,a2] = cheby2(nc,Ar,Ws);
 freqz(b2,a2,7000,1800);
 title(' Chebyshev Type II Lowpass Filter')
 K1 = filter(b2,a2,x)
 %------------------------------------------
 % Plota espectro de saida
 %------------------------------------------
 figure %espectro do sinal de entrada com ruido
 n= max(size(K1)); % Composição do eixo da freqüência..
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da freqüência..
 J2=abs(fftshift(fft(K1))); %FFT
 stem(F,J2)
 title('Espectro Sinal filtrado')
 xlabel('Frequencia Hz')

 %------------------------------------------
 % Plota saida
 %------------------------------------------
 figure
 plot(K1)

 title('Sinal filtrado')
 %------------------------------------------
 % Filtro Cheby I
 %------------------------------------------
 [n1,Wp1] = cheb1ord(fp/500,fr/500,Ap,Ar)
 [b1,a1] = cheby1(n1,Ar,Wp1);
 figure
 freqz(b1,a1,7000,1800);
 title('Chebyshev Type I Lowpass Filter')
 K2 = filter(b1,a1,x)
 %------------------------------------------
 % Plota espectro de saida
 %------------------------------------------
 figure %espectro do sinal de entrada com ruido
 n= max(size(K2)); % Composição do eixo da freqüência..
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da freqüência..
 J3=abs(fftshift(fft(K2))); %FFT
 stem(F,J3')
 title('Espectro Sinal filtrado')
 xlabel('Frequencia Hz')

 %------------------------------------------
 % Plota saida
 %------------------------------------------
 figure
 plot(K2)
 title('Sinal filtrado')
 disp('END')
