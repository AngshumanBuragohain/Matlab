%Function to compute dy/dt=-5y using RK4 and compare it to the exact solution. Local error and global errors are
%plotted as well in the script called Comparision.m

function [localerr, globalerr] = ODERK4(dt)
   
    %Initialisation of the time interval and time steps
    tstart=0.0;
    tend=1.0;
    t=tstart:dt:tend;
    N=length(t);
    
    %Euler solution variables initialized
    y=zeros(1,N); 
    y(1)=1.0;
    
    %Assign the RHS of the differential equation to a name for ease of coding
    fy=@(t,y) -5*y;
    
    %Assign exact solution of the differential equation 
    x=@(t) exp(-5*t);
    
    %Running the iterations for RK4 Euler method 
    for i=1:N-1
        k1=fy(t(i),y(i));
        k2=fy((t(i)+dt*0.5),(y(i)+k1*dt*0.5));
        k3=fy((t(i)+dt*0.5),(y(i)+k2*dt*0.5));
        k4=fy((t(i)+dt),(y(i)+k3*dt));
        y(i+1)=y(i)+dt*(1/6)*(k1+2*k2+2*k3+k4);
    end
    double localerr;
    double globalerr;
    localerr = abs(y(2)-x(t(2)))/x(t(2));
    globalerr = abs(y(N)-x(t(N)))/x(t(N));
end