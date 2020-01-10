function [localerror, globalerror]= euler2(dt)

tstart=0.0;

tend=1.0;

t=tstart:dt:tend;
%No. of timesteps
N=length(t);

y=zeros(1,N);
%Initial condition
y(1)=1;
ystar=zeros(1,N);

%Function of RHS
dydt=@(t,y) -5*y;

%Loop of computations
for i=1:N-1
    y(i+1)=y(i)+dt*dydt(t(i),y(i));
end

%for i=1:N-1
 %   ystar(i+1)=y(i)+dt*dydt(t(i),y(i));
  %  y(i+1)=y(i)+dt*(dydt(t(i),y(i))+dydt(t(i+1),ystar(i+1)))/2;
%end


localerror = abs(y(2)-exp(-5*t(2)))/exp(-5*t(2));
globalerror = abs(y(N)-exp(-5*t(N)))/exp(-5*t(N)); 
end


