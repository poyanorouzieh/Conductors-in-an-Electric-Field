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
