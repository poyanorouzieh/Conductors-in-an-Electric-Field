clear
clc
close all

%% Create spatial grid

x = linspace(-3,3,50);
y = linspace(-3,3,50);
z = linspace(-3,3,50);

[X,Y,Z] = meshgrid(x,y,z);


%% Implicit function of sphere

F = (X./1).^2 + (Y./1).^2 + (Z./2).^2 - 1;


%% Generate mesh

[faces,vertices] = isosurface(X,Y,Z,F,0);


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

view(3)