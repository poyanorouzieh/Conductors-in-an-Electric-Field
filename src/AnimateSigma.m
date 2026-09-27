function AnimateSigma(vertices,faces,sigmaMatrix,potentialVector,deltat,videoFile)

% =========================================================
% AnimateSigma
%
% vertices        : Vertex coordinates
% faces           : Triangle connectivity
% sigmaMatrix     : Surface charge density at each time step
% potentialVector : Conductor potential at each time step
% deltat          : Physical time interval between simulation steps
% videoFile       : Output video file path and name
%
% Example:
% videoFile = 'C:\MyProject\Results\sigma_animation.mp4';
%
% =========================================================


%% Check input dimensions

[~,N_time] = size(sigmaMatrix);

if length(potentialVector) ~= N_time
    error('potentialVector length must match the number of time steps.');
end


%% Animation settings

% Pause between frames during MATLAB display
pauseTime = 0.01;

% Video frame rate
videoFPS = 10;


%% Color limits

% Use the 98th percentile of the absolute values
% to reduce the effect of extreme outliers.
colorLimit = prctile(abs(sigmaMatrix(:)),98);

if colorLimit == 0
    colorLimit = 1;
end


%% Create figure

screenSize = get(0,'ScreenSize');

left = (screenSize(3)-700)/2;
bottom = (screenSize(4)-700)/2;

fig = figure( ...
    'Units','pixels', ...
    'Position',[left bottom 700 600]);

h = patch( ...
    'Vertices',vertices, ...
    'Faces',faces, ...
    'FaceVertexCData',sigmaMatrix(:,1), ...
    'FaceColor','flat', ...
    'EdgeColor','none');

axis equal
grid on
view(3)

xlabel('x')
ylabel('y')
zlabel('z')

colorbar

caxis([-colorLimit colorLimit])

baseColors = [
    0.189 0.071 0.232   % Dark blue
    0.150 0.300 0.800   % Blue
    0.050 0.650 0.950   % Cyan-blue
    0.000 0.850 0.700   % Cyan
    0.88  0.88  0.88    % Neutral / Zero
    1.000 0.900 0.000   % Yellow
    1.000 0.650 0.000   % Orange
    1.000 0.250 0.000   % Red-orange
    0.600 0.000 0.000   % Dark red
];

x = linspace(0,1,size(baseColors,1));
xi = linspace(0,1,256);

customMap = interp1(x,baseColors,xi);

colormap(customMap);

%% Create conductor potential text

potentialText = annotation( ...
    fig, ...
    'textbox', ...
    [0.02 0.88 0.25 0.07], ...
    'String',sprintf('V_{conductor} = %.6g',potentialVector(1)), ...
    'FontSize',12, ...
    'FontWeight','bold', ...
    'EdgeColor','none', ...
    'BackgroundColor','white');


%% Create video file

video = VideoWriter(videoFile,'MPEG-4');

video.FrameRate = videoFPS;

open(video);


%% Animation loop

for n = 1:N_time

    % Update surface charge density
    h.FaceVertexCData = sigmaMatrix(:,n);

    % Calculate physical time
    t = (n-1)*deltat;

    % Update time title
    title(sprintf('t = %.4g',t));

    % Update conductor potential
    potentialText.String = ...
        sprintf('V_{conductor} = %.6g',potentialVector(n));

    % Update figure
    drawnow

    % Capture current figure
    frame = getframe(fig);

    % Write frame to video
    writeVideo(video,frame);

    % Pause during MATLAB display
    pause(pauseTime);

end


%% Close video file

close(video);

end