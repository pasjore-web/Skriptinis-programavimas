%% 2026-09-27 Variantas 2 Jorūnė Paslavičiūtė
% 3 LD. Rezultatu grafinis 2D atvaizdavimas. 1 ir 2 uzduotys
clc; clear; close all;


%% ===== 1 UZDUOTIS. Dvimatis grafiku vaizdavimas =====
%% a) f(x) = x^3 + tan(x), x nuo 0 iki 2*pi, zingsnis 0.1
x  = 0:0.1:2*pi;
f1 = x.^3 + tan(x);

figure('Name', '1a uzduotis');
plot(x, f1, 'bo');                          % melyna spalva, "o" markeriai
title('f(x) = x^3 + tan(x)');
xlabel('x');
ylabel('f(x)');
legend('f(x) = x^3 + tan(x)', 'Location', 'best');
axis([min(x) max(x) min(f1) max(f1)]);      % asiu ribos pagal min/max reiksmes
grid on;

%% b) f(x) = e^x, e^(3x), e^(5x) - antrame grafiniame lange
f2 = exp(x);
f3 = exp(3*x);
f4 = exp(5*x);

figure('Name', '1b uzduotis');
% e^(5x) auga labai greitai (iki ~1e13), todel naudojama logaritmine y asis,
% kad visos trys funkcijos butu matomos
semilogy(x, f2, 'r-', x, f3, 'g-', x, f4, 'm-', 'LineWidth', 1.5);
title('Eksponentines funkcijos');
xlabel('x');
ylabel('f(x)');
legend('f(x) = e^x', 'f(x) = e^{3x}', 'f(x) = e^{5x}', 'Location', 'northwest');
ymin = min([f2 f3 f4]);
ymax = max([f2 f3 f4]);
axis([min(x) max(x) ymin ymax]);
grid on;



%% ===== 2 UZDUOTIS. Specializuotu grafiku kurimas =====
%% 2a) 6 studentai x 4 egzaminai - ivertinimu matrica 6x4
vardai = {'Jonas', 'Ona', 'Petras', 'Rasa', 'Tomas', 'Greta'};
egzam  = {'1 egz.', '2 egz.', '3 egz.', '4 egz.'};

paz = [ 8  9  7 10;
        6  7  8  5;
       10  9  9  8;
        5  6  4  7;
        9  8 10  9;
        7 10  6  8];

[nStud, nEgz] = size(paz);

figure('Name', '2 uzduotis');

% --- Pirmasis grafikas: vertikali stulpeline diagrama ---
subplot(2, 1, 1);
bar(paz);                                   % grupuoti stulpeliai
title('a) Studentu egzaminu rezultatai (stulpeline diagrama)');
xlabel('Studentai');
ylabel('Pazymys');
set(gca, 'XTick', 1:nStud, 'XTickLabel', vardai);   % studentu vardai
legend(egzam, 'Location', 'northeastoutside');
axis([0.5 nStud+0.5 0 10]);                 % y asis nuo 0 iki 10
grid on;

% --- Antrasis grafikas: diskretus formatas (stem) ---
% kiekvienas egzaminas pastumiamas per maza atstuma, kad butu matomas
% kiekvienas duomenu elementas
subplot(2, 1, 2);
hold on;
spalvos = lines(nEgz);
poslinkis = linspace(-0.27, 0.27, nEgz);
for k = 1:nEgz
    stem((1:nStud) + poslinkis(k), paz(:, k), 'filled', ...
         'Color', spalvos(k, :), 'LineWidth', 1.5);
end
hold off;
title('b) Studentu egzaminu rezultatai (diskretus formatas)');
xlabel('Studentai');
ylabel('Pazymys');
set(gca, 'XTick', 1:nStud, 'XTickLabel', vardai);
legend(egzam, 'Location', 'northeastoutside');
axis([0.5 nStud+0.5 0 10]);
grid on;
