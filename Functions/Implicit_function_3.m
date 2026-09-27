function F = Implicit_function_3()

       F = @(X,Y,Z) (X.^2 + Y.^2 + Z.^2).^2 - 1 + ...
       3*(X.^3 + 0.7*Y.^3 - 0.5*Z.^3 + ...
       0.3*X.^2.*Y - 0.4*Y.^2.*Z + 0.2*Z.^2.*X);
    
end