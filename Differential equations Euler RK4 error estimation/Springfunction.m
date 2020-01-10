clear all;

% Spring constant
 K = 1;
 
% % Mass
 M = 1;
 
% % Step size
 dt = 0.1;
 
% % Start of the computation interval
 tstart = 0;
 
% % End of the computation interval
 tend = 30;
 
% % Allocate t
 t = tstart:dt:tend;
 
%  Allocate v
v = zeros(1,length(t));
v1 = zeros(1,length(t));

%Initial velocity of the mass v0
v(1) = 0;
v1(1) = 0;

% % Allocate x
x = zeros(1,length(t));
x1 = zeros(1,length(t));

% Initial position of the mass x0
x(1) = 1;
x1(1) = 1;

% Right-hand side of the ODE, f(t,y)
f_tv = @(t,y) -y*K/M;
f_tx = @(t,y) y;

% Computation loop
tic;
for i=1:(length(t)-1)
    v(i+1) = v(i) + dt * f_tv(t(i),x(i));
    x(i+1) = x(i) + dt * f_tx(t(i),v(i));
end
toc;
a=toc-tic;

tic;
for i=1:(length(t)-1)
    
    k1=f_tv(t(i),x1(i));
    k2=f_tv((t(i)+dt*0.5),(x1(i)+k1*dt*0.5));
    k3=f_tv((t(i)+dt*0.5),(x1(i)+k2*dt*0.5));
    k4=f_tv((t(i)+dt),(x1(i)+k3*dt));
    v1(i+1)=v1(i)+dt*(1/6)*(k1+2*k2+2*k3+k4);
    
    k1=f_tx(t(i),v1(i));
    k2=f_tx((t(i)+dt*0.5),(v1(i)+k1*dt*0.5));
    k3=f_tx((t(i)+dt*0.5),(v1(i)+k2*dt*0.5));
    k4=f_tx((t(i)+dt),(v1(i)+k3*dt));
    x1(i+1)=x1(i)+dt*(1/6)*(k1+2*k2+2*k3+k4);
    
end
toc;
b=toc-tic;


subplot(2,1,1),
plot(t,x);
subplot(2,1,2)
plot(t,x1,'r');