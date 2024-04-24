function [t,q,v,a] = S_curve_Trajectory(q_max,v_max,a_max,q0)
flag = 0;

if q_max < 0 
     q_max = -q_max;
     flag = 1;
end
if v_max > sqrt(q_max*a_max)
     v_max = sqrt(q_max*a_max*0.5);
end



t1 = v_max / a_max;
J = a_max/t1;
        a1 = J*t1;
        v1 = 0.5*J*t1^2;
        q1 = 1/6*J*t1^3;
        
        a2 = 0;
        v2 = v_max;
        q2 = q1 + v1*t1 + 0.5*a_max*t1^2-1/6*J*t1^3;
        
        t2 = ((q_max -2*q2)/v_max)+2*t1;
        tmax = t2 + 2*t1;
        
        a3 = 0;
        v3 = v2;
        q3 = q2 + v_max*(t2-2*t1);%suy ra t2
        
        a4 = -a_max;
        v4 = v1;
        q4 = q3 + v_max*t1 -1/6*J*t1^3;
t       = linspace(0,tmax,100);
a       = zeros(size(t));
v       = zeros(size(t));
q       = zeros(size(t));

for i = 1:1:length(t)
    if t(i) < t1
        a(i) = J*t(i);
        v(i) = 0.5*J*t(i)^2;
        q(i) = 1/6*J*t(i)^3;

    elseif t(i) < 2*t1
        a(i) = a1 + J*-(t(i)-t1);
        v(i) = v1 + a1*(t(i)-t1)- 1/2*J*(t(i)-t1)^2 ;
        q(i) = q1 - 1/6*J*(t(i)-t1)^3 + 0.5*a1*(t(i)-t1)^2 + v1*(t(i)-t1);
        

    elseif t(i) < t2
        a(i) = 0;
        v(i) = v2;
        q(i) = q2 + v2*(t(i)-2*t1);
       
    elseif t(i) < t2 + t1
        a(i) = -J*(t(i) - t2);
        v(i) = v3 - 1/2*J*(t(i) - t2)^2 ;
        q(i) = q3 + v3*(t(i)-t2) - 1/6*J*(t(i) - t2)^3 ;
       
    else
        a(i) = -a_max + J*(t(i)-t2-t1);
        v(i) = v1 - a_max*(t(i)-t2-t1) + 0.5*J*(t(i) - t2 - t1)^2;
        q(i) = q4 + v1*(t(i)-t2-t1) - 0.5*a_max*(t(i)-t2-t1)^2 + 1/6*J*(t(i)-t2-t1)^3;
    end
end
if flag ~= 1
        q = q +q0;
        v = v;
        a = a;
elseif flag == 1
        q = -q +q0;
        v = -v;
        a = -a;
end
