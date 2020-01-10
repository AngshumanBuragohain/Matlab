% Computes ODE using the improved Euler method
clear all;
% Start of the computation intervel
tstart = 0;
% End of the computation intervel
tend = 1;
% Right hand side of the ODE, f(t,y)
f_ty = @(t,y) -5*y;
n = 6;
epsFirst = zeros(1,n);
epsEnd = zeros(1,n);
dt = zeros(1,n);
for j = 1:n
    dt(j) = 10^(-(n+1)+j); %dt = 10^-6, 10^-5 etc.
    t = tstart:dt:tend;
    N = length(t);
    y = zeros(1,N);
    y(1) = 1;
    for i = 1:(N-1)
        ystar = y(1)-f_ty(t(1),y(1))+dt(j);
        y(i+1) = y(1)+dt(j) *(f_ty(t(1),y(i))+f_ty(t(i+1),ystar))/2;
    end
    epsFirst(j) = abs(y(2)- exp(-5*t(2)))/exp(-5*t(2));
    epsEnd(j) = abs(y(i+1) - exp(-5*t(i+1)))/exp(-5*t(i+1));
end
loglog(dt,epsEnd,dt,epsFirst);
