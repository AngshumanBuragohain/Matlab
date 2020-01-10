N=[10^6];

for j=1:length(N)
    [er1, er2, er3, x1]=errordist(N(j));
    figure(j);
    histogram(er1)
end