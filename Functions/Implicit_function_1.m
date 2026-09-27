function F = Implicit_function_1()

    F = @(X,Y,Z) (X./3).^2 + (Y./3).^2 + (Z./1).^2 - 1;
    
end