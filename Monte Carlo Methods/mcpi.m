function [pi_est] = mcpi(N)
    %Set inside and outside parameters as zero
    n_in=0;
    n_out=0;
    
    %radius of sphere
    r=1.0;
    
    %Generate random (x,y) points in (x,y) plane of size(r,r)
    x=r*rand(N,1);
    y=r*rand(N,1);
    
    for i =1:N %loop over all random points
        if (x(i)^2 + y(i)^2) <= r*r
            n_in=n_in+1;
            x_in(n_in) = x(i);
            y_in(n_in) = y(i);
        else                            %Else the random point is outside of the circle
            n_out=n_out+1;
            x_out(n_out) = x(i);
            y_out(n_out) = y(i);
        end
    end
    pi_est =4.0*n_in/(n_in+n_out);
    
    %{
    Visualise
    figure (1);
    scatter(x_in,y_in,'filled');
    hold on;
    scatter(x_out,y_out,'filled');
    hold off;
    %}
end
