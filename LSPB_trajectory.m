function [t, q, v, a] = LSPB_trajectory(q_max, v_max, a_max,q0)

flag = 0;

if q_max < 0 
     q_max = -q_max;
     flag = 1;
end
if v_max > sqrt(q_max*a_max)
     v_max = sqrt(q_max*a_max);
end

t1   = v_max/a_max;
tm   = (q_max - a_max*t1^2)/v_max;
tmax = 2*t1 + tm;
t2   = tmax - t1;

t       = linspace(0,tmax,100);
a       = zeros(size(t));
v       = zeros(size(t));
q       = zeros(size(t));

for i = 1:1:length(t)
    if (t(i) < t1)
        a(i) = a_max;
        v(i) = a_max*t(i);
        q(i) = 0.5*a_max*t(i)^2;

    elseif (t(i) < t2)
        a(i) = 0;
        v(i) = v_max;
        q(i) = 0.5*a_max*t1^2 + v_max*(t(i)-t1);

    else
        a(i) = -a_max;
        v(i) = v_max - a_max*(t(i)-t2);
        q(i) = 0.5*a_max*t1^2 + v_max*(tmax-2*t1) + v_max*(t(i)-t2) - 0.5*a_max*(t(i)-t2)^2;
    end
end
if flag ~= 1
        q = q+q0 ;
        v = v;
        a = a;
elseif flag == 1
        q = -q +q0;
        v = -v;
        a = -a;
end


        

   

    

