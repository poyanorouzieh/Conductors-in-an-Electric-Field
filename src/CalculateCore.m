function [sigma,potential] = CalculateCore(AreaMatric,MeshLocation,charge,t,A)
    N = length(AreaMatric);
    E0 = E0Function();
    b = Creatb(E0,MeshLocation,charge,t);

    x = A\b;

    sigma = x(1:N);
    potential = x(N+1);

end


function b = Creatb(E0,MeshLocation,charge,t)
    N = size(MeshLocation,1);

    E = E0(t);
    b = zeros(N+1,1);

    b(1:N) = MeshLocation * E.';

    b(N+1) = charge;
    
end