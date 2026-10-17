%PARAMETRI PROGETTO
Vin = 12; Vout = 5; Iout = 1; 
fsw = 100e3;
dI = 0.3*Iout;
dV = 0.05;
%CALCOLO GRANDEZZE
D = Vout/Vin;
L = (Vin-Vout)*D / (dI*fsw);
C = dI/(8*fsw*dV);

fprintf('Duty Cicle (D): %.3f\n', D);
fprintf('Induttanza (L): %.1f uH\n', L*1e6);
fprintf('Condensatore (C): %.1f uF\n', C*1e6);

%Il condensatore reale sarà più grande di 7.5 uF.
%Il condensatore ideale presenta una resistenza in serie che introduce 
%una ulteriore caduta di tensione (dV2 = dI * R2), aumentando l'ondulazione
%per rimanere sotto i 50 mV serve capacità maggiore.

%GRAFICO CORRENTE INDUTTORE
T = 1/fsw;
Imin = Iout - dI/2;

pendenza_salita = (Vin-Vout) / L;
pendenza_discesa = -Vout / L;

Imax = Imin + pendenza_salita * (D*T);

t = [0, D*T, T, ...
      T, T + D*T, 2*T, ...
      2*T, 2*T + D*T, 3*T];
iL = [Imin, Imax, Imin, ...
      Imin, Imax, Imin, ...
      Imin, Imax, Imin];

%PLOT
figure;
plot(t*1e6, iL, 'b-', 'LineWidth', 2);
grid on;
title('Andamento della corrente nell''induttore');
xlabel('Tempo (\mus)');
ylabel('Corrente (A)');

fprintf('\n--- Controllo Corrente ---\n');
fprintf('Imin calcolata: %.2f A\n', Imin);
fprintf('Imax calcolata: %.2f A\n', Imax);

%SALVA GRAFIFO
saveas(gcf, 'corrente_induttore.png');



