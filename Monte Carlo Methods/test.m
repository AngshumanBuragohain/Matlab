r_u=rand(1000,1);
r_n=randn(1000,1);
figure (1);
histogram(r_u,'Normalization','pdf');
figure (2);
histogram(r_n,'Normalization',"pdf");
