function [ Negative_log_Likelihood ] = Negative_log_Likelihood_Calcalator( data, Newdata, Para, theta, N, n)
% This is a subroutine program to compute the negative log likelihood of observed
% data when the underlying conditional density of V given X is the proposed
% mixture regression model with parameter(lambda,alpha,beta,theta).
% Input: 
%       data =[V,X_matrix];
%       data is a large matrix: includes the following elements.
%         V --- The simulated response N*1 vector, whose each component is 
%               a response.
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         para = [lambda,alpha,beta']';
%         lambda ---- the estimate of lambda in last iteration;
%         alpha ---- the estimate of alpha in last iteration;
%         beta ---- the estimate of beta in last iteration;
%         theta ---- the estimate of theta in last iteration;
%         N ---- The sample size;
%         n -- The sum of the dimension of beta and 2;
lambda = Para(1);
alpha = Para(2);
beta = Para(3:n);
X_matrix = data(:,2:n-1);
PI = logistics( [ones(N,1),X_matrix],theta );
Negative_log_Likelihood = -sum(log(PI.*exp(Log_Weibull(Newdata,n,lambda,alpha,beta))+(1-PI).*exp(Log_LengthBiased_Weibull(Newdata,n,lambda,alpha,beta))));
end

