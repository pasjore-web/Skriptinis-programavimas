clear all
global x y

x = 2*pi : -0.1 : -2*pi;
y = zeros(size(x));

sinx_dalis;
vieneto_dalis;

plot(x, y, 'y--*')
grid on
title('y(x) = sin(x)/x')
xlabel('x')
ylabel('y(x)')

whos