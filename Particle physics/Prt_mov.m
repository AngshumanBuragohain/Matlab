function [x,v,dissip,Kinf,Potf, totalf] = Prt_mov(x,v,F,m,dt)

Kini = 0.5*m*dot(v,v);
Poti = -m*dot(F,x)/m;
totali = Kini + Poti;

x= x+ v.*dt + 0.5*dt*dt*F./m;
v= v+ F.*dt/m;

Kinf = 0.5*m*dot(v,v);
Potf = -m*dot(F,x)/m;
totalf = Kinf + Potf;

%Calculate difference in energy

dissip = totali - totalf;

end