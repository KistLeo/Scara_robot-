function drawBox(handles,x0, y0, z0,x1,y1,z1, r0,r1, h,theta, colr)
opacity=0.7;

X=[x0+r0*sin(theta) x0-r0*sin(theta) x1-r1*sin(theta) x1+r1*sin(theta) x0+r0*sin(theta)];
Y=[y0-r0*cos(theta) y0+r0*cos(theta) y1+r1*cos(theta) y1-r1*cos(theta) y0-r0*cos(theta)];

Z=[z1*ones([1,5]);(z1+h)*ones([1,5])];
X_1=[X;X];
Y_1=[Y;Y];
surf(handles.robot_plot,X_1,Y_1,Z,'FaceColor', colr,'FaceAlpha', opacity);

fill3(handles.robot_plot,X_1(1,:), Y_1(1,:),  Z(1,:), colr);
fill3(handles.robot_plot,X_1(1,:), Y_1(1,:), Z(2,:), colr);
end