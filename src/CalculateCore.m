function [sigma,potential] = CalculateCore(AreaMatric,MeshLocation,charge,t,A,E)
    N = length(AreaMatric);

    b = Creatb(E,MeshLocation,charge,t);

    x = A\b;

    sigma = x(1:N);
    potential = x(N+1);

end

% by AI (GPT5)
function b = Creatb(E0,MeshLocation,charge,t)

    N = size(MeshLocation,1);

    x = MeshLocation(:,1);
    y = MeshLocation(:,2);
    z = MeshLocation(:,3);

    E = E0(x,y,z,t);

    b = zeros(N+1,1);

    b(1:N) = x.*E(:,1) + ...
             y.*E(:,2) + ...
             z.*E(:,3);

    b(N+1) = charge;

end