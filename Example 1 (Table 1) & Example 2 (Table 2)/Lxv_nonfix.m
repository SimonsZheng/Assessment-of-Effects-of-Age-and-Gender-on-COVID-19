function [ output ] = Lxv_nonfix( data,n,gamma,para )
% This is a subroutine program to compute the -L^{xv}_t(lambda,alpha,beta), 
% where L^{xv}_t(lambda,alpha,beta) is defined in the E step of EM computa-
% tion procedure in the Supplement Material.
% Input: 
%       data =[V,X_matrix];
%       data is a large matrix: includes the following elements.
%         V --- The simulated response N*1 vector, whose each component is 
%               a response.
%         X_matrix --- The simulated N*d covariate matrix, whose each row 
%                      is a covariate vector, a realization form the distr-
%                      ibution of covariate vector X;
%         n -- The sum of the dimension of beta and 2;
%         gamma ---- the calculated hat_gamma^k_t in the E step of EM comp-
%                    -utation procedure in the Supplement Material.
%         para = [lambda,alpha,beta']';
%         lambda ---- the estimate of lambda in last iteration;
%         alpha ---- the estimate of alpha in last iteration;
%         beta ---- the estimate of beta in last iteration;
lambda = para(1);
alpha = para(2);
beta = para(3:n);
output = -sum(gamma.*Log_Weibull(data,n,lambda,alpha,beta)+(1-gamma).*Log_LengthBiased_Weibull(data,n,lambda,alpha,beta));
end

