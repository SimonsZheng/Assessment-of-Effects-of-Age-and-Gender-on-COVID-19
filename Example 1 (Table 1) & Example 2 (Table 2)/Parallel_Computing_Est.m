function [ Est] = Parallel_Computing_Est( Data,bound_vector, K, I, epsilon, T, N, n, n_add_one, Para_num)
% This is a subroutine program to calculate the estimate under Rnd"I" setting.
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
%       Est -- A K*Para_num matrix, containing the K estimates from K simu-
%              lated datasets and of which each row is a estimate of the P-
%              ara_num-dimensional unknown parameter vector.
Est = zeros(K,Para_num);
parfor i = 1:K
    data = Data{i};
    X = data(:,2:n-1);
    Initial_Points=Initial_Points_Generator( bound_vector,Para_num, n,I );
    % The nonnegative constraints for lambda & alpha;
    A_beta = [-1,0,0,0;0,-1,0,0;];b_beta=[-0.00000001;-0.00000001]; 
    lambda_hat = Initial_Points(1,1); alpha_hat = Initial_Points(1,2);
    beta_hat = Initial_Points(1,3:n)'; theta_hat = Initial_Points(1,n_add_one:Para_num)';

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
output1 = a;
log_Likelihood_output1 = -Negative_log_Likelihood_Calcalator( data, Para_estimator, theta_estimator, N, n);


    
 for m = 2:I
lambda_hat = Initial_Points(m,1); alpha_hat = Initial_Points(m,2);
beta_hat = Initial_Points(m,3:n)'; theta_hat = Initial_Points(m,n_add_one:Para_num)';

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
temp_log_Likelihood_output1  = -Negative_log_Likelihood_Calcalator( data, Para_estimator, theta_estimator, N, n);
        if temp_log_Likelihood_output1 > log_Likelihood_output1
            output1 = [Para_estimator',theta_estimator'];
            log_Likelihood_output1 = temp_log_Likelihood_output1;
        end

end
    Est(i,:) = output1
end
end