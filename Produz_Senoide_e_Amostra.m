clear all; close all; clc;
% Limpa todas as variáveis do workspace, fecha todas as figuras abertas e limpa a janela de comando.

% dados do sinal
f = 10000; %Freq entrada 10 kHz
fs = 50000; %Freq de amostragem
% Define a frequência da entrada como 10 kHz e a frequência de amostragem como 50 kHz.

% gerar sinal contínuo T=10 - períodos do sinal
tempo = [0:1/(100*f):10/f];
% Gera um vetor de tempo de 0 a 10 segundos, com intervalos de tempo equivalentes a 1/ (100 * frequência do sinal), permitindo representar 10 períodos do sinal.

% Geração onda senoidal
sinal = sin(2*pi*f*tempo);
% Gera um sinal senoidal com a frequência especificada.

% plotar sinal
plot(tempo, sinal)
hold;
% Plota o sinal contínuo gerado em relação ao tempo e mantém a figura atual para adicionar mais elementos posteriormente.

% sinal amostrado
Ts = 1/fs;
N = length(tempo);
n = [0:1:N-1];
t_sample = [0:Ts:n(N)*Ts];
freq_amostra = 2*pi*f/fs;
sinal_sample = sin(freq_amostra.*n);
% Calcula o sinal amostrado, determinando o período de amostragem, o número total de amostras, o vetor de tempo de amostragem, a frequência de amostragem em radianos e o sinal amostrado.

% plotar sinal amostrado
plot(t_sample, sinal_sample,'o');
axis([0 10/f -1.5 1.5]) %fixar limite eixos x e y
set(gca,'FontSize',16)
set(gca,'FontSize',16)
xlabel('t')
ylabel('x(t) e x[nT_s]')
hold off
% Plota o sinal amostrado em relação ao tempo de amostragem, ajusta os limites dos eixos x e y, define o tamanho da fonte dos eixos, adiciona rótulos aos eixos x e y, e limpa a figura para futuros gráficos.

