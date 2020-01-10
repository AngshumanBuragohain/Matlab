n=6;
delt=zeros(1,n);
eps1a= zeros(1,n); eps1b= zeros(1,n); eps1c= zeros(1,n);
epsNa= zeros(1,n); epsNb= zeros(1,n); epsNc= zeros(1,n);

for j=1:n
    delt(j)= 10^(-(n+1)+j);
    [eps1a(j), epsNa(j)] = ODEeuler(delt(j));
    [eps1b(j), epsNb(j)] = ODEipveuler(delt(j));
    [eps1c(j), epsNc(j)] = ODERK4(delt(j));
end

figure (1);
loglog(delt,epsNa,'k');
hold on;
loglog(delt,eps1a,'r');
title ('Euler');
xlabel('Time interval');
ylabel('Error');

figure (2);
loglog(delt,epsNb,'k');
hold on;
loglog(delt,eps1b,'r');
title ('Improved Euler');
xlabel('Time interval');
ylabel('Error');

figure (3);
loglog(delt,epsNc,'k');
hold on;
loglog(delt,eps1c,'r');
title ('RK4');
xlabel('Time interval');
ylabel('Error');

