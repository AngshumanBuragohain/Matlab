function[average] = coinflips(N)
v= rand(1,N);   %Generate random numbers
F= round(v);   %Random numbers are rounded off to 0 or 1
sum = 0.0;

for i=1:N
        sum = sum + F(i);
end
    average=sum/N;          %getting the average for N numbers
end