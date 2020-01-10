
tstart=0; tend=1; 
delt=0.001;

t=tstart:delt:tend;

x1=[0 0 1];

g= -9.8;

m=1.0;

v1=[0 0 1];

diss=zeros(1,length(t));
diss(1)=0;
kin = zeros(1,length(t));
kin(1) = 0.5*m*dot(v1,v1);
pot = zeros(1,length(t));
pot(1) = -m*g*x1(3);
tot = zeros(1,length(t));
tot(1) = kin(1)+pot(1);

for i=2:length(t)
    F= [0 0 m*g];
    [x1,v1,diss(i),kin(i),pot(i),tot(i)] = Prt_mov(x1,v1,F,m,delt);
end

plot(t,kin,'r--'); hold on;
plot(t,pot,'g--'); hold on;
plot(t,tot,'c--'); hold on;
plot(t, diss, 'b'); hold off;




