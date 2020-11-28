function [ y ] = Mix_density( lambda,alpha,x,mix_proportion )
% This is a subroutine program to calculate the value of the mixture density
% function p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p =
% mix_proportion at y = x.
y = mix_proportion*Weibull_density( lambda,alpha,x )+(1-mix_proportion)*Length_Biased_Weibull_density( lambda,alpha,x );
end