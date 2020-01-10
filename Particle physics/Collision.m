clear all;

m1=1;
m2=1;
e=0:0.1:1;

%{
u1=[0 0 7];
u2=[0 0 -5];
x1=[0 0 1];
x2=[0 0 2];
%}

u1=[2 2 7];
u2=[-1 -2 -5];
x1=[2 3 1];
x2=[4 5 2];

DE=zeros(1,length(e));
delE=zeros(1,length(e));


for i=1:length(e)-1
    
    [v1, v2, delE(i), DE(i), n]=Colfunc(m1, m2, e(i), u1, u2, x1 , x2);
    
end

figure (1);
plot(e, delE);
ylabel("Change in Kinetic Energy")
xlabel("coefficient of restitution")

figure(2);
plot(e,DE);
ylabel("Energy Dissipation")
xlabel("coefficient of restitution")
