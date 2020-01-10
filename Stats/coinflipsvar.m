function[average,variance] = coinflipsvar(N)
    v= rand(1,N);   %Generate random numbers
    F= round(v);   %Random numbers are rounded off to 0 or 1
    average = 0.0;
    variance = 0.0;
    for i=1:N
            average = average + F(i);
    end
        average=average/N;          %getting the average for N numbers
        
    for i=1:N
        variance = variance + (F(i)-average)*(F(i)-average);    %variance for each single observation
    end
        variance = variance/(N-1);          %Variance for N numbers

end
