%Function to compute dy/dt=-5y using Improved Euler and compare it to the exact solution. Local error and global errors are
%plotted as well in the script called Comparision.m

function [localerr, globalerr] = ODEipveuler(dt)
   
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
    
    %Running the iterations for Forward Euler method 
    for i=1:N-1
        ystar=y(i)+dt*fy(t(i),y(i));
        y(i+1)=y(i)+dt*(fy(t(i),y(i))+fy(t(i+1),ystar))/2;
    end
    
    localerr = abs(y(2)-x(t(2)))/x(t(2));
    globalerr = abs(y(N)-x(t(N)))/x(t(N));
end