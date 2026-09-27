function A = CreatA(AreaMatric,MeshLocation)

F = CreatF(AreaMatric,MeshLocation);

N = length(AreaMatric);

A = [F.'          -ones(N,1);
     AreaMatric.'  0];
 
end

% by AI GPT5
function F = CreatF(AreaMatric,MeshLocation)

N = length(AreaMatric);


dx = MeshLocation(:,1) - MeshLocation(:,1).';
dy = MeshLocation(:,2) - MeshLocation(:,2).';
dz = MeshLocation(:,3) - MeshLocation(:,3).';


D = sqrt(dx.^2 + dy.^2 + dz.^2);

D(1:N+1:end) = Inf;


F = AreaMatric ./ D;


F(1:N+1:end) = 2 * sqrt(pi * AreaMatric);

end