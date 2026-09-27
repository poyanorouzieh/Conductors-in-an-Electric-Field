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

F = (X).^2 + (Y).^2 + (Z).^2 - 1;

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
