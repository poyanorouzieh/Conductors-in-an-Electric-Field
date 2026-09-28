function f = superellipsoid()
    f = @(x,y,z) abs(x).^4 + abs(y).^4 + abs(z).^4 - 1;
end