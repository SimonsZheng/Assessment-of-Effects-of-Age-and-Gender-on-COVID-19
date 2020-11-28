function [ gamma_hat ] = Efunction( data,N,n,lambda,alpha,beta,theta )
% This is a subroutine program to compute the hat_gamma^k_t in the E step 
% of EM computation procedure in the Supplement Material.
% Input: 
%       data =[V,X_matrix];
%       data is a large matrix: includes the following elements.
%         V --- The simulated response N*1 vector, whose each component is 
%               a response.
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         N -- The sample size;
%         n -- The sum of the dimension of beta and 2;
%         lambda -- the estimate of lambda in last iteration;
%         alpha -- the estimate of alpha in last iteration;
%         beta -- the estimate of beta in last iteration;
%         theta -- the estimate of theta in last iteration;
% Output: 
%        gamma_hat: the hat_gamma^k_t in the E step;
X_matrix = data(:,2:n-1);
Pi = logistics( [ones(N,1),X_matrix],theta );
% 0.00000000001 is used to avoid overflow in calculation.
Ntor = exp(Log_Weibull(data,n,lambda,alpha,beta)).*Pi+0.00000000001;
Dtor = Ntor + exp(Log_LengthBiased_Weibull(data,n,lambda,alpha,beta)).*(1-Pi)+0.00000000001;
gamma_hat = Ntor./Dtor;
end

