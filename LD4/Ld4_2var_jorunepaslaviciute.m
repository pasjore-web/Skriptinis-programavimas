clc; clear; close all;

%% 1a)
[X, Y] = meshgrid(-2:0.1:1);
Z = 1 - 2*X.^2-3*Y.^2;

figure;
h1 = surf(X, Y, Z);
colormap(parula);
shading interp;
rotate(h1, [ 0 0 1], 78);
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title('f(x,y) = 1 - 2x^2 - 3y^2 (pasukta 78^o)');
grid on;

%% 1b)

x = (2*rand(1,200) - 1) .* sqrt(pi/2);
y = (2*rand(1,200) - 1) .* sqrt(pi/2);
[X, Y] = meshgrid(sort(x), sort(y));
Z = sin(X.^2 + Y.^2);

figure;
h2 = surf(X, Y, Z);
colormap(hot);
shading interp;
rotate(h2, [0 0 1], 45);
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title('f(x,y) = sin(x^2 +y^2) (pasukta 45^o)');
grid on;

%% papildoma uzduotis
[X, Y] = meshgrid(-1:0.05:1);
Z = 1 - (X.^2 + Y.^2);

figure;

%% a) su apšvietimu
subplot(1, 3, 1);
surf(X, Y, Z);
shading interp;
camlight;
lighting gouraud;    
xlabel('x'); ylabel('y'); zlabel('z');
title('a) su apsvietimu (camlight)')

%% b) su kontūru pagrindo plokštumoje
subplot(1, 3, 2);
surfc(X, Y, Z);
shading interp;
xlabel('x'); ylabel('y'); zlabel('z');
title('b) su konturu (surfc)');

%% c) paprastas pavirsius
subplot(1, 3, 3);
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');
title('c) paprastas pavirsius');