%start time
tstr=0.0;
%end time
tend=1.0;
%Number of data points
N=100;

%time interval
dt=(tend-tstr)/N;

%array of time-steps
t=tstr:dt:tend;

%No. of timesteps
N=length(t);

%Solution y array
y=zeros(1,Nt);

%Initial condition
y(1)=1;

%Step to assign (-5y) to a function named f_ty
f_ty=@(t,y) - 5*y;

%Loop of computations

for i=1:Nt-1
    y(i+1)=y(i)+(dt*f_ty(t(i),y(i)));
end

plot(t,y)