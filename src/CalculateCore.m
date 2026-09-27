function [sigma,potential] = CalculateCore(AreaMatric,MeshLocation,charge,t)

F = CreatF(AreaMatric,MeshLocation);
N = length(AreaMatric);
A = CreatA(AreaMatric,F);
E0 = E0Function();
b = Creatb(E0,MeshLocation,charge,t);
x = A\b;
sigma = x(1:N);
potential = x(N+1);

end

function  F = CreatF(AreaMatric,MeshLocation)

N = length(AreaMatric);

F = zeros(N,N);

for i = 1:N
    for j = 1:N

        if i ~= j
            distance = norm(MeshLocation(j,:) - MeshLocation(i,:));
            F(i,j) = AreaMatric(i) / distance;
        end

    end
end

end

function A = CreatA(AreaMatric,F)

N = length(AreaMatric);

A = [F.'          -ones(N,1);
     AreaMatric.'  0];
 
end

function b = Creatb(E0,MeshLocation,charge,t)

N = size(MeshLocation,1);
E = E0(t);
b = zeros(N+1,1);

for j = 1:N
    b(j) = dot(E, MeshLocation(j,:));
end

b(N+1) = charge;

end