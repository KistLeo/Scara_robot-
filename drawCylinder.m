function drawCylinder(handles,x0, y0, z0, r, h, color)
    % x0, y0, z0: coordinates of the center
    % r: radius
    % h: height

    opacity =0.7;
    % Define the number of points for the cylinder's surface
    numPoints = 100;

    % Create a grid of points for the cylinder side surface
    theta = linspace(0, 2*pi, numPoints);
    z = linspace(z0, z0 + h, numPoints);
    [Theta, Z] = meshgrid(theta, z);

    % Calculate the X and Y coordinates for the points on the side surface
    X = r * cos(Theta) + x0;
    Y = r * sin(Theta) + y0;

    % Create the cylinder side surface
    surf(handles.robot_plot,X, Y, Z, 'FaceColor', color, 'EdgeColor', 'none', 'FaceAlpha', opacity);


    % Create the top and bottom surfaces
    fill3(handles.robot_plot,X(1,:), Y(1,:),  Z(1,:), color);
    fill3(handles.robot_plot,X(1,:), Y(1,:), Z(2,:), color);

    axis equal;
end
