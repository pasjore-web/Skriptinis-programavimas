function vieneto_dalis
global x y
for i = 1:length(x)
    if x(i) == 0
        y(i) = 1;
    end
end
end