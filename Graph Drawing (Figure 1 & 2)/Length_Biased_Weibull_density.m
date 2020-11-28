function [ y ] = Length_Biased_Weibull_density( lambda,alpha,x )
% This is a subroutine program to calculate the value of the density
% function g_{lambda,alpha}(y) at y = x.
y = alpha*lambda.*exp(-(lambda*x).^alpha)./gamma(1/alpha);
end