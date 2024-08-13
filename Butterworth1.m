%Sejam as frequências do sinal senoidal 300 Hz e 8 kHz. Crie um um filtro que remova a
%componente de 8 kHz usando um filtro do tipo Butterworth de ordem 5
 clc
 clear all
 close all
 pkg load signal;
 disp('Processando...')
 ts = 0.00001; %período amostragem
 fs = 1/ts;
 t = 0:ts:0.1;
 %Sinal ---------------------------------------------


 x = sin(2*pi*300*t)+0.2*sin(2*pi*8000*t);
 xlow = sin(2*pi*300*t);
figure
 subplot(2,1,1)
 plot(t,x)
 title('Sinal de Entrada'); xlabel('Tempo (s)');
ylabel('Valor');
 NFFT = length(t)*2;
 fVals = fs*(-NFFT/2:NFFT/2-1)/NFFT;
 X = fftshift(fft(x,NFFT));
 subplot(2,1,2)
 plot(fVals,abs(X));
 grid on, grid minor, set(gca,'xtick',[0:1000:10000])
 title('Espectro do Sinal'), axis([0 10000 0 6000]);
 xlabel('Frequência (Hz)'); ylabel('Magnitude');

%---------------------------------------------------------

 %Primeiro calculamos a frequência normalizada de 1 kHz, já que queremos
 % um valor entre as duas componentes como frequência de corte:

 nf = 2*pi*1000/fs; % frequência normalizada em 1kHz

 %Alternadamente podemos plotar a FFT direto em frequência normalizada
 %e achar a frequência normalizada por observação, embora isso necessite
 % de algum trabalho de manipulação:

 xm = abs(fft(x,fs*2));
 tam = length(xm);
 figure
 hold on
 plot(0:1/(tam/2 -1):1, xm(1:tam/2)/6000)
 axis([0 0.2 0 1])
 xlabel('Frequencia Normalizada (\pi rads/amostra)')
 ylabel('Magnitude')

%As funções de filtro (butter, cheby1, cheby2 e ellip) pegam como argumento
% a ordem do filtro, a(s) frequência(s) de corte e o tipo (passa-baixa,
% passa-alta, passa-banda, etc) e entrega os coeficientes de sua função de
% transferência. Olhe na documentação para aprender mais sobre seu uso.
%Criamos o filtro de acordo com as especificações:

 ff = [0:1/(tam/2-1):1];
 [b,a] = butter(5,nf,'low');
%– A função freqz(b,a) plota um diagrama de bode para análise de filtros discretos:

  h = freqz(b,a,floor(tam/2));
  h = abs(h);
  hold on
  plot(ff,h,'r')
  legend('Espectro do Sinal','Resposta do Filtro');


  %----------------------------------------------------------------

%E importante notar que o filtro apresenta atraso de fase, assim como qualquer sistema
%potencialmente pode. M=Mais adiante vamos ver como a fase se comporta num determinado
%sistema a uma determinada frequência, mas por hora observe o atraso no gráfico comparativo
%abaixo, onde a curva do sinal original está sendo plotada apenas com a componente de baixa
%frequência ( 300 Hz).

 xf = filter(b,a,x);
 figure
 subplot(2,1,1)
 plot(t,x),title('Sinal Original'),axis([0 0.01 -1.2 1.2]);
 xlabel('Tempo (s)');
 ylabel('Valor');
 subplot(2,1,2)
 plot(t,xf,'r'),title('Sinal Filtrado'),axis([0 0.01 -1.2 1.2]);
 xlabel('Tempo (s)');
 ylabel('Valor');
 figure
 hold on
 plot(t,xlow),axis([0 0.01 -1.2 1.2]);
 xlabel('Tempo (s)');
 ylabel('Valor');
 plot(t,xf,'r'),axis([0 0.01 -1.2 1.2]);
 legend('Sinal Original','Sinal Filtrado');
 hold off

