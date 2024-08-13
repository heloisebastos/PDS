#Projeto de um filtro FIR para atenuação de frequencias superiores a 1KHz.
#Considerando uma atenuação mínima de 50dB na banda de rejeição e
# frequencia de amostragem de 20kHz

% Implementação de um filtro FIR

% Carregar o pacote signal
pkg load signal

% Parâmetros do filtro
fs = 20000; % Frequência de amostragem em Hz
fc = 1200;  % Frequência de corte em Hz
M = 14;     % Comprimento do filtro

% Frequência de corte normalizada (em termos de pi)
fc_normalizada = (10 * pi * fc) / fs; % Resultado: 0.6*pi

% Criar filtro FIR usando janela de Hamming
b = fir1(M-1, fc_normalizada/(2*pi), hamming(M)); % Normalizar para [0, 1]

%w = hamming(M);

% Calcular a resposta em frequência
[h, omega] = freqz(b, 1, 256, fs);

% Converter a magnitude para decibéis
magnitude = 20 * log10(abs(h));

% Plotar a resposta em frequência
figure;
plot(omega, magnitude);
grid on;

xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('Resposta em Frequência do Filtro FIR com Janela de Hamming');
xlim([0 fs/2]); % Limitar o eixo x até a frequência de Nyquist
ylim([-100 10]); % Ajustar o eixo y para mostrar melhor a atenuação

%xlabel('Ganho(dB)');
%ylabel('Frequencia normalizada');
%title('Resposta em Frequência do Filtro FIR com Janela de Hamming');





