
delt=[10^-6 10^-5 10^-4 10^-3, 10^-2, 10^-1];
n=length(delt);
eps1=zeros(1,n);
epsN=zeros(1,n);
for j=1:n
    [eps1(j), epsN(j)] =ODERK4(delt(j));
end
loglog(delt,epsN,'k');
hold on;
loglog(delt,eps1,'r');
title ('Euler');
xlabel('Error');
ylabel('Time interval');

