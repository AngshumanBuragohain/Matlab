%Monte Carlo is better for higher orders even if the computation is rather
%slow

N=[10, 100, 1000, 10000];
M=100;

for n=1:length(N)
    error(n)=0;
    for m=1:M
        pi_estimation=mcpi(N(n));
        error(n)=error(n) +abs(pi_estimation-pi)/pi;
    end
    error(n)=error(n)/M;
end

loglog(N,error);
