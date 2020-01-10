function [v1, v2, delE, DE]=Colfunc(m1, m2, e, u1, u2, x1 , x2)
    
    % Normal vector initialisation
    n=(x1-x2)/abs(x1-x2);
    
    %Relative initial velocity
    u12=u1-u2;
    
    %Initial Kinetic Energy
    KEi=0.5*(m1*dot(u1,u1)+m2*dot(u2,u2));
    
    %Reduced mass
    ma=(m1*m2)/(m1+m2);
    
    J= -(1+e).*dotprod(u12,n)*ma*n;
    
    %Computed final velocities
    v1=u1 + J/m1;
    v2=u2 - J/m2;
    
    %Final Kinetic Energy
    KEf=0.5*(m1*dot(v1,v1)+m2*dot(v2,v2));
    
    
    delE=abs(KEf-KEi);
    
    %Kinetic Energy dissipation
    DE=abs(KEi-KEf)/KEi;
end