function [ output ] = Log_Weibull(data,n,lambda,alpha,beta)
% This is a subroutine program to compute the log likelihood of observed
% data when the underlying conditional density of V given X is
%                f_{lambda,alpha}(v*X'*beta)*X'*beta,
% where f_{lambda,alpha}(v)=
%       lambda*alpha*(lambda*v)^(alpha-1)*exp(-(lambda*v)^alpha).
% Input: 
%       data =[V,X_matrix];
%       data is a large matrix: includes the following elements.
%         V --- The simulated response N*1 vector, whose each component is 
%               a response.
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         n -- The sum of the dimension of beta and 2;
%         lambda -- the estimate of lambda in last iteration;
%         alpha -- the estimate of alpha in last iteration;
%         beta -- the estimate of beta in last iteration;
X = data(:,2:n-1)*beta;
VX = data(:,1).*exp(X);
output = -(lambda*VX).^alpha+(alpha-1)*log(lambda*VX)+log(alpha*lambda)+X;
end