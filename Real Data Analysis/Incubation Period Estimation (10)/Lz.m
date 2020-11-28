function [ output ] = Lz( X_matrix,N,gamma,theta )
% This is a subroutine program to compute the L^z_t(theta) in the E step of 
% EM computation procedure in the Supplement Material.
% Input: 
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         gamma ---- the calculated hat_gamma^k_t in the E step of EM comp-
%                    -utation procedure in the Supplement Material.
%         N -- The sample size;
%         theta ---- the estimate of theta in last iteration;
output = -(([ones(N,1),X_matrix]*theta)'*gamma-sum(log(1+exp([ones(N,1),X_matrix]*theta))));
end