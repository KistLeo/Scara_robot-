
function [theta1_IV,theta2_IV,d3_IV,theta4_IV] = inverseKinematics(x,y,z,si)
c2 = (x^2 + y^2 - 0.2^2 - 0.3^2) / (2 * 0.2 * 0.3); %a1=0.2, a2=0.3
s2_1 = sqrt(1 - c2^2);
s2_2 = -sqrt(1 - c2^2);
theta2_1 = rad2deg(atan2(s2_1,c2));
theta2_2 = rad2deg(atan2(s2_2,c2));

s1_1 = (0.2 + 0.3 * c2) * y - 0.3 * s2_1 * x ;
c1_1 = (0.2 + 0.3 * c2) * x + 0.3 *s2_1 * y;
theta1_1 = rad2deg(atan2(s1_1,c1_1));

s1_2 = ((0.2+0.3*c2)*y-0.3*s2_2*x);
c1_2 = ((0.2+0.3*c2)*x+0.3*s2_2*y);
theta1_2 = rad2deg(atan2(s1_2,c1_2));

%d3_IV = 0;
if abs(theta1_1) < 125
    theta1_IV = theta1_1;
    theta2_IV = theta2_1;
else
    theta1_IV = theta1_2;
    theta2_IV = theta2_2;
end

    theta4_IV = wrapTo360(si - theta1_IV - theta2_IV);

d3_IV =  0.179 - z
end