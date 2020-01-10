close all; clear all;
%First order Euler integration routine with N=1,5,100 yn+1=yn-5yndelt

%Value of N (number of iterations)
N=[1 5 20 100];

%Setting up the domain of the time data
tstart=0.0;
tend=1;

for i=1:length(N)               %Loop for taking three values of N=1,5,100
    
    %Solution variable with initial condition
    y=zeros(1,N(i));
    y(1)=1;
    x=zeros(1,N(i));
    x(1)=1;
    
    dt=(tend-tstart)/N(i);
    t=tstart:dt:tend;
    dydt=@(t,y) -5*y;               %Assign the RHS of eqn to dydt
    
    for j=1:(length(t)-1)           %Loop for computing the solution at every time interval
        y(j+1)=y(j)+(dt*dydt(t(j),y(j)));        %First order integration equation Euler    
    end
    
    for j=2:(length(t))
        x(j)=exp(-5*t(j));
    end
        
    figure(i);
    plot(t,y);
    hold on;
    plot(t,x,'r--');
end