%% 2026-09-27 Variantas 2 Jorūnė Paslavičiūtė
% 3 LD. Papildoma uzduotis - Signalu grafinis atvaizdavimas (2 LD 3 uzd. signalai)
clc; clear; close all;

%% 2 LD 3 uzduoties duomenys
t = 0 : 0.002 : 1.5;
A_s = 4;
f = 3;
sigma = 1;
U1 = 2.5;
U2 = 1.5;

s = A_s*sin(2*pi*f*t);              % svarus signalas
n = sigma*randn(size(t));           % triuksmas
s_n = s + n;                        % pradinis (triuksmingas) signalas

s_filtr = s_n;                      % filtruotas signalas
s_filtr(abs(s_filtr) < U2) = 0;

%% Pradinio signalo reiksmes, virsijancios U1
idx = s_n > U1;
t_atr = t(idx);
atrinktos = s_n(idx);

% Kiekvienoje teigiamoje sinusoides puseje (s > 0) randama
% viena minimali ir viena maksimali reiksme is virsijanciu U1
puse  = s > 0;
pradz = find(diff([0 puse]) == 1);
pab   = find(diff([puse 0]) == -1);
t_max = []; u_max = []; t_min = []; u_min = [];
for k = 1:numel(pradz)
    sr = pradz(k):pab(k);
    sr = sr(s_n(sr) > U1);          % tik reiksmes virs U1
    if isempty(sr), continue; end
    [mx, iMx] = max(s_n(sr));
    [mn, iMn] = min(s_n(sr));
    t_max(end+1) = t(sr(iMx));  u_max(end+1) = mx;
    t_min(end+1) = t(sr(iMn));  u_min(end+1) = mn;
end

figure('Name', 'Papildoma uzduotis', 'Position', [100 50 900 750]);

%% a) Pradinis ir filtruotas signalai
subplot(2, 1, 1);                                   % vertikalus isdestymas
plot(t, s_n,     'k-', 'LineWidth', 1);  hold on;   % pradinis: istisinis, juodas
plot(t, s_filtr, 'b:', 'LineWidth', 1.5);           % filtruotas: taskinis, melynas
yline(U1,  'r--', 'LineWidth', 1.5);                % U1: raudona, bruksnine
yline(U2,  'm-.', 'LineWidth', 1.2);                % U2
yline(-U2, 'm-.', 'LineWidth', 1.2, 'HandleVisibility', 'off');
hold off;
title('a) Pradinis ir filtruotas signalai');
xlabel('Laikas t, s');
ylabel('Itampa U, V');
legend('Pradinis signalas', 'Filtruotas signalas', ...
       'U_1 = 2.5 V', '\pmU_2 = \pm1.5 V', 'Location', 'southeast');
axis([min(t) max(t) min(s_n)-5 max(s_n)+0.5]);   % vietos legendai apacioje
grid on;

%% b) Reiksmes, virsijancios U1 (diskretus formatas)
subplot(2, 1, 2);
stem(t_atr, atrinktos, 'k', 'MarkerSize', 2, 'BaseValue', U1); hold on;
yline(U1, 'r--', 'LineWidth', 1.5);
plot(t_min, u_min, 'gd', 'MarkerFaceColor', 'g', 'MarkerSize', 9);   % min - zalias rombas
plot(t_max, u_max, 'r^', 'MarkerFaceColor', 'r', 'MarkerSize', 9);   % max - raudonas trikampis
hold off;
title('b) Pradinio signalo reiksmes, virsijancios U_1');
xlabel('Laikas t, s');
ylabel('Itampa U, V');
legend('U > U_1', 'U_1 = 2.5 V', 'Minimalios reiksmes', 'Maksimalios reiksmes', ...
       'Location', 'southeast');
axis([min(t) max(t) 0 max(s_n)+0.5]);
grid on;
