function E = RotatingField()
    
    E0 = 1;
    omega = 2*pi/50;
    E = @(x,y,z,t) E0.*[ sin(omega*t) , cos(omega*t) , 0];

end