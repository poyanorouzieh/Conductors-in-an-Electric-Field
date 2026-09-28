function f = star()
    f = @(x,y,z) x.^2 + y.^2 + z.^2 ...
    - (1 + 0.25*cos(5*atan2(y,x))).^2;
end