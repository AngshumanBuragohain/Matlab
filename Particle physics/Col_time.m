%% Collision time for N particles.

function [ctime] = Col_time(d1,d2,x1,x2,u1,u2)
    ctime = -1;
    r1=d1/2;
    r2=d2/2;
    x12 = x1 - x2;
    u12 = u1 - u2;
    b = dot(x12,u12);
    a = dot(u12,u12);
    c = dot(x12,x12) - (r1+r2)^2;
    if (b>0) 
            return;
    end
    D = b^2 - a*c;
    if (D<0)
	    return;
    end
    ctime = (-b - sqrt(D))/a;
end