%-----------------------------------------
clear
clc
close all
%------------------------------------------

[faces,vertices] = MeshFunction();
[AreaMatric,MeshLocation] = GetAreaAndLocation(faces,vertices);

charge = 0;
N_time = 100;

% assum T
T = 400;

deltat = T/N_time;

N = length(AreaMatric);

sigmaMatrix = zeros(N,N_time);
potentialVector = zeros(1,N_time);


bar = waitbar(0, 'Runing ... ');

for n = 1:N_time

    t = (n-1)*deltat;

    [sigma,potential] = CalculateCore( ...
        AreaMatric,MeshLocation,charge,t);

    sigmaMatrix(:,n) = sigma;
    potentialVector(n) = potential;
    
    if mod(n, N_time/20) == 0 || n == N_time
        waitbar(n/N_time, bar, sprintf("Runing") );
    end
    
end

close(bar);

AnimateSigma(vertices,faces,sigmaMatrix,deltat)


