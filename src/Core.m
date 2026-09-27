%%---------------clear DATA----------------
clear
clc
close all
%%--------------ADD_PATH-------------------

fullPath = mfilename('fullpath');
currentFolder = fileparts(fullPath);
addpath(genpath(currentFolder));

%%---------Calculate Constant--------------

[faces,vertices] = MeshFunction();
[AreaMatric,MeshLocation] = GetAreaAndLocation(faces,vertices);
A = CreatA(AreaMatric,MeshLocation);

%%-----------------------------------------

%%------------------------------------------

charge = 0 ;
T = 400;
N_time = 100;
deltat = T/N_time;
N = length(AreaMatric);

%%------------------------------------------

sigmaMatrix = zeros(N,N_time);
potentialVector = zeros(1,N_time);

%%------------------------------------------

bar = waitbar(0, 'Runing ... ');
for n = 1:N_time

    t = (n-1)*deltat;

    [sigma,potential] = CalculateCore( ...
        AreaMatric,MeshLocation,charge,t,A);

    sigmaMatrix(:,n) = sigma;
    potentialVector(n) = potential;
    
    if mod(n, N_time/20) == 0 || n == N_time
        waitbar(n/N_time, bar, sprintf("Runing") );
    end
    
end

sigmaMatrix = 9.9879e9 .* sigmaMatrix;

close(bar);

%%

AnimateSigma(vertices,faces,sigmaMatrix,deltat)

