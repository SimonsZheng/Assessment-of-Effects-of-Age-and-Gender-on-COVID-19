function [ Est] = FS_Parallel_Computing_Est( Data, Initial_Point, K, epsilon, T, N, n, n_add_one, Para_num)
% This is a subroutine program to calculate the estimate under FS setting,
% whose initial value is Initial_Point.
% Input: 
%       Data -- The cell variable contains K data matrices;
%                 Each data matrix has the form [V,X_matrix], which is a 
%                 (N*(1+d)) matrix:
%                 V --- The simulated response N*1 vector, whose each
%                 component is a response.
%                 X_matrix --- The simulated N*d covariate matrix, whose e-
%                              ach row is a covariate vector, a realization
%                              of X;
%       Initial_Point -- The fixed initial value with Initial_Point = [Ini-
%                     tial_lambda;Initial_alpha;Initial_beta;Initial_theta];
%       K -- The number of the simulated datasets;
%       epsilon -- The setting tolerance to check whether stop the EM iter-
%                  ation;
%       n -- The sum of the dimension of beta and 2;
%       n_add_one = n + 1;
%       T -- The maximum of EM iterations;
%       N -- The sample size;
%       theta_dim -- The dimension of theta;
%       Para_num -- The number of unknown parameters;
% Output:
%       Est -- A K*Para_num matrix, containing the K estimates from K simu-
%              lated datasets and of which each row is a estimate of the P-
%              ara_num-dimensional unknown parameter vector.
Est = zeros(K,Para_num);
parfor i = 1:K
    data = Data{i};
    X = data(:,2:n-1);
    % The nonnegative constraints for lambda & alpha;
    A_beta = [-1,0,0,0;0,-1,0,0;];b_beta=[-0.00000001;-0.00000001]; 
    lambda_hat = Initial_Point(1); alpha_hat = Initial_Point(2);
    beta_hat = Initial_Point(3:n); theta_hat = Initial_Point(n_add_one:Para_num)

gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,beta_hat,theta_hat );

[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,Para ),[lambda_hat;alpha_hat;beta_hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat);
a = [Para_estimator;theta_estimator];
b = [lambda_hat;alpha_hat;beta_hat;theta_hat];
t = 1;
while (sum((a-b).^2) >= epsilon) && (t <= T)
lambda_hat = Para_estimator(1);
alpha_hat = Para_estimator(2);
beta_hat = Para_estimator(3:n);
theta_hat = theta_estimator;
gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,beta_hat,theta_hat );
[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,Para ),[lambda_hat;alpha_hat;beta_hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat);
b = a;
a = [Para_estimator;theta_estimator];
t = t + 1;
end
Est(i,:) = a;
end
end