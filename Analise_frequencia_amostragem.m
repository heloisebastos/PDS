clc; % Limpa a janela de comando

% Cria um vetor de tempo de 0 a 2 segundos com passos de 0.0001 segundo
t = 0:0.0001:2;

% Gera um sinal analógico x(t) = sin(2*pi*5*t)
x = sin(2*pi*5*t); % sinal analógico

% Cria uma nova figura
figure

% Define um subplot com 2 linhas e 1 coluna, selecionando o primeiro subplot
subplot(2,1,1)

% Plota o sinal analógico x(t) em relação ao tempo
plot(t,x);

% Define a frequência de amostragem como 20 Hz
fs = 20; % varia a freq. de amostragem para análise

% Cria um vetor de tempo de 0 a 2 segundos com passos de 1/fs segundo
ts = 0:1/fs:2;

% Gera uma versão amostrada do sinal x(t) com a frequência de amostragem definida
xs = sin(2*pi*5*ts);

% Define o segundo subplot
subplot(2,1,2)

% Plota a versão amostrada do sinal x(t) em relação ao tempo de amostragem
plot(ts,xs,'ro-');

