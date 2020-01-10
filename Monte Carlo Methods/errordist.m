    % Still trying to figure out the error optimization and program
    % efficiency part

    N=1000;
    sigma = 0.25;
    mean = 0;
    y = sigma.*randn(N,1) + mean;
    
    u1=rand(N,1); 
    u2=rand(N,1);
    %Box-Mueller Transform
    v1=sqrt(-2*sigma^2*log(u1)).*cos(2*pi*u2); 
    v2=sqrt(-2*sigma^2*log(u1)).*sin(2*pi*u2);
    
    f=@(x) exp((-x.^2)/(2*sigma^2)).*(sqrt(2*pi*(sigma)^2)^(-1));
    
    dx=2/N;
    x=-1:dx:1;
    
    a= -1; b=1;
    c= sqrt(2*pi*(sigma)^2)^(-1);
    j=1;
    while j<N
        r1=a+(b-a)*rand();
        r2=c*rand();
            if(r2<f(r1))
                r_rej(j)=r1;
                j=j+1;
            end
    end
     
    figure(1);
    histogram(y,'Normalization','pdf');
    hold on;
    plot(x,f(x));
    hold off;
    
    figure(2);
    subplot(2,1,1);
    histogram(v1,'Normalization','pdf');
    hold on;
    plot(x,f(x));
    hold off;
    
    subplot(2,1,2);
    histogram(v1,'Normalization','pdf');
    hold on;
    plot(x,f(x));
    hold off;
    
    figure(3);
    histogram(r_rej,'Normalization','pdf');
    hold on;
    plot(x,f(x));
    hold off;
    