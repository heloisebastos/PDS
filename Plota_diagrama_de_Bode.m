%plota o diagrama de bode para o sistema :
clf
numg=[1 3];
deng=conv([1 2],[1 2 25]);
'G(s)'
G=tf(numg,deng)
bode(G)
grid on
title('Resposta em frequencia em malha aberta')
[mag,fase,w]=bode(G);
pontos=[20*log10(mag(:,:))',fase(:,:)',w]

