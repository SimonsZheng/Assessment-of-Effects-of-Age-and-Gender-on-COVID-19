function [ Data ] = Data_Generator( N,K,lambda,alpha,beta,theta,mu,sigma )
% This is a subroutine program to generate the simulated data whose underl-
% ying conditional density of V given X is the proposed mixture regression 
% model with parameter(lambda,alpha,beta,theta);
% Input: 
%      N -- The sample size;
%      K -- The number of the simulated datasets;
%      lambda -- The lambda in the proposed mixture regression model;
%      alpha -- The alpha in the proposed mixture regression model;
%      beta -- The beta in the proposed mixture regression model;
%      theta -- The theta in the proposed mixture regression model;
%      mu -- The mean of the simulated d-dimensional covariate vector X;
%      sigma -- The covariance of X;
% Output:
%       Data -- The cell variable contains K data matrices;
%               Each data matrix has the form [V,X_matrix], which is a 
%               (N*(1+d)) matrix:
%               V --- The simulated response N*1 vector, whose each compon-
%                     ent is a response.
%               X_matrix --- The simulated N*d covariate matrix, whose each
%                            row is a covariate vector, a realization from
%                            the distribution of covariate vector X;

Data = cell(K,1);
e = ones(N,1);
for i = 1:K
    X_matrix = mvnrnd(mu,sigma,N);
    X_add_one = [e,X_matrix];
    % The mixture proportion PI;
    PI = exp(X_add_one*theta)./(1+exp(X_add_one*theta));
    delta = binornd(1,PI);
    CC = wblrnd(1./(lambda*exp(X_matrix*beta)),alpha*ones(N,1));
    Y = gamrnd(1/alpha*ones(N,1),1);
    V = Y.^(1/alpha)./(lambda*exp(X_matrix*beta));
    data_matrix = [delta.*CC+(1-delta).*V,X_matrix];
    Data{i,1} = data_matrix;
end
end

