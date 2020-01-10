N=1.0e4;
step=1.0;
j=1;

for i=1:step:N
    [ave(j),var(j)] =coinflipsvar(i);
    samples(j)=i;
    j=j+1;
end

figure (1);
plot(samples,ave,'b--');
ylabel('Average of coinflips');
xlabel('Number of flips');

figure (2);
plot(samples,var,'k-');
ylabel('Variance of coinflips');
xlabel('Number of flips');
