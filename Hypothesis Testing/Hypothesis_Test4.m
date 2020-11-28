function [ Likelihood ] = Hypothesis_Test4( Data,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num)
% This is a subroutine program to calculate the likelihood under beta2 = 0.
% Input: 
%       Data -- The cell variable contains K data matrices;
%                 Each data matrix has the form [V,X_matrix], which is a 
%                 (N*(1+d)) matrix:
%                 V --- The simulated response N*1 vector, whose each
%                 component is a response.
%                 X_matrix --- The simulated N*d covariate matrix, whose e-
%                              ach row is a covariate vector, a realization
%                              of X;
%       bound_vector -- A vector giving the bound of the supporting set of
%                       the uniform distribution for the initial value of
%                       the parameters, see the discription of input for t-
%                       function Initial_Points_Generator.m
%       K -- The number of the simulated datasets;
%       I -- The number of the initial values;
%       epsilon -- The setting tolerance to check whether stop the EM iter-
%                  ation;
%       n -- The sum of the dimension of beta and 2;
%       n_add_one = n + 1;
%       T -- The maximum of EM iterations;
%       N -- The sample size;
%       theta_dim -- The dimension of theta;
%       Para_num -- The number of unknown parameters;
% Output:
%       Likelihood -- A K-dimensional vector, containing the K likelihoods
%       for K simulated datasets with beta2 = 0.
Likelihood = zeros(K,1);
parfor i = 1:K
    i
    data = Data{i};
    X = data(:,2:n-1);
    % The constraints for theta;
    A_theta = [1,0,0;-1,0,0;0,1,0;0,-1,0;0,0,1;0,0,-1];b_theta = [5;5;5;5;5;5];
    Initial_Points = Initial_Points_Generator( bound_vector,Para_num, n,I );
    % The nonnegative constraints for lambda & alpha;
    A_beta = [-1,0,0;0,-1,0];b_beta=[-0.00000001;-0.00000001];
    lambda_hat = Initial_Points(1,1); alpha_hat = Initial_Points(1,2);
    beta_1hat = Initial_Points(1,3); theta_hat = Initial_Points(1,n_add_one:Para_num)';

gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,[beta_1hat;0],theta_hat );

[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,[Para;0]),[lambda_hat;alpha_hat;beta_1hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);
a = [Para_estimator;0;theta_estimator];
b = [lambda_hat;alpha_hat;beta_1hat;0;theta_hat];
t = 1;
while (sum((a-b).^2) >= epsilon) && (t <= T)
lambda_hat = Para_estimator(1);
alpha_hat = Para_estimator(2);
beta_1hat = Para_estimator(3);
theta_hat = theta_estimator;
gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,[beta_1hat;0],theta_hat );
[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,[Para;0]),[lambda_hat;alpha_hat;beta_1hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);%,A_theta,b_theta
b = a;
a = [Para_estimator;0;theta_estimator];
t = t + 1;
end
log_Likelihood_output = -Negative_log_Likelihood_Calcalator( data, [Para_estimator;0], theta_estimator, N, n);


    
 for m = 2:I
lambda_hat = Initial_Points(m,1); alpha_hat = Initial_Points(m,2);
beta_1hat = Initial_Points(m,3); theta_hat = Initial_Points(m,n_add_one:Para_num)';

gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,[beta_1hat;0],theta_hat );

[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,[Para;0]),[lambda_hat;alpha_hat;beta_1hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);
a = [Para_estimator;0;theta_estimator];
b = [lambda_hat;alpha_hat;beta_1hat;0;theta_hat];
t = 1;
while (sum((a-b).^2) >= epsilon) && (t <= T)
lambda_hat = Para_estimator(1);
alpha_hat = Para_estimator(2);
beta_1hat = Para_estimator(3);
theta_hat = theta_estimator;
gamma_hat = Efunction( data,N,n,lambda_hat,alpha_hat,[beta_1hat;0],theta_hat );
[Para_estimator,~] = fmincon(@(Para)Lxv_nonfix( data,n,gamma_hat,[Para;0]),[lambda_hat;alpha_hat;beta_1hat],A_beta,b_beta);
[theta_estimator,~] = fmincon(@(theta)Lz( X,N,gamma_hat,theta ),theta_hat,A_theta,b_theta);%,A_theta,b_theta
b = a;
a = [Para_estimator;0;theta_estimator];
t = t + 1;
end
temp_log_Likelihood_output  = -Negative_log_Likelihood_Calcalator( data, [Para_estimator;0], theta_estimator, N, n);
        if temp_log_Likelihood_output > log_Likelihood_output
            log_Likelihood_output = temp_log_Likelihood_output;
        end

end
    Likelihood(i) = log_Likelihood_output;
end
end