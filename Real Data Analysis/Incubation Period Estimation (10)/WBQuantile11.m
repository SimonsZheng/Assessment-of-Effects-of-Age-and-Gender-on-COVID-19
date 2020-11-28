function [ mean_Quantile ] = WBQuantile11( lambda_hat, alpha_hat, beta_hat )
% This is a subroutine program to calculate the Weibull parameters, mean,a-
% nd quantiles under different levels of the incubation period distribution 
% for female group with age >= 45 when the estimates of the parameters thr-
% ough the pool data are (lambda_hat, alpha_hat, beta_hat).
a = alpha_hat;
temp = lambda_hat.*exp(beta_hat*[1;1]);
b = 1./(temp);
mean = b.*(gamma(1+1./a));
p=0.05;Quantile5  = b.*((-log(1-p)).^(1./a));
p=0.25;Quantile25 = b.*((-log(1-p)).^(1./a));
p=0.50;Quantile50 = b.*((-log(1-p)).^(1./a));
p=0.75;Quantile75 = b.*((-log(1-p)).^(1./a));
p=0.90;Quantile90 = b.*((-log(1-p)).^(1./a));
p=0.95;Quantile95 = b.*((-log(1-p)).^(1./a));
p=0.99;Quantile99 = b.*((-log(1-p)).^(1./a));
mean_Quantile = [temp,alpha_hat,mean,Quantile5,Quantile25,Quantile50,Quantile75,Quantile90,Quantile95,Quantile99];
end