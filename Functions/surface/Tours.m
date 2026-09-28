function F = Tours()

    F = @(x,y,z) (sqrt(x.^2 + y.^2) - 1.5).^2 + z.^2 - 0.5^2;

end