function sinx_dalis
global x y
for i = 1:length(x)
    if x(i) ~= 0 
        y(i) = sin(x(i))/x(i);
    end
end
end