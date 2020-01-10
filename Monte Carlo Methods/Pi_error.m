clear all;
N = [10, 100, 1000, 10000, 100000];
M = 100;

for n=1:length(N)
	errorv(n) = 0;
	for m=1:M
		% Estimate PI with Monte-Carlo:
		x = rand(N(n),1);
		y = rand(N(n),1);
		n_in = 0;
		for i=1:N(n)
			if (x(i)^2+y(i)^2)<1
				n_in = n_in + 1;
			end
		end
		pi_estimate = 4.0 * n_in / N(n);

		
		errorv(n) = errorv(n) + abs(pi_estimate - pi) / pi;
	end
	errorv(n) = errorv(n)/M;
end
loglog(N,errorv);