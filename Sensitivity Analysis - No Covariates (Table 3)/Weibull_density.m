function [ y ] = Weibull_density( lambda,alpha,x )
% This is a subroutine program to calculate the value of the density
% function f_{lambda,alpha}(y) at y = x.
y = alpha*lambda*(lambda*x).^(alpha-1).*exp(-(lambda*x).^alpha);
end

