N=60;
m=10;

L=round(N/m);
if (L*m ~=N) return; end

F=round(rand(1,N));
F1=reshape(F,L,m);

for i=1:L
    average(i)=0.0;
    for j=1:m
        average(i)= average(i)+F1(i,j);
    end
    average(i)=average(i)/m;
end 

totavg=0.0;
for i=1:L
    totavg=totavg+average(i);
end
totavg=totavg/L;

for i=1:L
    setvariance(i)=0.0;
    for j=1:m
        setvariance(i)=setvariance(i)+(average(i)-F1(i,j))*(average(i)-F1(i,j));
    end
    setvariance=setvariance/(L+1);
end

variance=0.0;
for i=1:L
    variance=variance+(average(i)-totavg)*(average(i)-totavg);
end
variance=variance/L;



