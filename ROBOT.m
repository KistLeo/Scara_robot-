classdef ROBOT
    properties
        a;
        d;
        alpha;  %  deg
        theta;  %  deg
        pos;
        orien;
    end
    
    methods
          function obj = ROBOT(handles, theta1, theta2, d3, theta4)
              obj.a = [0.2; 0.3; 0; 0];
              obj.d = [0.179; 0; -d3; 0];
              obj.alpha = [0.00; 0.00; 0.00; 180];
              obj.theta = [theta1; theta2; 0; theta4];

              [obj.pos, obj.orien] = obj.forwardKinematics();
          end



        function [p_robot, o_robot] = forwardKinematics(self)
            
            a = self.a;
            alpha = self.alpha * pi / 180;
            d = self.d;
            theta = self.theta * pi / 180;

            A0_1 = A_matrix(a(1), alpha(1), d(1), theta(1));
            A1_2 = A_matrix(a(2), alpha(2), d(2), theta(2));
            A2_3 = A_matrix(a(3), alpha(3), d(3), theta(3));
            A3_4 = A_matrix(a(4), alpha(4), d(4), theta(4));

            A0_2 = A0_1 * A1_2;
            A0_3 = A0_2 * A2_3;
            A0_4 = A0_3 * A3_4;

            p0 = [0; 0; 0];
            [p1, o1] = cal_position(A0_1,p0);
            [p2, o2] = cal_position(A0_2,p0);
            [p3, o3] = cal_position(A0_3,p0);
            [p4, o4] = cal_position(A0_4,p0);

            p_robot = [p1 p2 p3 p4]';
            o_robot = [o1; o2; o3; o4];
           
        end
        
    end
end
