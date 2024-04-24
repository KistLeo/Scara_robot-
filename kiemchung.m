syms a1 a2 d1 d3 d4 theta1 theta2 theta4;


% Ma tr?n ??ng h?c thu?n
A1 = [cos(theta1) -sin(theta1) 0 a1*cos(theta1); sin(theta1) cos(theta1) 0 a1*sin(theta1); 0 0 1 d1; 0 0 0 1];
A2 = [cos(theta2) -sin(theta2) 0 a2*cos(theta2); sin(theta2) cos(theta2) 0 a2*sin(theta2); 0 0 1 0; 0 0 0 1];
A3 = [1 0 0 0; 0 1 0 0; 0 0 1 d3; 0 0 0 1];
A4 = [cos(theta4) sin(theta4) 0 0; sin(theta4) -cos(theta4) 0 0; 0 0 -1 d4; 0 0 0 1];

% Tích các ma tr?n ?? có ma tr?n ??ng h?c thu?n cu?i cùng
T = A1 * A2 * A3 * A4;
VT=inv(A2)*inv(A1)*T;
VP=A3*A4;
% Hi?n th? ma tr?n ??ng h?c thu?n
disp(T);


