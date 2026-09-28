function  f = soft_cube()
    f = @(x,y,z) abs(x).^8 + abs(y).^8 + abs(z).^8 - 1;
end