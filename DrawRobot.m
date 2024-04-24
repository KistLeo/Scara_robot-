
function DrawRobot(scara,handles)



 robot_plot = handles.robot_plot;
 cla(robot_plot,'reset')
 hold(robot_plot,'on')
 grid(robot_plot,'on')

p0 = [0 0 0];
p1 = scara.pos(1,:);
p2 = scara.pos(2,:);
p3 = scara.pos(3,:);
p4 = scara.pos(4,:);
d = scara.d;
o1 = scara.orien(1,:);
o2 = scara.orien(2,:);
o3 = scara.orien(3,:);
o4 = scara.orien(4,:);
%a = scara.a;

xlabel(robot_plot,'x');
ylabel(robot_plot,'y');
zlabel(robot_plot,'z');

  axis_scale = 0.1;
  quiver3(handles.robot_plot,p0(1), p0(2), p0(3), axis_scale, 0, 0, 'r', 'LineWidth', 2);
  quiver3(handles.robot_plot,p0(1), p0(2), p0(3), 0, axis_scale, 0, 'g', 'LineWidth', 2);
  quiver3(handles.robot_plot,p0(1), p0(2), p0(3), 0, 0, axis_scale, 'b', 'LineWidth', 2);
  
  R1 = [cos(o1(3)) -sin(o1(3)) 0; sin(o1(3)) cos(o1(3)) 0; 0 0 1];
  V_original = [axis_scale; axis_scale; axis_scale];
  V_rotated1 = R1 * V_original;
  quiver3(handles.robot_plot,p1(1), p1(2), p1(3), V_rotated1(1),0,0, 'r', 'LineWidth', 2);
  quiver3(handles.robot_plot,p1(1), p1(2), p1(3),0,V_rotated1(2),0, 'g', 'LineWidth', 2);
  quiver3(handles.robot_plot,p1(1), p1(2), p1(3),0,0,V_rotated1(3), 'b', 'LineWidth', 2);
  
   R2 = [cos(o2(3)) -sin(o2(3)) 0; sin(o2(3)) cos(o2(3)) 0; 0 0 1];
   V_original = [axis_scale; axis_scale; axis_scale];
   V_rotated2 = R2 * V_original;
   quiver3(handles.robot_plot,p2(1), p2(2), p2(3), V_rotated2(1), 0, 0, 'r', 'LineWidth', 2);
   quiver3(handles.robot_plot,p2(1), p2(2), p2(3), 0, V_rotated2(2), 0, 'g', 'LineWidth', 2);
   quiver3(handles.robot_plot,p2(1), p2(2), p2(3), 0, 0, V_rotated2(3), 'b', 'LineWidth', 2);
  
   R3 = [cos(o3(3)) -sin(o3(3)) 0; sin(o3(3)) cos(o3(3)) 0; 0 0 1];
   V_original = [axis_scale; axis_scale; axis_scale];
   V_rotated3 = R3 * V_original;
   quiver3(handles.robot_plot,p3(1), p3(2), p3(3),  V_rotated3(1), 0, 0, 'r', 'LineWidth', 2);
   quiver3(handles.robot_plot,p3(1), p3(2), p3(3), 0, V_rotated3(2), 0, 'g', 'LineWidth', 2);
   quiver3(handles.robot_plot,p3(1), p3(2), p3(3), 0, 0, V_rotated3(3), 'b', 'LineWidth', 2);
   
   
    R4 = [cos(o4(3)) -sin(o4(3)) 0; sin(o4(3)) cos(o4(3)) 0; 0 0 1];
    V_original = [axis_scale; axis_scale; axis_scale];
    V_rotated4 = R4 * V_original;
    quiver3(handles.robot_plot,p4(1), p4(2), p4(3), V_rotated4(1), 0, 0, 'r', 'LineWidth', 2);
    quiver3(handles.robot_plot,p4(1), p4(2), p4(3), 0, V_rotated4(2), 0, 'g', 'LineWidth', 2);
    quiver3(handles.robot_plot,p4(1), p4(2), p4(3), 0, 0, -V_rotated4(3), 'b', 'LineWidth', 2);
%draw ground
numPoints = 100; 
t = linspace(0, 2*pi, numPoints)';
x = 0.5*cos(t);
y = 0.5*sin(t);
z = zeros(length(t),1);
fill3(robot_plot,x,y,z,[0.5 0.5 0.5],'FaceAlpha',0.25);
view(robot_plot)

%base
drawCylinder(handles,0,0,0,0.11,0.15,[0.5 0.5 0.5]);

 %link 1

drawCylinder(handles, 0, 0, 0.15, 0.042, 0.07, [0.5 0.5 0.5]);
drawCylinder(handles, p1(1), p1(2), p1(3), 0.062, 0.07, [0.5 0.5 0.5]);
drawBox(handles, 0,0,0.15,p1(1),p1(2),p1(3),0.042,0.062,0.07,o1(3),'r');

 %link2
drawCylinder(handles, p1(1), p1(2), p1(3), 0.062, 0.263, [0.5 0.5 0.5]);
drawCylinder(handles, p2(1), p2(2), p2(3), 0.057, 0.263, [0.5 0.5 0.5]);
drawBox(handles, p1(1), p1(2), p1(3), p2(1), p2(2), p2(3),0.042, 0.057,0.263,o2(3),'g');


 %link3
drawCylinder(handles,p2(1),p2(2),d(1)-0.02,0.05,0.02,'g')
drawCylinder(handles,p2(1),p2(2),d(1)-0.035,0.02,0.015,'g')
drawCylinder(handles,p3(1),p3(2),p3(3)+0.15,0.03,0.03,[0 0 0]);
drawCylinder(handles,p3(1),p3(2),p3(3),0.02,0.15,[0 0 0]);



view(robot_plot,22,22)
axis(robot_plot,'equal')