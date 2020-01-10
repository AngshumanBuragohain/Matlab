
function [localerror, globalerror] = euler()
deltat = 0.05;
tstart = 0.0;
tend = 1.0;
t = tstart:deltat:tend;
N = length(t);
y = zeros(1,N);
y(1) = 1;
f_ty = @(t,y) -5*y;
for i = 1:N-1
    y(i+1) = y(i)+deltat*f_ty(t(i),y(i));
end
localerror = abs(y(2) - exp(-5*t(2)))/exp(-5*t(2));
globalerror = abs(y(N)- exp(-5*t(N)))/exp(-5*t(N));
end

