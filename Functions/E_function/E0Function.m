function E0 = E0Function()

    % omega = 2*pi/20;
    Emax = 40 ; 
    E0 = @(t) [Emax*t , 0 , 0];

end