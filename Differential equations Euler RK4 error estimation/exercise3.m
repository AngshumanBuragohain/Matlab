%Function to create N coinflips and will create
%the mean and variance of the coinflips

function [average, variance]= exercise3(N,m)    %This function creates a 2D array from 1D array and then find the mean and variance
n=round(N/m);
    if (n*n ~= N) return;          
        v = rand(1,N);
        F=round(v);
        F2= reshape(F,n,m);
    
    for j=1:m
        average(j)=0.0;
        for i=l:m
                average(j)=average(j) + F2(j,i);
        end
        average(j)=average(j)/m;
    end
    totavg=0;
    
    for i=l:n
            totavg=totavg +average(i);
    end
    totavg =totavg/m;
    
    variance=0.0;
    
    for i=l:n
             variance= variance + (average(i)-totavg)*(average(i)-totavg);
    end
    variance=variance/(N-1);

end