function f = wave_surface()
    f = @(x,y,z) x.^2 + y.^2 + z.^2 ...
    - (1 + 0.2*sin(4*x).*sin(4*y)).^2;
end