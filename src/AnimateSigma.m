function AnimateSigma(vertices,faces,sigmaMatrix,deltat)
    % by AI

    [~,N_time] = size(sigmaMatrix);

    figure

    low  = prctile(sigmaMatrix(:),20);
    high = prctile(sigmaMatrix(:),80);

    h = patch('Vertices',vertices,...
              'Faces',faces,...
              'FaceVertexCData',sigmaMatrix(:,1),...
              'FaceColor','flat',...
              'EdgeColor','none');

    axis equal
    grid on
    view(3)

    xlabel('x')
    ylabel('y')
    zlabel('z')

    colorbar


    caxis([low high])

    for n = 1:N_time

        h.FaceVertexCData = sigmaMatrix(:,n);

        title(['t = ',num2str((n-1)*deltat)])

        drawnow

    end

end