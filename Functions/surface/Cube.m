function f = Cube()
    f = @(x,y,z) max(abs(x),max(abs(y),abs(z))) - 1;
end