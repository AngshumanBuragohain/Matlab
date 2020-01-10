
N=10^6;
f=@(x) (7/3)*x.^(4/3);
fmax=7.0/3.0;
x = 0:0.001:1.0;

r=rand(1,N);
r_var = r.^(3.0/7.0);

%Rejection sampling method
j=1;

while j<N
    r1=rand();
    r2=fmax*rand();
        if(r2<f(r1))
            r_rej(j)=r1;
            j=j+1;
        end
end

figure(1);
subplot(2,1,1);
histogram(r_var,'Normalization','pdf','Binwidth',0.05);
hold on;
%histogram(r_rej,'Normalization','pdf','Binwidth',0.05);
plot(x,f(x),'Linewidth',2,'Color','red');
hold off;
subplot(2,1,2);
histogram(r_rej,'Normalization','pdf','Binwidth',0.05);
hold on;
plot(x,f(x),'Linewidth',2,'Color','red');
xlabel('x'); ylabel('f(x)');
hold off;




