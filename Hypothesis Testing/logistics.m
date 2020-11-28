function [ Pi ] = logistics( X_add_one,theta )
% This is a subroutine program to compute the mix proportion
% Pi(X,theta)= exp(theta(1)+X*theta(2:3))./(1+exp(theta(1)+X*theta(2:3)));
% Input: 
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         theta ---- the estimate of theta in last iteration;
Pi = exp(X_add_one*theta)./(1+exp(X_add_one*theta));
end

