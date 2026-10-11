clc; clear;

%% 1. Strukturos
% a)
studentai(1).vardas = 'Jorūnė';
studentai(1).pavarde = 'Paslavičiūtė';
studentai(1).grupe = 'EDIf-25/1';
studentai(1).pazymiai = [9 8 10 7];

disp('Pirmo studento duomenys:')
disp(studentai(1))

% b)
studentai(2).vardas = 'Ieva';
studentai(2).pavarde = 'Masiliauskaitė';
studentai(2).grupe = 'EDIf-25/1';
studentai(2).pazymiai = [6 7 8 9];

studentai(3).vardas = 'Kara';
studentai(3).pavarde = 'Juknevičiūtė';
studentai(3).grupe = 'EDIf-25/1';
studentai(3).pazymiai = [10 9 8 9];

disp('Visa struktūra (3 studentai):')
disp(studentai)

disp('Antro studento duomenys PRIEŠ pakeitimą:')
disp(studentai(2))

studentai(2).pazymiai(3) = 10;

disp('Antro studento duomenys PO pakeitimo:')
disp(studentai(2))

disp('Laukų tipai:')
disp(['vardas: ', class(studentai(1).vardas)])
disp(['pazymiai: ', class(studentai(1).pazymiai)])

%% 2. Srauto valdymo konstruktoriai
palukanos = [0.10 0.15 0.20];
sumos = 10000:1000:20000;

lentele = zeros(length(sumos), 4);

for i = 1:length(sumos)
    lentele(i, 1) = sumos(i);
    for j = 1:length(palukanos)
        lentele(i, j + 1) = sumos(i) * (1 + palukanos(j)) /12;
    end
end

format bank
disp('        Suma        1 bankas      2 bankas     3 bankas')
disp(lentele)
format short 