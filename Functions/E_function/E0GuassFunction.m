function E0 = E0GuassFunction()
    
    omega = 2*pi/10;
    E0 = @(t) [ 0 , sin(omega*t) , 0];

end