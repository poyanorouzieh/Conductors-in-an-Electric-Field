function [faces,vertices] = MeshFunction()

    clear
    clc
    close all

    %% Create spatial grid

    x = linspace(-10,10,100);
    y = linspace(-10,10,100);
    z = linspace(-10,10,100);

    [X,Y,Z] = meshgrid(x,y,z);

    %% Implicit function of sphere

    %F = (X./1).^2 + (Y./1).^2 + (Z./4).^2 - 1;

    %----------------------------------------------

    %F = (X.^2 + Y.^2 + Z.^2).^2 - 1 + ...
    %    3*(X.^3 + 0.7*Y.^3 - 0.5*Z.^3 + ...
    %    0.3*X.^2.*Y - 0.4*Y.^2.*Z + 0.2*Z.^2.*X);

    %----------------------------------------------

    R = 1.0;
    r = 0.35; 
    
    F =((X.^2 + Y.^2 + Z.^2 + R^2 - r^2).^2 ...
        - 4*R^2*(X.^2 + Y.^2)) ...
        + 0.08*(X.^3 + 0.7*Y.^3 - 0.5*Z.^3 ...
        + 0.4*X.*Y.*Z + 0.3*X.^2.*Y - 0.2*Y.^2.*Z);

    %---------------------------------------------

%     TH = atan2(Y, X);
%     PH = atan2(Z, sqrt(X.^2 + Y.^2));
% 
%     F = sqrt(X.^2 + Y.^2 + Z.^2) - ( ...
%         1 ...
%         + 0.28*sin(2*TH + 0.3).*cos(PH) ...
%         + 0.16*cos(3*PH - 0.7) ...
%         + 0.10*sin(4*TH + 1.2).*sin(PH) ...
%         + 0.06*cos(5*TH - 2*PH + 0.5) ...
%         + 0.85*exp( -(1 - (sin(PH).*sin(1.1) + ...
%             cos(PH).*cos(1.1).*cos(TH - 0.8)))/0.008 ) ...
%     );

    %% Generate mesh

    [faces,vertices] = isosurface(X,Y,Z,F,0);

    %% plot mesh

    %PlotMesh(vertices,faces)

end

function PlotMesh(vertices,faces)
    %% Plot mesh

    figure

    patch('Vertices',vertices,...
          'Faces',faces,...
          'FaceColor',[0.8 0.8 0.8],...
          'EdgeColor','k',...
          'LineWidth',0.5);

    axis equal
    grid on

    xlabel('x')
    ylabel('y')
    zlabel('z')

end
