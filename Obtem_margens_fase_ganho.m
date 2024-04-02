% Obtenha os margens de fase e ganho do sistema para o caso em que K = 10.
num = 10;
den = conv([1 0],conv([1 1],[1 5]))
%den = [1, 6, 5, 0];
sys = tf(num,den);
bode(sys)
margin(sys)
