function E0 = E0Function()

omega = 2*pi/8;
Emax = 1 ; 
E0 = @(t) [Emax*cos(omega*t), 0, 0];

end