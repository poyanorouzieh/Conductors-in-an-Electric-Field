function Core(EFunction, SurfaceFunction)
    %%---------------clear DATA----------------
    
    clc
    close all
    %%-------------- ADD PATH -------------------

    fullPath = mfilename('fullpath');
    currentFolder = fileparts(fullPath);
    rootFolder = fileparts(currentFolder);
    addpath(genpath(rootFolder));

    %%-------------- RESULT PATH ----------------

    resultDir = fullfile(rootFolder,'result');

    if ~exist(resultDir,'dir')
        mkdir(resultDir);
    end

    targetFile = fullfile(resultDir,'Resultfile.mp4');
    
    %%---------Calculate Constant--------------

    [faces,vertices] = MeshFunction(SurfaceFunction);
    [AreaMatric,MeshLocation] = GetAreaAndLocation(faces,vertices);
    A = CreatA(AreaMatric,MeshLocation);
    
    %%-----------------------------------------
    
    charge = 0 ;
    T = 1000;
    
    %%------------------------------------------

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
            AreaMatric,MeshLocation,charge,t,A,EFunction);

        sigmaMatrix(:,n) = sigma;
        potentialVector(n) = potential;

        if mod(n, N_time/20) == 0 || n == N_time
            waitbar(n/N_time, bar, sprintf("Runing") );
        end

    end

    sigmaMatrix = sigmaMatrix ./  9.9879e9 ;

    close(bar);

    %%------------------------------------------
    
    videoFile = targetFile;

    AnimateSigma(vertices...
    ,faces...
    ,sigmaMatrix...
    ,potentialVector...
    ,deltat...
    ,videoFile)

end

